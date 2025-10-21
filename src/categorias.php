<?php
namespace App;

require_once __DIR__ . '/db.php';

function categorias_listar(): array {
  $pdo = db();
  $st = $pdo->query("SELECT id, nombre FROM categorias ORDER BY nombre");
  return $st->fetchAll();
}
