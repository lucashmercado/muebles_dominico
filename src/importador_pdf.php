<?php
namespace App;

use Smalot\PdfParser\Parser;

require_once __DIR__ . '/db.php';

function normalizar_precio(string $raw): int {
  $raw = trim($raw);
  $raw = str_replace(['.', ' '], '', $raw);
  $raw = str_replace(',', '.', $raw);
  return (int) round((float) $raw);
}

function parsear_pdf_a_items(string $ruta_pdf): array {
  $parser = new Parser();
  $pdf = $parser->parseFile($ruta_pdf);
  $text = $pdf->getText();
  $lineas = preg_split('/\r?\n/u', $text);

  $items = [];
  foreach ($lineas as $ln) {
    $ln = trim($ln);
    if ($ln === '') continue;
    if (preg_match('/^(.*?)\s*\$\s*([\d\.\,]+)/u', $ln, $m)) {
      $nombre_medida = trim($m[1]);
      $precio = normalizar_precio($m[2]);
      $medida = null;
      if (preg_match('/(\d+[\,\.]?\d*\s*x\s*\d+[\,\.]?\d+.*)$/ui', $nombre_medida, $mm)) {
        $medida = trim($mm[1]);
        $nombre = trim(str_replace($medida, '', $nombre_medida));
      } else {
        $nombre = $nombre_medida;
      }
      $items[] = ['nombre'=>$nombre, 'medida'=>$medida, 'precio'=>$precio];
    }
  }
  return $items;
}
