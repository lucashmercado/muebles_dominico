<?php
use App as A;
require_once __DIR__ . '/../src/cart.php';

$pid = isset($_POST['pid']) ? (int)$_POST['pid'] : (int)($_GET['pid'] ?? 0);
$qty = isset($_POST['qty']) ? (int)$_POST['qty'] : 1;

if ($pid > 0) A\cart_add($pid, max(1, $qty));

$back = $_SERVER['HTTP_REFERER'] ?? './cart.php';
header("Location: " . $back);
