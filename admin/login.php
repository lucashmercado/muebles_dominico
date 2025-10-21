<?php
session_start();
require_once __DIR__ . '/../src/db.php';

use function App\db;

$usuario = $_POST['usuario'] ?? '';
$clave = $_POST['clave'] ?? '';

if ($usuario === '' || $clave === '') {
  header('Location: index.php?e=Datos incompletos'); exit;
}

$pdo = db();
$st = $pdo->prepare("SELECT * FROM usuarios WHERE usuario=?");
$st->execute([$usuario]);
$row = $st->fetch();

if ($row && password_verify($clave, $row['clave_hash'])) {
  $_SESSION['uid'] = $row['id'];
  $_SESSION['user'] = $row['usuario'];
  header('Location: dashboard.php'); exit;
} else {
  header('Location: index.php?e=Usuario o clave inválidos'); exit;
}
