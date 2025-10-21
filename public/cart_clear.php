<?php
use App as A;
require_once __DIR__ . '/../src/cart.php';

A\cart_clear();
header("Location: cart.php");
