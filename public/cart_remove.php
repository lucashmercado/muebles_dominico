<?php
use App as A;
require_once __DIR__ . '/../src/cart.php';

$pid = isset($_GET['pid']) ? (int)$_GET['pid'] : 0;
if ($pid) A\cart_remove($pid);
header("Location: cart.php");
