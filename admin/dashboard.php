<?php require __DIR__ . '/guard.php'; ?>
<!doctype html>
<html lang="es">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Admin – Dashboard</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<nav class="navbar navbar-expand-lg bg-body-tertiary">
  <div class="container">
    <a class="navbar-brand" href="#">Admin</a>
    <div class="ms-auto">
      <a class="btn btn-outline-danger btn-sm" href="logout.php">Salir</a>
    </div>
  </div>
</nav>
<div class="container py-4">
  <div class="row g-3">
    <div class="col-md-4">
      <a class="text-decoration-none" href="productos_listar.php">
        <div class="card shadow-sm">
          <div class="card-body">
            <h5 class="card-title mb-0">Productos</h5>
            <small class="text-muted">Listar y editar</small>
          </div>
        </div>
      </a>
    </div>
    <div class="col-md-4">
      <a class="text-decoration-none" href="importar_precios.php">
        <div class="card shadow-sm">
          <div class="card-body">
            <h5 class="card-title mb-0">Importar precios (PDF)</h5>
            <small class="text-muted">Actualizar desde listado</small>
          </div>
        </div>
      </a>
    </div>
  </div>
</div>
</body>
</html>
