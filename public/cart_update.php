<?php
use App as A;
require_once __DIR__ . '/../src/cart.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['q'])) {
  foreach ($_POST['q'] as $pid => $qty) {
    A\cart_set((int)$pid, (int)$qty);
  }
}
header("Location: cart.php");
