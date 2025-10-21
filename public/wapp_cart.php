<?php
use App as A;
require_once __DIR__ . '/../src/cart.php';
require_once __DIR__ . '/../src/util.php';

$items = A\cart_items();
if (empty($items)) { header('Location: cart.php'); exit; }

$lineas = ["Hola! Quiero hacer este pedido:"];
foreach ($items as $r) {
  $lineas[] = "- {$r['nombre']}" . ($r['medida'] ? " ({$r['medida']})" : "") .
              " x{$r['qty']} — " . A\price_format((int)$r['precio']);
}
$lineas[] = "Total: " . A\price_format(A\cart_total());

$msg = implode("\n", $lineas);
$href = A\wapp_link($msg);

// Si querés vaciar carrito tras enviar:
# A\cart_clear();

header("Location: " . $href);
