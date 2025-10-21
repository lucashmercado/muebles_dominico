<?php
require __DIR__ . '/guard.php';
use App as A;

require_once __DIR__ . '/../src/db.php';
require_once __DIR__ . '/../src/productos.php';

$pid = isset($_GET['pid']) ? (int)$_GET['pid'] : 0;
$id  = isset($_GET['id']) ? (int)$_GET['id'] : 0;

if ($pid && $id) {
  $pdo = A\db();
  // obtener ruta para eliminar archivo
  $st = $pdo->prepare("SELECT archivo FROM imagenes_producto WHERE id=? AND producto_id=?");
  $st->execute([$id, $pid]);
  if ($row = $st->fetch()) {
    $ruta = __DIR__ . '/../public/assets/img/' . $row['archivo'];
    A\imagen_eliminar($id, $pid);
    if (is_file($ruta)) @unlink($ruta);
  }
}
header('Location: productos_editar.php?id=' . $pid);
