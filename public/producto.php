<?php
use App as A;

require_once __DIR__ . '/../src/db.php';
require_once __DIR__ . '/../src/productos.php';
require_once __DIR__ . '/../src/util.php';
require_once __DIR__ . '/../src/cart.php';

$id = isset($_GET['id']) ? (int)$_GET['id'] : 0;
$prod = $id ? A\producto_get($id) : null;
if (!$prod) { http_response_code(404); echo "Producto no encontrado"; exit; }

$countCart = A\cart_count();

/* --- Galería --- */
$pdo = A\db();
$st = $pdo->prepare("SELECT archivo FROM imagenes_producto WHERE producto_id=? ORDER BY COALESCE(orden,999), id");
$st->execute([$id]);
$galeriaRows = $st->fetchAll();

$portada = !empty($prod['imagen']) ? $prod['imagen'] : 'placeholder.webp';
$imgs = array_map(fn($r) => $r['archivo'], $galeriaRows);
if (!empty($prod['imagen'])) array_unshift($imgs, $prod['imagen']);
$imgs = array_values(array_unique($imgs));
if (empty($imgs)) $imgs = [$portada];
?>
<!doctype html>
<html lang="es">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title><?= htmlspecialchars($prod['nombre']) ?> – Muebles de Pino Dominico</title>

  <!-- Fuentes -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&family=Playfair+Display:wght@600;700&display=swap" rel="stylesheet">

  <!-- Bootstrap + estilos -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="assets/css/app.css">

  <!-- SEO básico -->
  <meta name="description" content="<?= htmlspecialchars(($prod['descripcion'] ?: $prod['nombre']) . ' – Muebles de pino en Dominico. Pedidos por WhatsApp.') ?>">
  <meta name="theme-color" content="#8b5e3c">
  <meta property="og:type" content="product">
  <meta property="og:title" content="<?= htmlspecialchars($prod['nombre']) ?> – Muebles de Pino Dominico">
  <meta property="og:image" content="assets/img/<?= htmlspecialchars($imgs[0]) ?>">

  <style>
    .thumb { width:96px; height:72px; object-fit:cover; border-radius:8px; border:1px solid #e5e7eb; cursor:pointer; }
    .thumb.active { outline:3px solid #8b5e3c; }
  </style>
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
      <a href="cart.php" class="btn btn-outline-secondary">
        Pedido <span class="badge bg-secondary"><?= (int)$countCart ?></span>
      </a>
    </div>
  </div>
</nav>

<main class="container py-4">
  <div class="row g-4">
    <!-- Galería -->
    <div class="col-md-6">
      <img id="imgPrincipal"
           src="assets/img/<?= htmlspecialchars($imgs[0]) ?>"
           class="img-fluid rounded shadow-sm mb-2"
           alt="<?= htmlspecialchars($prod['nombre']) ?>"
           style="aspect-ratio:4/3;object-fit:cover">

      <?php if (count($imgs) > 1): ?>
      <div class="d-flex flex-wrap gap-2">
        <?php foreach ($imgs as $i => $a): ?>
          <img loading="lazy"
               src="assets/img/<?= htmlspecialchars($a) ?>"
               class="thumb <?= $i===0?'active':'' ?>"
               data-src="assets/img/<?= htmlspecialchars($a) ?>"
               alt="">
        <?php endforeach; ?>
      </div>
      <?php endif; ?>
    </div>

    <!-- Información del producto -->
    <div class="col-md-6">
      <h1 class="h3 brand-serif mb-1"><?= htmlspecialchars($prod['nombre']) ?></h1>
      <?php if (!empty($prod['medida'])): ?>
        <div class="text-muted mb-2">Medida: <?= htmlspecialchars($prod['medida']) ?></div>
      <?php endif; ?>
      <div class="price-badge mb-3"><?= A\price_format((int)$prod['precio']) ?></div>

      <p><?= nl2br(htmlspecialchars($prod['descripcion'] ?: 'Producto de fabricación propia en pino macizo. Consultanos por otras medidas o terminaciones.')) ?></p>

      <!-- Carrito -->
      <form class="d-flex gap-2 mt-3" action="cart_add.php" method="post">
        <input type="hidden" name="pid" value="<?= (int)$prod['id'] ?>">
        <input class="form-control" type="number" name="qty" value="1" min="1" style="max-width:120px">
        <button class="btn btn-outline-primary">Agregar al pedido</button>
        <a class="btn btn-secondary" href="cart.php">Ver pedido</a>
      </form>

      <!-- WhatsApp directo -->
      <a class="btn btn-primary w-100 mt-3"
         href="<?= A\wapp_link('Hola! Quiero consultar este pedido:\n- ' . $prod['nombre'] . ' ' . ($prod['medida'] ?? '') . ' (' . A\price_format((int)$prod['precio']) . ')') ?>">
         Pedir por WhatsApp
      </a>
    </div>
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


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
  // Cambiar imagen principal al hacer click en miniaturas
  document.querySelectorAll('.thumb').forEach(t => {
    t.addEventListener('click', () => {
      const src = t.getAttribute('data-src');
      const main = document.getElementById('imgPrincipal');
      main.setAttribute('src', src);
      document.querySelectorAll('.thumb').forEach(x => x.classList.remove('active'));
      t.classList.add('active');
    });
  });
</script>
</body>
</html>
