<?php
use App as A;
require_once __DIR__ . '/../src/cart.php';
require_once __DIR__ . '/../src/util.php';

A\cart_start();
$items = A\cart_items();
$total = A\cart_total();
$cnt   = A\cart_count();
?>
<!doctype html>
<html lang="es">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Tu pedido – Muebles de Pino Dominico</title>

  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&family=Playfair+Display:wght@600;700&display=swap" rel="stylesheet">

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="assets/css/app.css">
</head>
<body class="with-wood">
<nav class="navbar navbar-expand-lg">
  <div class="container">
    <a class="navbar-brand d-flex align-items-center gap-2" href="/muebles_dominico/public/">
      <span class="brand-badge">
        <img src="assets/img/logo.svg" alt="" width="22" height="22" style="display:block">
        <span class="brand-serif">Muebles de Pino Dominico</span>
      </span>
    </a>
  </div>
</nav>

<main class="container py-4">
  <h1 class="h4 brand-serif mb-3">Tu pedido</h1>

  <?php if (empty($items)): ?>
    <div class="alert alert-info">Tu pedido está vacío. Volvé al <a href="./">catálogo</a>.</div>
  <?php else: ?>
    <form action="cart_update.php" method="post">
      <div class="table-responsive">
        <table class="table align-middle">
          <thead>
            <tr><th>Producto</th><th class="text-center">Cantidad</th><th class="text-end">Precio</th><th class="text-end">Subtotal</th><th></th></tr>
          </thead>
          <tbody>
            <?php foreach ($items as $r): ?>
              <tr>
                <td>
                  <div class="d-flex align-items-center gap-2">
                    <img src="assets/img/<?= htmlspecialchars($r['imagen'] ?: 'placeholder.webp') ?>" width="64" height="48" style="object-fit:cover;border-radius:8px;border:1px solid #e5e7eb">
                    <div>
                      <div class="fw-semibold"><?= htmlspecialchars($r['nombre']) ?></div>
                      <?php if (!empty($r['medida'])): ?><div class="text-muted small"><?= htmlspecialchars($r['medida']) ?></div><?php endif; ?>
                    </div>
                  </div>
                </td>
                <td class="text-center" style="max-width:90px">
                  <input class="form-control form-control-sm text-center" type="number" min="0" name="q[<?= (int)$r['id'] ?>]" value="<?= (int)$r['qty'] ?>">
                </td>
                <td class="text-end"><?= A\price_format((int)$r['precio']) ?></td>
                <td class="text-end"><?= A\price_format((int)$r['precio'] * (int)$r['qty']) ?></td>
                <td class="text-end">
                  <a class="btn btn-sm btn-outline-danger" href="cart_remove.php?pid=<?= (int)$r['id'] ?>">Quitar</a>
                </td>
              </tr>
            <?php endforeach; ?>
          </tbody>
          <tfoot>
            <tr>
              <th colspan="2">Ítems: <?= (int)$cnt ?></th>
              <th class="text-end">Total</th>
              <th class="text-end"><?= A\price_format((int)$total) ?></th>
              <th></th>
            </tr>
          </tfoot>
        </table>
      </div>

      <div class="d-flex flex-wrap gap-2">
        <button class="btn btn-outline-secondary">Actualizar cantidades</button>
        <a class="btn btn-outline-danger" href="cart_clear.php" onclick="return confirm('Vaciar todo el pedido?')">Vaciar</a>
        <a class="btn btn-primary ms-auto" href="wapp_cart.php">Enviar por WhatsApp</a>
      </div>
    </form>
  <?php endif; ?>
</main>
</body>
</html>
