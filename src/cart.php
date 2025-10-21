<?php
namespace App;

require_once __DIR__ . '/db.php';
require_once __DIR__ . '/productos.php';

function cart_start(): void {
  if (session_status() !== PHP_SESSION_ACTIVE) session_start();
  if (!isset($_SESSION['cart'])) $_SESSION['cart'] = []; // pid => ['id','nombre','medida','precio','qty','imagen']
}

function cart_add(int $pid, int $qty = 1): void {
  cart_start();
  $p = producto_get($pid);
  if (!$p) return;
  $key = (string)$pid;
  if (!isset($_SESSION['cart'][$key])) {
    $_SESSION['cart'][$key] = [
      'id' => (int)$p['id'],
      'nombre' => $p['nombre'],
      'medida' => $p['medida'] ?? '',
      'precio' => (int)$p['precio'],
      'qty' => 0,
      'imagen' => $p['imagen'] ?? null,
    ];
  }
  $_SESSION['cart'][$key]['qty'] += max(1, $qty);
}

function cart_set(int $pid, int $qty): void {
  cart_start();
  $key = (string)$pid;
  if (isset($_SESSION['cart'][$key])) {
    if ($qty <= 0) { unset($_SESSION['cart'][$key]); return; }
    $_SESSION['cart'][$key]['qty'] = $qty;
  }
}

function cart_remove(int $pid): void {
  cart_start();
  unset($_SESSION['cart'][(string)$pid]);
}

function cart_clear(): void {
  cart_start();
  $_SESSION['cart'] = [];
}

function cart_items(): array {
  cart_start();
  return array_values($_SESSION['cart']);
}

function cart_count(): int {
  cart_start();
  $n = 0;
  foreach ($_SESSION['cart'] as $row) $n += (int)$row['qty'];
  return $n;
}

function cart_total(): int {
  cart_start();
  $t = 0;
  foreach ($_SESSION['cart'] as $row) $t += (int)$row['precio'] * (int)$row['qty'];
  return $t;
}
