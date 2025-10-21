<?php
require __DIR__ . '/guard.php';
use App as A;

require_once __DIR__ . '/../src/db.php';

$pid = isset($_GET['pid']) ? (int)$_GET['pid'] : 0;
$img = isset($_GET['img']) ? $_GET['img'] : '';

if ($pid && $img) {
  $pdo = A\db();
  $st = $pdo->prepare("UPDATE productos SET imagen=? WHERE id=?");
  $st->execute([$img, $pid]);
}
header('Location: productos_editar.php?id=' . $pid);
