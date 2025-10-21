<?php
use App as A;
require_once __DIR__ . '/../src/util.php';
?>
<!doctype html>
<html lang="es">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Contacto – Muebles de Pino Dominico</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&family=Playfair+Display:wght@600;700&display=swap" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="assets/css/app.css">
</head>
<body>
<nav class="navbar navbar-expand-lg">
  <div class="container">
    <a class="navbar-brand d-flex align-items-center gap-2" href="/muebles_dominico/public/">
      <span class="brand-badge">
        <img src="assets/img/logo.svg" width="22" height="22" alt="">
        <span class="brand-serif">Muebles de Pino Dominico</span>
      </span>
    </a>
  </div>
</nav>

<main class="container py-4">
  <div class="hero mb-3">
    <h1 class="brand-serif">Contacto</h1>
    <div class="text-secondary">Escribinos por WhatsApp o visitanos.</div>
  </div>

  <div class="row g-4">
    <div class="col-lg-6">
      <div class="p-3 rounded" style="background:linear-gradient(180deg,#fff,#f5efe7);border:1px solid var(--border)">
        <h5 class="mb-3">WhatsApp</h5>
        <a class="btn btn-primary" href="<?= A\wapp_link('Hola! Quiero consultar por un mueble.') ?>">Chatear ahora</a>
        <p class="mt-3 mb-0 text-secondary small">Atendemos rápido por WhatsApp. Contanos el modelo y la medida que te interesa.</p>
      </div>
    </div>
    <div class="col-lg-6">
      <h5 class="mb-2">Cómo llegar</h5>
      <!-- Reemplazá src con tu ubicación exacta si querés -->
      <div class="ratio ratio-16x9 rounded border" style="border-color:var(--border)!important;">
        <iframe
          src="https://www.google.com/maps?q=Dominico%20Avellaneda&output=embed"
          allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
      </div>
    </div>
  </div>
</main>

<footer class="footer text-center">
  <div class="container">
    <div class="d-flex flex-wrap gap-3 justify-content-center mb-2">
      <a class="link-muted" href="./">Catálogo</a>
      <span class="text-secondary">·</span>
      <a class="link-muted" href="nosotros.php">Quiénes somos</a>
      <span class="text-secondary">·</span>
      <a class="link-muted" href="<?= A\wapp_link('Hola! Tengo una consulta.') ?>">WhatsApp</a>
    </div>
    <div>© <?= date('Y') ?> Muebles de Pino Dominico</div>
  </div>
</footer>
</body>
</html>
