<?php
use App as A;
require_once __DIR__ . '/../src/util.php';
?>
<!doctype html>
<html lang="es">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Quiénes somos – Muebles de Pino Dominico</title>
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
    <h1 class="brand-serif">Quiénes somos</h1>
    <p class="mb-0 text-secondary">Muebles de pino macizo, hechos con dedicación, a precio justo.</p>
  </div>

  <div class="row g-4">
    <div class="col-md-7">
      <p>Somos un taller familiar dedicado a fabricar <strong>muebles de pino</strong> con terminación prolija y medidas pensadas para el día a día. Trabajamos bajo pedido y contamos con stock en modelos seleccionados.</p>
      <p>Buscamos que la compra sea simple: catálogo claro, precios actualizados y <strong>pedido directo por WhatsApp</strong>. Si necesitás otra medida, te asesoramos.</p>
      <p class="mb-0">Gracias por elegirnos 🤝</p>
    </div>
    <div class="col-md-5">
      <div class="p-3 rounded" style="background:linear-gradient(180deg,#fff,#f5efe7);border:1px solid var(--border)">
        <h5 class="mb-2">Datos útiles</h5>
        <ul class="mb-0">
          <li>Atención: Lunes a Sábado</li>
          <li>Zona: <em>Dominico, Avellaneda</em></li>
          <li>Medios de pago: Efectivo / Transferencia</li>
        </ul>
      </div>
    </div>
  </div>
</main>

<footer class="footer text-center">
  <div class="container">
    <div class="d-flex flex-wrap gap-3 justify-content-center mb-2">
      <a class="link-muted" href="./">Catálogo</a>
      <span class="text-secondary">·</span>
      <a class="link-muted" href="contacto.php">Contacto</a>
      <span class="text-secondary">·</span>
      <a class="link-muted" href="<?= A\wapp_link('Hola! Tengo una consulta.') ?>">WhatsApp</a>
    </div>
    <div>© <?= date('Y') ?> Muebles de Pino Dominico</div>
  </div>
</footer>
</body>
</html>
