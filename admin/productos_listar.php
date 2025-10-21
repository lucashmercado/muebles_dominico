<?php
require __DIR__ . '/guard.php';
use App as A;
require_once __DIR__ . '/../src/db.php';
require_once __DIR__ . '/../src/productos.php';
require_once __DIR__ . '/../src/util.php';

$q = $_GET['q'] ?? null;
$items = A\productos_listar(null, $q);
?>
<!doctype html>
<html lang="es">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Admin – Productos</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container py-4">
  <div class="d-flex align-items-center mb-3">
    <h1 class="h4 mb-0">Productos</h1>
    <a class="btn btn-primary ms-auto" href="productos_editar.php">Nuevo</a>
  </div>
  <form class="row g-2 mb-3" method="get">
    <div class="col"><input name="q" class="form-control" placeholder="Buscar..." value="<?= htmlspecialchars($q ?? '') ?>"></div>
    <div class="col-auto"><button class="btn btn-outline-secondary">Filtrar</button></div>
  </form>
  <table class="table table-sm table-striped">
    <thead><tr><th>Nombre</th><th>Medida</th><th>Precio</th><th></th></tr></thead>
    <tbody>
      <?php foreach ($items as $it): ?>
        <tr>
          <td><?= htmlspecialchars($it['nombre']) ?></td>
          <td><?= htmlspecialchars($it['medida'] ?? '') ?></td>
          <td><?= A\price_format((int)$it['precio']) ?></td>
          <td class="text-end">
            <a class="btn btn-sm btn-outline-primary" href="productos_editar.php?id=<?= (int)$it['id'] ?>">Editar</a>
          </td>
        </tr>
      <?php endforeach; ?>
    </tbody>
  </table>
</div>
</body>
</html>
