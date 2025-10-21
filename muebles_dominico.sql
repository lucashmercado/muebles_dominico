-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-10-2025 a las 16:20:15
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `muebles_dominico`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `nombre` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`) VALUES
(1, 'Roperos'),
(2, 'Alacenas'),
(3, 'Mesas'),
(4, 'Sillas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagenes_producto`
--

CREATE TABLE `imagenes_producto` (
  `id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `archivo` varchar(255) NOT NULL,
  `orden` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `imagenes_producto`
--

INSERT INTO `imagenes_producto` (`id`, `producto_id`, `archivo`, `orden`, `created_at`) VALUES
(1, 18, 'products/g_18_68f789330c5f9.jpg', NULL, '2025-10-21 13:22:59'),
(2, 18, 'products/g_18_68f789330cfff.jpg', NULL, '2025-10-21 13:22:59');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `importaciones`
--

CREATE TABLE `importaciones` (
  `id` int(11) NOT NULL,
  `archivo` varchar(255) NOT NULL,
  `total_items` int(11) NOT NULL,
  `procesados` int(11) NOT NULL,
  `creados` int(11) NOT NULL,
  `actualizados` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `sku` varchar(64) DEFAULT NULL,
  `nombre` varchar(200) NOT NULL,
  `categoria_id` int(11) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `medida` varchar(100) DEFAULT NULL,
  `precio` int(11) NOT NULL DEFAULT 0,
  `costo` int(11) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT 1,
  `destacado` tinyint(1) NOT NULL DEFAULT 0,
  `orden_destacado` int(11) DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `sku`, `nombre`, `categoria_id`, `descripcion`, `medida`, `precio`, `costo`, `stock`, `activo`, `destacado`, `orden_destacado`, `imagen`, `updated_at`) VALUES
(1, NULL, 'Bajomesada 0,40', NULL, NULL, NULL, 69000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(2, NULL, 'Bajomesada 0,60', NULL, NULL, NULL, 84000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(3, NULL, 'Bajomesada 0,80', NULL, NULL, NULL, 90000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(4, NULL, 'Bajomesada 1,00', NULL, NULL, NULL, 100000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(5, NULL, 'Bajomesada 1,20', NULL, NULL, NULL, 111000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(6, NULL, 'Bajomesada 1,40', NULL, NULL, NULL, 119000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(7, NULL, 'Bajomesada 1,60', NULL, NULL, NULL, 130000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(8, NULL, 'Bajomesada 1,80', NULL, NULL, NULL, 140000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(9, NULL, 'Bajomesada 2,00', NULL, NULL, NULL, 156000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(10, NULL, 'Bajo esquinero', NULL, NULL, '80 x 80', 167000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(11, NULL, 'Frentin Por METRO', NULL, NULL, NULL, 86000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(12, NULL, 'Guias metalicas', NULL, NULL, NULL, 48000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(13, NULL, '', NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(14, '', 'Alacena 0,40', 2, 'la alacena de 40 cm solo tiene 1 sola puerta', '', 53000, NULL, NULL, 1, 0, NULL, 'prod_68f773f513ce8.jpg', '2025-10-21 12:18:27'),
(15, '', 'Alacena 0,60', NULL, '', '', 56000, NULL, NULL, 1, 0, NULL, 'prod_68f775839e34b.jpg', '2025-10-21 11:58:59'),
(16, '', 'Alacena 0,80', NULL, '', '', 60000, NULL, NULL, 1, 0, NULL, 'prod_68f775b184399.jpg', '2025-10-21 11:59:45'),
(17, NULL, 'Alacena 1,00', NULL, NULL, NULL, 63000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(18, '', 'Alacena 1,20', 2, '', '', 67000, NULL, NULL, 1, 0, NULL, 'products/g_18_68f789330c5f9.jpg', '2025-10-21 13:45:27'),
(19, NULL, 'Alacena 1,40', NULL, NULL, NULL, 83000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(20, NULL, 'Alacena 1,60', NULL, NULL, NULL, 93000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(21, NULL, 'Alacena 1,80', NULL, NULL, NULL, 111000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(22, NULL, 'Alacena 2,00', NULL, NULL, NULL, 126000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(23, NULL, 'Alacena esquinera', NULL, NULL, '60 x 60', 100000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(24, NULL, 'Alacena esquinera', NULL, NULL, '80x80', 112000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(25, NULL, 'Alacena porta micro 60', NULL, NULL, NULL, 91000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(26, NULL, 'Alacena porta micro 80', NULL, NULL, NULL, 109000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(27, NULL, 'Alacena sobre spar', NULL, NULL, NULL, 58000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(28, NULL, 'Alacena solo portamicro', NULL, NULL, NULL, 42000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(29, NULL, 'Modular 0,80', NULL, NULL, NULL, 109000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(30, NULL, 'Modular 1,00', NULL, NULL, NULL, 128000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(31, NULL, 'Modular 1,20', NULL, NULL, NULL, 139000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(32, NULL, 'Modular 1,40', NULL, NULL, NULL, 163000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(33, NULL, 'Modular 1,60', NULL, NULL, NULL, 184000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(34, NULL, 'Modular 1,80', NULL, NULL, NULL, 202000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(35, NULL, 'Modular 2,00', NULL, NULL, NULL, 219000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(36, NULL, 'Combo bajo y alacena 0,80', NULL, NULL, NULL, 132000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(37, NULL, 'Combo bajo y alacena 1,00', NULL, NULL, NULL, 140000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(38, NULL, 'Combo bajo y alacena 1,20', NULL, NULL, NULL, 158000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(39, NULL, 'Combo bajo y alacena 1,40', NULL, NULL, NULL, 177000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(40, NULL, 'Combo bajo y alacena 1,60', NULL, NULL, NULL, 188000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(41, NULL, 'Combo bajo y alacena 1,80', NULL, NULL, NULL, 217000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(42, NULL, 'Combo bajo y alacena 2,00', NULL, NULL, NULL, 237000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(43, NULL, 'Ropero P/Abrir C/Espejo 80', NULL, NULL, NULL, 144000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(44, NULL, 'Ropero P/Abrir C/Espejo 1,20', NULL, NULL, NULL, 191000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(45, NULL, 'Ropero P/Abrir C/Espejo 1,40', NULL, NULL, NULL, 286000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(46, NULL, 'Ropero P/Abrir C/Espejo 1,60', NULL, NULL, NULL, 305000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(47, NULL, 'Ropero P/Abrir C/Espejo 1,80', NULL, NULL, NULL, 317000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(48, NULL, 'Ropero P/Abrir C/Espejo 2,00', NULL, NULL, NULL, 333000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(49, NULL, 'Ropero P/Abrir S/Espejo 80', NULL, NULL, NULL, 125000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(50, NULL, 'Ropero P/Abrir S/Espejo 1,20', NULL, NULL, NULL, 172000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(51, NULL, 'Ropero P/Abrir S/Espejo 1,40', NULL, NULL, NULL, 266000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(52, NULL, 'Ropero P/Abrir S/Espejo 1,60', NULL, NULL, NULL, 286000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(53, NULL, 'Ropero P/Abrir S/Espejo 1,80', NULL, NULL, NULL, 298000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(54, NULL, 'Ropero P/Abrir S/Espejo 2,00', NULL, NULL, NULL, 314000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(55, NULL, 'Alzada 80', NULL, NULL, NULL, 67000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(56, NULL, 'Alzada 1,20', NULL, NULL, NULL, 84000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(57, NULL, 'Alzada 1,40', NULL, NULL, NULL, 97000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(58, NULL, 'Alzada 1,60', NULL, NULL, NULL, 105000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(59, NULL, 'Alzada 1,80', NULL, NULL, NULL, 125000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(60, NULL, 'Alzada 2.00', NULL, NULL, NULL, 133000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(61, NULL, 'Biblioteca (27cm) 0,40', NULL, NULL, NULL, 51000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(62, NULL, 'Biblioteca (27cm) 0,60', NULL, NULL, NULL, 62000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(63, NULL, 'Biblioteca (27cm) 0,80', NULL, NULL, NULL, 72000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(64, NULL, 'Biblioteca (27cm) 1,00', NULL, NULL, NULL, 77000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(65, NULL, 'Biblioteca (27cm) 1,20', NULL, NULL, NULL, 88000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(66, NULL, 'Cama 1 plaza', NULL, NULL, NULL, 59000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(67, NULL, 'Cama 1 1/2 plaza', NULL, NULL, NULL, 62000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(68, NULL, 'Cama 2 plazas', NULL, NULL, NULL, 73000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(69, NULL, 'Cama 2 1/2 plazas', NULL, NULL, NULL, 76000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(70, NULL, 'Cama superpuesta', NULL, NULL, NULL, 110000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(71, NULL, 'Cama carro', NULL, NULL, NULL, 70000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(72, NULL, 'Cama nido oval', NULL, NULL, NULL, 121000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(73, NULL, 'Cama (3x3) 1 plaza', NULL, NULL, NULL, 137000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(74, NULL, 'Cama (3x3) 1 1/2 plaza', NULL, NULL, NULL, 163000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(75, NULL, 'Cama (3x3) 2 plaza', NULL, NULL, NULL, 210000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(76, NULL, 'Cama (3x3) superpuesta', NULL, NULL, NULL, 272000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(77, NULL, 'Mesa (3x3)', NULL, NULL, '1,00 x 80', 95000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(78, NULL, 'Mesa (3 x 3)', NULL, NULL, '1,20 x 80', 109000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(79, NULL, 'Mesa (3 x 3)', NULL, NULL, '1,40 x 80', 121000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(80, NULL, 'Mesa (3 x 3)', NULL, NULL, '1,60 x 80', 132000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(81, NULL, 'Mesa (3 x 3)', NULL, NULL, '1,80 x 90', 163000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(82, NULL, 'Mesa (3 x 3)', NULL, NULL, '2,00 x 90', 175000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(83, NULL, 'Mesa (3 x 3)', NULL, NULL, '1,00 x 1,00', 109000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(84, NULL, 'Mesa (3 x 3)', NULL, NULL, '1,20 x 1,20', 151000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(85, NULL, 'Mesa (3 x 3)', NULL, NULL, '1,40 x 1,40', 189000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(86, NULL, 'Mesa (3 x 3)', NULL, NULL, '2,00 x 1,00', 233000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(87, NULL, 'Mesa (3 x 3)', NULL, NULL, '2,40 x 1,00', 282000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(88, NULL, 'Mesa (3 x 3)', NULL, NULL, '70 x 70', 72000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(89, NULL, 'Mesa (3x3)', NULL, NULL, '1,00 x 80 Torneada', 107000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(90, NULL, 'Mesa (3 x 3)', NULL, NULL, '1,20 x 80 Torneada', 121000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(91, NULL, 'Mesa (3 x 3)', NULL, NULL, '1,40 x 80 Torneada', 133000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(92, NULL, 'Mesa (3 x 3)', NULL, NULL, '1,60 x 80 Torneada', 144000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(93, NULL, 'Mesa (3 x 3)', NULL, NULL, '1,80 x 90 Torneada', 175000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(94, NULL, 'Mesa (3 x 3)', NULL, NULL, '2,00 x 90 Torneada', 188000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(95, NULL, 'Mesa (3 x 3)', NULL, NULL, '1,00 x 1,00 Torneada', 121000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(96, NULL, 'Mesa (3 x 3)', NULL, NULL, '1,20 x 1,20 Torneada', 163000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(97, NULL, 'Mesa (3 x 3)', NULL, NULL, '1,40 x 1,40 Torneada', 202000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(98, NULL, 'Mesa (3 x 3)', NULL, NULL, '2,00 x 1,00 Torneada', 245000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(99, NULL, 'Mesa (3 x 3)', NULL, NULL, '2,40 x 1,00 Torneada', 294000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(100, NULL, 'Mesa (3 x 3)', NULL, NULL, '70 x 70 Torneada', 84000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(101, NULL, 'Mesa (4 x 4)', NULL, NULL, '1,00 x 80', 111000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(102, NULL, 'Mesa (4 x 4)', NULL, NULL, '1,20 x 80', 125000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(103, NULL, 'Mesa (4 x 4)', NULL, NULL, '1,40 x 80', 137000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(104, NULL, 'Mesa (4 x 4)', NULL, NULL, '1,60 x 80', 147000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(105, NULL, 'Mesa (4 x 4)', NULL, NULL, '1,80 x 90', 179000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(106, NULL, 'Mesa (4 x 4)', NULL, NULL, '2,00 x 90', 191000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(107, NULL, 'Mesa (4 x 4)', NULL, NULL, '1,00 x 1,00', 125000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(108, NULL, 'Mesa (4 x 4)', NULL, NULL, '1,20 x 1,20', 167000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(109, NULL, 'Mesa (4 x 4)', NULL, NULL, '1,40 x 1,40', 205000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(110, NULL, 'Mesa (4 x 4)', NULL, NULL, '2,00 x 1,00', 249000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(111, NULL, 'Mesa (4 x 4)', NULL, NULL, '2,40 x 1,00', 298000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(112, NULL, 'Mesa (4 x 4)', NULL, NULL, '1,00 x 80 Torneada', 123000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(113, NULL, 'Mesa (4 x 4)', NULL, NULL, '1,20 x 80 Torneada', 137000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(114, NULL, 'Mesa (4 x 4)', NULL, NULL, '1,40 x 80 Torneada', 149000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(115, NULL, 'Mesa (4 x 4)', NULL, NULL, '1,60 x 80 Torneada', 160000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(116, NULL, 'Mesa (4 x 4)', NULL, NULL, '1,80 x 90 Torneada', 191000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(117, NULL, 'Mesa (4 x 4)', NULL, NULL, '2,00 x 90 Torneada', 203000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(118, NULL, 'Mesa (4 x 4)', NULL, NULL, '1,00 x 1,00 Torneada', 137000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(119, NULL, 'Mesa (4 x 4)', NULL, NULL, '1,20 x 1,20 Torneada', 179000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(120, NULL, 'Mesa (4 x 4)', NULL, NULL, '1,40 x 1,40 Torneada', 217000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(121, NULL, 'Mesa (4 x 4)', NULL, NULL, '2,00 x 1,00 Torneada', 261000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(122, NULL, 'Mesa (4 x 4)', NULL, NULL, '2,40 x 1,00 Torneada', 310000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(123, NULL, 'Mesa (3x3) Trampa', NULL, NULL, '1,00 x 80 A 1,40', 181000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(124, NULL, 'Mesa (3x3) Trampa', NULL, NULL, '1,20 x 80 A 1,70', 196000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(125, NULL, 'Mesa (3x3) Trampa', NULL, NULL, '1,40 x 80 A 1,90', 221000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(126, NULL, 'Mesa (3x3) Trampa', NULL, NULL, '1,60 x 90 A 2,10', 251000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(127, NULL, 'Mesa (3x3) Trampa', NULL, NULL, '1,80 x 90 A 2,30', 265000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(128, NULL, 'Mesa (3x3) Trampa', NULL, NULL, '1,00 x 80 A 1,40 Tor', 193000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(129, NULL, 'Mesa (3x3) Trampa', NULL, NULL, '1,20 x 80 A 1,70 Tor', 209000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(130, NULL, 'Mesa (3x3) Trampa', NULL, NULL, '1,40 x 80 A 1,90 Tor', 233000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(131, NULL, 'Mesa (3x3) Trampa', NULL, NULL, '1,60 x 90 A 2,10 Tor', 263000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(132, NULL, 'Mesa (3x3) Trampa', NULL, NULL, '1,80 x 90 A 2,30 Tor', 277000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(133, NULL, 'Mesa (4x4) Trampa', NULL, NULL, '1,00 x 80 A 1,40', 196000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(134, NULL, 'Mesa (4x4) Trampa', NULL, NULL, '1,20 x 80 A 1,70', 212000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(135, NULL, 'Mesa (4x4) Trampa', NULL, NULL, '1,40 x 80 A 1,90', 237000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(136, NULL, 'Mesa (4x4) Trampa', NULL, NULL, '1,60 x 90 A 2,10', 266000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(137, NULL, 'Mesa (4x4) Trampa', NULL, NULL, '1,80 x 90 A 2,30', 280000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(138, NULL, 'Mesa (4x4) Trampa', NULL, NULL, '1,00 x 80 A 1,40 Tor', 209000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(139, NULL, 'Mesa (4x4) Trampa', NULL, NULL, '1,20 x 80 A 1,70 Tor', 224000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(140, NULL, 'Mesa (4x4) Trampa', NULL, NULL, '1,40 x 80 A 1,90 Tor', 249000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(141, NULL, 'Mesa (4x4) Trampa', NULL, NULL, '1,60 x 90 A 2,10 Tor', 279000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(142, NULL, 'Mesa (4x4) Trampa', NULL, NULL, '1,80 x 90 A 2,30 Tor', 293000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(143, NULL, 'Chifo x 2', NULL, NULL, NULL, 56000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(144, NULL, 'Chifo x 3', NULL, NULL, NULL, 62000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(145, NULL, 'Chifo x 4', NULL, NULL, NULL, 74000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(146, NULL, 'Chifo x 5', NULL, NULL, NULL, 81000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(147, NULL, 'Chifo x 6', NULL, NULL, NULL, 86000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(148, NULL, 'Chifo x 7', NULL, NULL, NULL, 93000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(149, NULL, 'Chifo x', NULL, NULL, '80 x 1,20 alto', 105000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(150, NULL, 'Chifo Ropero', NULL, NULL, '1,00 x 1,05', 107000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(151, NULL, 'Chifo Ropero Profundo', NULL, NULL, NULL, 133000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(152, NULL, 'Chifo Ropero 2 puertas', NULL, NULL, NULL, 100000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(153, NULL, 'Chifo Profundo x 5', NULL, NULL, NULL, 109000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(154, NULL, 'Chifo Profundo x 6', NULL, NULL, NULL, 119000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(155, NULL, 'Comoda', NULL, NULL, '1,00 x 1,00', 98000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(156, NULL, 'comoda', NULL, NULL, '1,20 x 50 Profundo', 125000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(157, NULL, 'Escritorio', NULL, NULL, '80 x 40', 60000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(158, NULL, 'Escritorio', NULL, NULL, '1,00 x 40', 74000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(159, NULL, 'Escritorio', NULL, NULL, '1,00 x 50', 86000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(160, NULL, 'Escritorio', NULL, NULL, '1,30 x 50', 123000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(161, NULL, 'Escritorio c/Alzada 80', NULL, NULL, NULL, 98000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(162, NULL, 'Escritorio c/Alzada 1,00', NULL, NULL, NULL, 114000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(163, NULL, 'Escritorio c/Alzada', NULL, NULL, '1,00 x 50', 119000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(164, NULL, 'Escritorio c/Alzada', NULL, NULL, '1,30 x 50', 144000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(165, NULL, 'Escritorio provenzal', NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(166, NULL, 'Escritorio Vintage c/1 cajon 80', NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(167, NULL, 'Escritorio Vintage c/1 cajon 1,00', NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(168, NULL, 'Mesa de luz puerta y cajon', NULL, NULL, NULL, 46000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(169, NULL, 'Mesa de luz vintage', NULL, NULL, NULL, 42000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(170, NULL, 'Mesa de luz somier', NULL, NULL, NULL, 56000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(171, NULL, 'Silla hindu P/cuadradas', NULL, NULL, NULL, 35000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(172, NULL, 'Silla hindu P/torneadas', NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(173, NULL, 'Silla hindu P/cuadradas Tapizadas', NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(174, NULL, 'Silla hindu P/torneadas Tapizadas', NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(175, NULL, 'Bahiut 0,80', NULL, NULL, NULL, 116000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(176, NULL, 'Bahiut 1,00', NULL, NULL, NULL, 132000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(177, NULL, 'Bahiut 1,20', NULL, NULL, NULL, 144000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(178, NULL, 'Bahiut 1,40', NULL, NULL, NULL, 161000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(179, NULL, 'Bahiut 1,60', NULL, NULL, NULL, 181000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(180, NULL, 'Bahiut 1,80', NULL, NULL, NULL, 193000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(181, NULL, 'Bahiut 2,00', NULL, NULL, NULL, 223000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(182, NULL, 'Despencero 0,40', NULL, NULL, NULL, 98000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(183, NULL, 'Despencero 0,60', NULL, NULL, NULL, 121000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(184, NULL, 'Despencero 0,80', NULL, NULL, NULL, 139000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(185, NULL, 'Despencero 1,00', NULL, NULL, NULL, 165000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(186, NULL, 'Despencero 1,20', NULL, NULL, NULL, 184000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(187, NULL, 'Despencero porta micro/horno 60', NULL, NULL, NULL, 111000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(188, NULL, 'Despencero porta micro/horno 80', NULL, NULL, NULL, 121000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(189, NULL, 'Barra recta 1,00', NULL, NULL, NULL, 202000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(190, NULL, 'Barra recta 1,20', NULL, NULL, NULL, 216000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(191, NULL, 'Barra recta 1,40', NULL, NULL, NULL, 245000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(192, NULL, 'Barra recta 1,60', NULL, NULL, NULL, 298000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(193, NULL, 'Barra recta 1,80', NULL, NULL, NULL, 307000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(194, NULL, 'Barra recta 2,00', NULL, NULL, NULL, 328000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(195, NULL, 'Barra recta en \"L\" 1,20', NULL, NULL, NULL, 272000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(196, NULL, 'Barra recta en \"L\" 1,40', NULL, NULL, NULL, 315000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(197, NULL, 'Barra recta en \"L\" 1,60', NULL, NULL, NULL, 331000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(198, NULL, 'Barra recta en \"L\" 1,80', NULL, NULL, NULL, 356000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(199, NULL, 'Barra recta en \"L\" 2,00', NULL, NULL, NULL, 377000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(200, NULL, 'Rack tv 1,00', NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(201, NULL, 'Rack tv 1,25', NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(202, NULL, 'Rack tv 1,60', NULL, NULL, NULL, 245000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(203, NULL, 'Rack tv 1,80', NULL, NULL, NULL, 289000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(204, NULL, 'Rack tv 2,00', NULL, NULL, NULL, 307000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(205, NULL, 'Mesa quesera / desayunador', NULL, NULL, '1,00 x 40', 76000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(206, NULL, 'Mesa quesera / desayunador', NULL, NULL, '1,20 x 40', 79000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(207, NULL, 'Mesa quesera / desayunador', NULL, NULL, '1,40 x 40', 84000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(208, NULL, 'Mesa quesera / desayunador 0,60 Doble', NULL, NULL, NULL, 72000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(209, NULL, 'Mesa quesera / desayunador 0,80 Doble', NULL, NULL, NULL, 76000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(210, NULL, 'Mesa quesera / desayunador 1,00 Doble', NULL, NULL, NULL, 81000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(211, NULL, 'Mesa quesera / desayunador 1,20 Doble', NULL, NULL, NULL, 86000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(212, NULL, 'Mesa quesera / desayunador 1,40 Doble', NULL, NULL, NULL, 91000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(213, NULL, 'candy bar x 3', NULL, NULL, NULL, 58000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(214, NULL, 'Exibidor escalera x 3', NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(215, NULL, 'Exibidor escalera x 4', NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(216, NULL, 'Exibidor escalera x 5', NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(217, NULL, 'Organizador de baño', NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(218, NULL, 'Banco escalera', NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(219, NULL, 'perchero de pie', NULL, NULL, NULL, 39000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(220, NULL, 'Juego de living torneado MADERA 2 cuer', NULL, NULL, NULL, 242000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(221, NULL, 'Juego de living torneado MADERA 3 cuer', NULL, NULL, NULL, 272000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(222, NULL, 'juego living con almohadon cuerina 2 cue', NULL, NULL, NULL, 377000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(223, NULL, 'juego living con almohadon cuerina 3 cue', NULL, NULL, NULL, 454000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(224, NULL, 'Futon 3 x 3', NULL, NULL, NULL, 131000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(225, NULL, 'Colchon futon', NULL, NULL, NULL, 150000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(226, NULL, 'Futon + colchon', NULL, NULL, NULL, 266000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(227, NULL, 'Taburete 0,45 sin respaldo', NULL, NULL, NULL, 16000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(228, NULL, 'Taburete 0,60 sin respaldo', NULL, NULL, NULL, 17000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(229, NULL, 'Taburete 0,75 sin respaldo', NULL, NULL, NULL, 18000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(230, NULL, 'Taburete 0,45 con respaldo', NULL, NULL, NULL, 29000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(231, NULL, 'Taburete 0,60 con respaldo', NULL, NULL, NULL, 31000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(232, NULL, 'Taburete 0,75 con respaldo', NULL, NULL, NULL, 31000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(233, NULL, 'almohadones x8', NULL, NULL, NULL, 106000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(234, NULL, 'Mesa ratona', NULL, NULL, '1,00x0,80', 71000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(235, NULL, 'Mesa ratona', NULL, NULL, '1,00x0,60', 66000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(236, NULL, 'Mesa ratona', NULL, NULL, '0,80x0,60', 51000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(237, NULL, 'Mesa ratona', NULL, NULL, '0,60x0,60', 43000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(238, NULL, 'Mesa ratona', NULL, NULL, '1,00x0,80 Torneada', 77000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(239, NULL, 'Mesa ratona', NULL, NULL, '1,00x0,60 Torneada', 72000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(240, NULL, 'Mesa ratona', NULL, NULL, '0,80x0,60 Torneada', 57000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16'),
(241, NULL, 'Mesa ratona', NULL, NULL, '0,60x0,60 Torneada', 49000, NULL, NULL, 1, 0, NULL, NULL, '2025-10-18 17:41:16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `usuario` varchar(80) NOT NULL,
  `clave_hash` varchar(255) NOT NULL,
  `fecha_ingreso` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `usuario`, `clave_hash`, `fecha_ingreso`) VALUES
(1, 'admin', '$2y$10$eHnZsA6Y0nFZx8j6QJ7xQe1vHh0pQk8v0dJ8H4o8m3Gm7wZs1sD7a', '2025-10-18 16:53:44'),
(2, 'lucas', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2025-10-18 17:16:03'),
(4, 'lucas2', '$2y$10$7zoFlsQLI./6sMMbKKCz1e9/2eV5ZgcoH1EoBWW9Ewh7Q/Cz8ZgP6', '2025-10-18 17:19:38');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `imagenes_producto`
--
ALTER TABLE `imagenes_producto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `producto_id` (`producto_id`);

--
-- Indices de la tabla `importaciones`
--
ALTER TABLE `importaciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoria_id` (`categoria_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuario` (`usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `imagenes_producto`
--
ALTER TABLE `imagenes_producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `importaciones`
--
ALTER TABLE `importaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=245;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `imagenes_producto`
--
ALTER TABLE `imagenes_producto`
  ADD CONSTRAINT `fk_img_prod` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
