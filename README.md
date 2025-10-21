# muebles_dominico (MVP 1.0)

Catálogo web simple con precios actualizables desde PDF y pedidos por WhatsApp.

## Requisitos
- PHP 8.1+ con extensiones `mbstring`, `pdo_mysql`, `zip`
- MySQL/MariaDB
- Composer

## Instalación rápida
1. Copiá esta carpeta al servidor o a `htdocs/` de XAMPP.
2. Renombrá `.env.example` a `.env` y completá los datos.
3. Crear base de datos y tablas:
   ```bash
   mysql -u TU_USUARIO -p < setup.sql
