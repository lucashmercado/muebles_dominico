<?php
require __DIR__ . '/guard.php';
use App as A;

require_once __DIR__ . '/../src/db.php';
require_once __DIR__ . '/../src/productos.php';
require_once __DIR__ . '/../src/util.php';
require_once __DIR__ . '/../src/categorias.php';

$pdo = A\db();
$id = isset($_GET['id']) ? (int)$_GET['id'] : null;
$msg = null;

// asegurar carpeta destino
$dirGaleria = __DIR__ . '/../public/assets/img/products/';
if (!is_dir($dirGaleria)) @mkdir($dirGaleria, 0775, true);

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
  $data = [
    'id' => $_POST['id'] ?? null,
    'nombre' => $_POST['nombre'] ?? '',
    'medida' => $_POST['medida'] ?? null,
    'precio' => (int)($_POST['precio'] ?? 0),
    'descripcion' => $_POST['descripcion'] ?? null,
    'categoria_id' => !empty($_POST['categoria_id']) ? (int)$_POST['categoria_id'] : null,
    'activo' => isset($_POST['activo']) ? 1 : 0,
    'sku' => $_POST['sku'] ?? null,
    'imagen' => $_POST['imagen_actual'] ?? null,
    'destacado' => isset($_POST['destacado']) ? 1 : 0,
    'orden_destacado' => $_POST['orden_destacado'] !== '' ? (int)$_POST['orden_destacado'] : null,
  ];

  // portada (imagen principal) opcional (archivo suelto)
  if (!empty($_FILES['imagen']['name']) && $_FILES['imagen']['error'] === UPLOAD_ERR_OK) {
    $ext = strtolower(pathinfo($_FILES['imagen']['name'], PATHINFO_EXTENSION));
    $permitidas = ['jpg','jpeg','png','webp'];
    if (in_array($ext, $permitidas, true)) {
      $nombreFile = 'prod_' . uniqid() . '.' . $ext;
      $destino = __DIR__ . '/../public/assets/img/' . $nombreFile;
      if (move_uploaded_file($_FILES['imagen']['tmp_name'], $destino)) {
        $data['imagen'] = $nombreFile; // portada en productos.imagen
      }
    }
  }

  // upsert base
  $id = A\producto_upsert($data);

  // actualizar extras
  $st = $pdo->prepare("UPDATE productos SET categoria_id=?, destacado=?, orden_destacado=?, imagen=? WHERE id=?");
  $st->execute([$data['categoria_id'], $data['destacado'], $data['orden_destacado'], $data['imagen'], $id]);

  // ---- GALERÍA: múltiples archivos ----
  if (!empty($_FILES['galeria']['name'][0])) {
    $files = $_FILES['galeria'];
    $permitidas = ['jpg','jpeg','png','webp'];
    for ($i=0; $i<count($files['name']); $i++) {
      if ($files['error'][$i] !== UPLOAD_ERR_OK) continue;
      $ext = strtolower(pathinfo($files['name'][$i], PATHINFO_EXTENSION));
      if (!in_array($ext, $permitidas, true)) continue;

      $nombreFile = 'g_' . $id . '_' . uniqid() . '.' . $ext;
      $destino = $dirGaleria . $nombreFile;
      if (move_uploaded_file($files['tmp_name'][$i], $destino)) {
        A\imagen_agregar($id, 'products/' . $nombreFile, null);
      }
    }
  }

  $msg = "Guardado OK";
}

$prod = $id ? A\producto_get($id) : [
  'nombre'=>'','medida'=>'','precio'=>0,'descripcion'=>'','sku'=>'','activo'=>1,'imagen'=>null,'categoria_id'=>null,'destacado'=>0,'orden_destacado'=>null
];
$cats = A\categorias_listar();
$galeria = $id ? A\imagenes_listar($id) : [];
?>
<!doctype html>
<html lang="es">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Admin – Editar producto</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    .thumb { width:120px; height:90px; object-fit:cover; border-radius:8px; border:1px solid #e5e7eb; }
  </style>
</head>
<body>
<div class="container py-4">
  <a href="productos_listar.php" class="btn btn-link">&larr; Volver</a>
  <h1 class="h4">Editar producto</h1>
  <?php if ($msg): ?><div class="alert alert-success"><?= htmlspecialchars($msg) ?></div><?php endif; ?>

  <form method="post" enctype="multipart/form-data">
    <input type="hidden" name="id" value="<?= htmlspecialchars((string)($prod['id'] ?? '')) ?>">
    <input type="hidden" name="imagen_actual" value="<?= htmlspecialchars($prod['imagen'] ?? '') ?>">

    <div class="row g-3">
      <div class="col-md-6">
        <label class="form-label">Nombre</label>
        <input class="form-control" name="nombre" required value="<?= htmlspecialchars($prod['nombre'] ?? '') ?>">
      </div>
      <div class="col-md-3">
        <label class="form-label">Medida</label>
        <input class="form-control" name="medida" value="<?= htmlspecialchars($prod['medida'] ?? '') ?>">
      </div>
      <div class="col-md-3">
        <label class="form-label">Precio (ARS)</label>
        <input class="form-control" name="precio" type="number" min="0" step="1" value="<?= (int)($prod['precio'] ?? 0) ?>">
      </div>

      <div class="col-md-4">
        <label class="form-label">Categoría</label>
        <select class="form-select" name="categoria_id">
          <option value="">(Sin categoría)</option>
          <?php foreach ($cats as $c): ?>
            <option value="<?= (int)$c['id'] ?>" <?= (!empty($prod['categoria_id']) && (int)$prod['categoria_id']===(int)$c['id'])?'selected':'' ?>>
              <?= htmlspecialchars($c['nombre']) ?>
            </option>
          <?php endforeach; ?>
        </select>
      </div>

      <div class="col-md-4">
        <label class="form-label">Imagen portada (jpg, png, webp)</label>
        <input class="form-control" type="file" name="imagen" accept=".jpg,.jpeg,.png,.webp">
        <?php if (!empty($prod['imagen'])): ?>
          <div class="mt-2">
            <img src="../public/assets/img/<?= htmlspecialchars($prod['imagen']) ?>" alt="" style="max-width:160px;border:1px solid #eee;padding:4px;border-radius:8px">
          </div>
        <?php endif; ?>
      </div>

      <div class="col-md-2 form-check mt-4">
        <input class="form-check-input" type="checkbox" name="activo" id="activo" <?= !empty($prod['activo']) ? 'checked' : '' ?>>
        <label class="form-check-label" for="activo">Activo</label>
      </div>

      <div class="col-md-2 form-check mt-4">
        <input class="form-check-input" type="checkbox" name="destacado" id="destacado" <?= !empty($prod['destacado']) ? 'checked' : '' ?>>
        <label class="form-check-label" for="destacado">Destacado</label>
      </div>

      <div class="col-md-3">
        <label class="form-label">Orden destacado</label>
        <input class="form-control" type="number" name="orden_destacado" value="<?= htmlspecialchars((string)($prod['orden_destacado'] ?? '')) ?>" placeholder="Ej: 1, 2, 3...">
      </div>

      <div class="col-12">
        <label class="form-label">Descripción</label>
        <textarea class="form-control" name="descripcion" rows="3"><?= htmlspecialchars($prod['descripcion'] ?? '') ?></textarea>
      </div>

      <div class="col-md-3">
        <label class="form-label">SKU</label>
        <input class="form-control" name="sku" value="<?= htmlspecialchars($prod['sku'] ?? '') ?>">
      </div>

      <!-- GALERÍA -->
      <div class="col-12">
        <label class="form-label">Galería (múltiples imágenes)</label>
        <input class="form-control" type="file" name="galeria[]" accept=".jpg,.jpeg,.png,.webp" multiple>
        <div class="form-text">Podés seleccionar varias a la vez. Tamaño sugerido 1200×900, formato .webp o .jpg</div>
      </div>
    </div>

    <div class="mt-3">
      <button class="btn btn-primary">Guardar</button>
    </div>
  </form>

  <?php if ($id && !empty($galeria)): ?>
    <hr class="my-4">
    <h2 class="h5">Galería actual</h2>
    <div class="d-flex flex-wrap gap-3">
      <?php foreach ($galeria as $g): ?>
        <div class="text-center">
          <img class="thumb" src="../public/assets/img/<?= htmlspecialchars($g['archivo']) ?>" alt="">
          <div class="mt-2 d-flex gap-2 justify-content-center">
            <a class="btn btn-sm btn-outline-primary" href="set_portada.php?pid=<?= (int)$id ?>&img=<?= urlencode($g['archivo']) ?>">Portada</a>
            <a class="btn btn-sm btn-outline-danger" href="imagen_borrar.php?pid=<?= (int)$id ?>&id=<?= (int)$g['id'] ?>" onclick="return confirm('¿Borrar imagen?')">Borrar</a>
          </div>
        </div>
      <?php endforeach; ?>
    </div>
  <?php endif; ?>
</div>
</body>
</html>
