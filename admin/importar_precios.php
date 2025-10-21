<?php
require __DIR__ . '/guard.php';
use App as A;

require_once __DIR__ . '/../src/db.php';
require_once __DIR__ . '/../src/importador_pdf.php';
require_once __DIR__ . '/../src/productos.php';
require_once __DIR__ . '/../src/util.php';

$info = null;

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_FILES['precios']) && $_FILES['precios']['error'] === UPLOAD_ERR_OK) {
  $tmp = $_FILES['precios']['tmp_name'];
  $items = A\parsear_pdf_a_items($tmp);

  $pdo = A\db();

  // 1) Cargar todos los productos actuales y armar mapa normalizado
  $st = $pdo->query("SELECT id, nombre, medida, precio FROM productos");
  $exist = $st->fetchAll();
  $map = []; // clave: norm(nombre).'|'.norm(medida)  => ['id'=>..,'precio'=>..]
  foreach ($exist as $e) {
    $key = A\normalize_str($e['nombre']) . '|' . A\normalize_str($e['medida'] ?? '');
    $map[$key] = ['id'=>(int)$e['id'], 'precio'=>(int)$e['precio']];
  }

  // 2) Recorrer los ítems del PDF y upsert por la clave normalizada
  $creados=0; $actualizados=0;
  $pdo->beginTransaction();
  foreach ($items as $it) {
    $nombre = trim($it['nombre'] ?? '');
    $medida = trim($it['medida'] ?? '');
    $precio = (int)($it['precio'] ?? 0);

    $key = A\normalize_str($nombre) . '|' . A\normalize_str($medida);

    if (isset($map[$key])) {
      // existe → actualizar SOLO precio si cambió
      $id = $map[$key]['id'];
      if ((int)$map[$key]['precio'] !== $precio) {
        $up = $pdo->prepare("UPDATE productos SET precio=?, updated_at=NOW() WHERE id=?");
        $up->execute([$precio, $id]);
        $map[$key]['precio'] = $precio;
        $actualizados++;
      }
    } else {
      // no existe → crear (imagen queda NULL), no tocamos nada más
      $in = $pdo->prepare("INSERT INTO productos (nombre, medida, precio, activo) VALUES (?,?,?,1)");
      $in->execute([$nombre !== '' ? $nombre : 'SIN NOMBRE', ($medida !== '' ? $medida : null), $precio]);
      $id = (int)$pdo->lastInsertId();
      $map[$key] = ['id'=>$id, 'precio'=>$precio];
      $creados++;
    }
  }
  $pdo->commit();

  $info = ['total'=>count($items), 'creados'=>$creados, 'actualizados'=>$actualizados];
}
?>
<!doctype html>
<html lang="es">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Admin – Importar precios</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container py-4">
  <a href="dashboard.php" class="btn btn-link">&larr; Volver</a>
  <h1 class="h4 mb-3">Importar precios desde PDF</h1>
  <?php if ($info): ?>
    <div class="alert alert-success">
      Procesados: <?= (int)$info['total'] ?> — Creados: <?= (int)$info['creados'] ?> — Actualizados: <?= (int)$info['actualizados'] ?>
    </div>
  <?php endif; ?>
  <form method="post" enctype="multipart/form-data">
    <div class="mb-3">
      <label class="form-label">Archivo PDF de precios</label>
      <input class="form-control" type="file" name="precios" accept="application/pdf" required>
    </div>
    <button class="btn btn-primary">Importar</button>
  </form>
</div>
</body>
</html>
