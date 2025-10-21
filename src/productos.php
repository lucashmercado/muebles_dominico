<?php
namespace App;

require_once __DIR__ . '/db.php';

function productos_listar(?int $categoria_id = null, ?string $q = null): array {
  $pdo = db();
  $sql = "SELECT p.*, c.nombre AS categoria FROM productos p LEFT JOIN categorias c ON c.id=p.categoria_id WHERE p.activo=1";
  $args = [];
  if ($categoria_id) { $sql .= " AND p.categoria_id = ?"; $args[] = $categoria_id; }
  if ($q) { $sql .= " AND (p.nombre LIKE ? OR p.medida LIKE ?)"; $args[] = "%$q%"; $args[] = "%$q%"; }
  $sql .= " ORDER BY p.nombre ASC, p.medida ASC";
  $st = $pdo->prepare($sql);
  $st->execute($args);
  return $st->fetchAll();
}

function producto_get(int $id): ?array {
  $pdo = db();
  $st = $pdo->prepare("SELECT * FROM productos WHERE id=?");
  $st->execute([$id]);
  $row = $st->fetch();
  return $row ?: null;
}

function producto_upsert(array $data): int {
  $pdo = db();
  if (!empty($data['id'])) {
    $st = $pdo->prepare("UPDATE productos SET nombre=?, medida=?, precio=?, descripcion=?, categoria_id=?, activo=?, sku=?, imagen=? WHERE id=?");
    $st->execute([
      $data['nombre'] ?? '',
      $data['medida'] ?? null,
      (int)($data['precio'] ?? 0),
      $data['descripcion'] ?? null,
      $data['categoria_id'] ?? null,
      isset($data['activo']) ? (int)$data['activo'] : 1,
      $data['sku'] ?? null,
      $data['imagen'] ?? null,
      (int)$data['id']
    ]);
    return (int)$data['id'];
  } else {
    $st = $pdo->prepare("INSERT INTO productos (nombre, medida, precio, descripcion, categoria_id, activo, sku, imagen) VALUES (?,?,?,?,?,?,?,?)");
    $st->execute([
      $data['nombre'] ?? '',
      $data['medida'] ?? null,
      (int)($data['precio'] ?? 0),
      $data['descripcion'] ?? null,
      $data['categoria_id'] ?? null,
      isset($data['activo']) ? (int)$data['activo'] : 1,
      $data['sku'] ?? null,
      $data['imagen'] ?? null,
    ]);
    return (int)$pdo->lastInsertId();
  }
}

function producto_delete(int $id): void {
  $pdo = db();
  $st = $pdo->prepare("DELETE FROM productos WHERE id=?");
  $st->execute([$id]);
}

function productos_destacados(int $limit = 6): array {
  $pdo = db();
  $st = $pdo->prepare(
    "SELECT * FROM productos WHERE activo=1 AND destacado=1
     ORDER BY COALESCE(orden_destacado, 999), updated_at DESC LIMIT ?"
  );
  $st->bindValue(1, $limit, \PDO::PARAM_INT);
  $st->execute();
  return $st->fetchAll();
}
function imagenes_listar(int $producto_id): array {
  $pdo = db();
  $st = $pdo->prepare("SELECT id, archivo, orden, created_at FROM imagenes_producto WHERE producto_id=? ORDER BY COALESCE(orden,999), id");
  $st->execute([$producto_id]);
  return $st->fetchAll();
}

function imagen_agregar(int $producto_id, string $archivo, ?int $orden = null): int {
  $pdo = db();
  $st = $pdo->prepare("INSERT INTO imagenes_producto (producto_id, archivo, orden) VALUES (?,?,?)");
  $st->execute([$producto_id, $archivo, $orden]);
  return (int)$pdo->lastInsertId();
}

function imagen_eliminar(int $id, int $producto_id): void {
  $pdo = db();
  $st = $pdo->prepare("DELETE FROM imagenes_producto WHERE id=? AND producto_id=?");
  $st->execute([$id, $producto_id]);
}
