<?php
require_once __DIR__ . '/../src/db.php';
use function App\db;

$pdo = db();
$st = $pdo->prepare("SELECT usuario, clave_hash FROM usuarios WHERE usuario=?");
$st->execute(['lucas']);
$row = $st->fetch();

if (!$row) { die('Usuario lucas no existe en la DB seleccionada'); }

$ok = password_verify('123', $row['clave_hash']);
var_dump([
  'db' => getenv('DB_NAME') ?: ($_ENV['DB_NAME'] ?? 'no .env'),
  'usuario' => $row['usuario'],
  'password_ok' => $ok,
  'hash_prefix' => substr($row['clave_hash'], 0, 7),
]);
