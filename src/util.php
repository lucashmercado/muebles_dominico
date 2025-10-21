<?php
namespace App;

function price_format(int $price): string {
  return '$ ' . number_format($price, 0, ',', '.');
}

function wapp_link(string $text): string {
  $num = $_ENV['WAPP_NUMBER'] ?? '';
  $msg = urlencode($text);
  return "https://wa.me/{$num}?text={$msg}";
}

/**
 * Normaliza strings para comparar:
 * - trim
 * - minúsculas
 * - colapsa múltiples espacios a uno
 * - quita tildes/acentos
 * - reemplaza guiones/• por espacio
 */
function normalize_str(?string $s): string {
  if ($s === null) return '';
  $s = str_replace(["\r","\n","•","–","—","-","_"], ' ', $s);
  $s = preg_replace('/\s+/u',' ', trim($s) ?: '');
  $s = mb_strtolower($s, 'UTF-8');
  // quitar acentos
  $t = iconv('UTF-8', 'ASCII//TRANSLIT//IGNORE', $s);
  if ($t !== false) $s = $t;
  $s = preg_replace('/\s+/u',' ', trim($s));
  return $s;
}
