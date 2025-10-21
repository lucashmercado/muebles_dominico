<?php
use App as A;

require_once __DIR__ . '/../src/db.php';
require_once __DIR__ . '/../src/productos.php';
require_once __DIR__ . '/../src/categorias.php';
require_once __DIR__ . '/../src/util.php';
require_once __DIR__ . '/../src/cart.php';

$q   = $_GET['q'] ?? null;
$cat = isset($_GET['cat']) && $_GET['cat'] !== '' ? (int)$_GET['cat'] : null;

$categorias = A\categorias_listar();
$destacados = A\productos_destacados(8);
$productos  = A\productos_listar($cat, $q);
$countCart  = A\cart_count();
?>
<!doctype html>
<html lang="es">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Muebles de Pino Dominico</title>

  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&family=Playfair+Display:wght@600;700&display=swap" rel="stylesheet">

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="assets/css/app.css">

  <meta name="description" content="Muebles de pino en Dominico: roperos, alacenas, mesas y más. Fabricación propia. Pedidos por WhatsApp.">
  <meta name="theme-color" content="#8b5e3c">
  <meta property="og:title" content="Muebles de Pino Dominico">
  <meta property="og:image" content="assets/img/placeholder.webp">
</head>
<body class="with-wood">
<nav class="navbar navbar-expand-lg">
  <div class="container">
    <a class="navbar-brand d-flex align-items-center gap-2" href="./">
      <span class="brand-badge">
        <img src="assets/img/logo.svg" width="22" height="22" alt="">
        <span class="brand-serif">Muebles de Pino Dominico</span>
      </span>
    </a>
    <div class="ms-auto d-flex gap-2">
      <a href="<?= A\wapp_link('Hola! Tengo una consulta.') ?>" class="btn btn-success">WhatsApp</a>
      <a href="cart.php" class="btn btn-outline-secondary">
        Pedido <span class="badge bg-secondary"><?= (int)$countCart ?></span>
      </a>
    </div>
  </div>
</nav>

<header class="banner-hero">
  <div class="banner-inner container">
    <h1 class="brand-serif text-glow">Muebles de pino, hechos a medida</h1>
    <p class="text-glow">Fabricación propia en Dominico. Pedilo directo por WhatsApp.</p>
    <a class="btn btn-primary" href="<?= A\wapp_link('Hola! Quiero consultar por un mueble.') ?>">Consultar ahora</a>
    <div class="mt-3">
  <a href="https://www.facebook.com/mpino.mercado" target="_blank" rel="noopener">
    <img src="assets/img/icon_fb.svg" width="28" height="28" alt="Facebook" class="mx-1">
  </a>
  <a href="https://www.instagram.com/muebles.de.pino.dominico" target="_blank" rel="noopener">
    <img src="assets/img/icon_ig.svg" width="28" height="28" alt="Instagram" class="mx-1">
  </a>
</div>

  </div>
</header>

<main class="container py-4">
  <?php if (!empty($destacados)): ?>
  <div id="destacados" class="carousel slide mb-4" data-bs-ride="carousel">
    <div class="carousel-inner">
      <?php foreach ($destacados as $i => $d): ?>
      <div class="carousel-item <?= $i===0 ? 'active' : '' ?>">
        <img src="assets/img/<?= htmlspecialchars($d['imagen'] ?: 'placeholder.webp') ?>" class="d-block w-100" style="max-height:420px;object-fit:cover" alt="">
        <div class="carousel-caption d-none d-md-block">
          <h5><?= htmlspecialchars($d['nombre']) ?></h5>
          <span class="badge bg-success"><?= A\price_format((int)$d['precio']) ?></span>
        </div>
      </div>
      <?php endforeach; ?>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#destacados" data-bs-slide="prev">
      <span class="carousel-control-prev-icon"></span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#destacados" data-bs-slide="next">
      <span class="carousel-control-next-icon"></span>
    </button>
  </div>
  <?php endif; ?>

  <form class="row g-2 mb-3" method="get">
    <div class="col-md-4">
      <select class="form-select" name="cat" onchange="this.form.submit()">
        <option value="">Todas las categorías</option>
        <?php foreach ($categorias as $c): ?>
          <option value="<?= (int)$c['id'] ?>" <?= ($cat==$c['id'])?'selected':'' ?>>
            <?= htmlspecialchars($c['nombre']) ?>
          </option>
        <?php endforeach; ?>
      </select>
    </div>
    <div class="col-md-6">
      <input class="form-control" type="search" name="q" placeholder="Buscar producto o medida" value="<?= htmlspecialchars($q ?? '') ?>">
    </div>
    <div class="col-md-2">
      <button class="btn btn-outline-primary w-100">Buscar</button>
    </div>
  </form>

  <div class="row g-3">
    <?php foreach ($productos as $p): ?>
    <div class="col-12 col-sm-6 col-md-4 col-lg-3">
      <div class="card h-100 shadow-sm">
        <img src="assets/img/<?= htmlspecialchars($p['imagen'] ?: 'placeholder.webp') ?>" class="card-img-top" alt="<?= htmlspecialchars($p['nombre']) ?>">
        <div class="card-body">
          <h5 class="card-title mb-1"><?= htmlspecialchars($p['nombre']) ?></h5>
          <?php if ($p['medida']): ?><div class="text-muted small mb-1"><?= htmlspecialchars($p['medida']) ?></div><?php endif; ?>
          <div class="d-flex justify-content-between align-items-center mb-2">
            <span class="price-badge"><?= A\price_format((int)$p['precio']) ?></span>
            <a href="producto.php?id=<?= (int)$p['id'] ?>" class="btn btn-sm btn-outline-secondary">Ver</a>
          </div>

          <form class="d-flex gap-2 mb-2" action="cart_add.php" method="post">
            <input type="hidden" name="pid" value="<?= (int)$p['id'] ?>">
            <input type="number" class="form-control form-control-sm" name="qty" value="1" min="1" style="max-width:80px">
            <button class="btn btn-sm btn-outline-primary">Agregar</button>
          </form>

          <a href="<?= A\wapp_link('Hola! Quiero consultar este pedido:\n- '.$p['nombre'].' '.$p['medida'].' ('.A\price_format($p['precio']).')') ?>" class="btn btn-primary w-100">Pedir por WhatsApp</a>
        </div>
      </div>
    </div>
    <?php endforeach; ?>
  </div>
</main>

<footer class="footer text-center mt-4 py-4 border-top">
  <div class="container">
    <div class="d-flex flex-wrap justify-content-center align-items-center gap-3 mb-2">
      <a class="link-muted" href="nosotros.php">Quiénes somos</a>
      <a class="link-muted" href="contacto.php">Contacto</a>
      <a class="link-muted" href="<?= A\wapp_link('Hola! Tengo una consulta.') ?>">WhatsApp</a>
    </div>

    <div class="social-links mb-3">
      <a href="https://www.facebook.com/mpino.mercado" target="_blank" rel="noopener" class="mx-2 text-decoration-none">
        <img src="assets/img/icon_fb.svg" alt="Facebook" width="28" height="28">
      </a>
      <a href="https://www.instagram.com/muebles.de.pino.dominico" target="_blank" rel="noopener" class="mx-2 text-decoration-none">
        <img src="assets/img/icon_ig.svg" alt="Instagram" width="28" height="28">
      </a>
    </div>

    <div class="text-secondary small">
      © <?= date('Y') ?> Muebles de Pino Dominico — Hecho en Avellaneda
    </div>
  </div>
</footer>

</body>
</html>
