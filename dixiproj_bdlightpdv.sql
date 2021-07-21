-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 21, 2021 at 12:14 PM
-- Server version: 10.3.29-MariaDB-0ubuntu0.20.04.1
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dixiproj_bdlightpdv`
--

-- --------------------------------------------------------

--
-- Table structure for table `categoria`
--

CREATE TABLE `categoria` (
  `id` int(11) NOT NULL,
  `categoria` varchar(255) DEFAULT NULL,
  `empresa_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='{"structure": {"img": "true"}}';

--
-- Dumping data for table `categoria`
--

INSERT INTO `categoria` (`id`, `categoria`, `empresa_id`) VALUES
(1, 'Bolsas', 1),
(2, 'Verdura', 1),
(3, 'De la Tierra', 1),
(4, 'Fruta', 1),
(5, 'Hierbas', 1),
(6, 'Hongos', 1),
(7, 'Sabor de México', 1),
(8, 'Huevo', 1),
(9, 'Saludable', 1),
(10, 'Especias', 1),
(11, 'Otros', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `cliente` varchar(255) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `empresa_id` int(11) NOT NULL,
  `cookie` varchar(255) DEFAULT NULL,
  `nota` text DEFAULT NULL,
  `ultima_compra` date DEFAULT NULL,
  `total_compras` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='{"structure": {"img": "true"}}';

--
-- Dumping data for table `cliente`
--

INSERT INTO `cliente` (`id`, `cliente`, `telefono`, `direccion`, `empresa_id`, `cookie`, `nota`, `ultima_compra`, `total_compras`) VALUES
(1, 'Carlos', '5515051251', '', 1, 'h9cb6bgp4k7kipukqqdupdloi5', 'mis notas', '2021-03-01', 200),
(4, 'Pedro', '5515051251', 'asfas fasdfasdfasdf', 1, '16jalq91tgno5vj8k700puoine', NULL, '2021-03-01', 100),
(5, 'Laura|', '', '', 1, 'ksa5prtqcasgfkgfqfesvdk0pg', NULL, '2021-03-01', 0),
(6, 'Carlos', '55667788', 'mi direccion cercadelasescuelas # 35 etc', 0, NULL, 'no paga a tiempo ', '2000-01-01', 0),
(7, '', '', '', 1, 'tg5urvh50v3c70r0aomk2vtfg1', NULL, NULL, 0),
(8, '', '', '', 1, 'c96nfku3r25iklucd60u6if7r1', NULL, NULL, 0),
(9, '', '', '', 1, '9j9cnbqn2degr3unhlj3h1u81t', NULL, NULL, 0),
(10, 'Alfredo', '5515051251', '', 1, 'hnr3j8p66sb2qoi25v4c35o5j9', NULL, '2021-06-07', 2),
(11, '', '', '', 1, '', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `codigo_pais`
--

CREATE TABLE `codigo_pais` (
  `id` int(11) NOT NULL,
  `codigo_pais` varchar(255) DEFAULT NULL,
  `pais_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `codigo_pais`
--

INSERT INTO `codigo_pais` (`id`, `codigo_pais`, `pais_id`) VALUES
(1, '52', 1),
(2, '507', 3),
(3, '1', 2);

-- --------------------------------------------------------

--
-- Table structure for table `detalle_pedido`
--

CREATE TABLE `detalle_pedido` (
  `id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `pedidos_id` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio_venta` varchar(255) DEFAULT NULL,
  `total` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `detalle_pedido`
--

INSERT INTO `detalle_pedido` (`id`, `producto_id`, `pedidos_id`, `cantidad`, `precio_venta`, `total`) VALUES
(51, 5, 111, 1, '17.50', '17.5'),
(52, 6, 112, 1, '14.00', '14'),
(53, 4, 113, 2, '9.00', '18'),
(55, 5, 110, 2, '17.50', '35'),
(57, 3, 110, 3, '17.00', '51'),
(58, 181, 114, 1, '1.95', '1.95'),
(59, 155, 114, 1, '0.00', '0'),
(60, 125, 115, 1, '0.00', '0'),
(63, 43, 115, 3, '0.00', '0');

-- --------------------------------------------------------

--
-- Table structure for table `empresa`
--

CREATE TABLE `empresa` (
  `id` int(11) NOT NULL,
  `empresa` varchar(255) DEFAULT NULL,
  `correo` varchar(255) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `plantilla_id` int(11) NOT NULL,
  `encabezado_pedido` longtext DEFAULT NULL,
  `pie_pagina_pedido` longtext DEFAULT NULL,
  `codigo_pais_id` int(11) NOT NULL,
  `url_tienda` varchar(255) DEFAULT NULL,
  `status_pedido_id` int(11) NOT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `google_analitycs` varchar(255) DEFAULT NULL,
  `api_key` varchar(255) DEFAULT NULL,
  `api_secret` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='{"structure": {"img": "true"}}';

--
-- Dumping data for table `empresa`
--

INSERT INTO `empresa` (`id`, `empresa`, `correo`, `telefono`, `color`, `plantilla_id`, `encabezado_pedido`, `pie_pagina_pedido`, `codigo_pais_id`, `url_tienda`, `status_pedido_id`, `direccion`, `google_analitycs`, `api_key`, `api_secret`) VALUES
(0, 'Sin asignar', NULL, NULL, NULL, 1, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL, NULL),
(1, 'Bodega Mendez', 'miempresa@gmail.com', '5567860404', '#2a302b', 3, 'Su pedido a sido creado', 'aqui va todo el piede pagina del pedido', 1, 'tienda1', 6, 'direccion aqui', NULL, NULL, NULL),
(2, 'Camiones', 'lamoderna@gmail.com', '5567860404', '#6a82e7', 3, '', '', 1, 'tienda2', 0, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pais`
--

CREATE TABLE `pais` (
  `id` int(11) NOT NULL,
  `pais` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pais`
--

INSERT INTO `pais` (`id`, `pais`) VALUES
(1, 'México'),
(2, 'EUA'),
(3, 'Panama');

-- --------------------------------------------------------

--
-- Table structure for table `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int(11) NOT NULL,
  `fecha_hora` datetime DEFAULT NULL,
  `total` decimal(18,2) DEFAULT NULL,
  `cliente_id` int(11) NOT NULL,
  `empresa_id` int(11) NOT NULL,
  `status_pedido_id` int(11) NOT NULL,
  `nota` text DEFAULT NULL,
  `fecha_entrga` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pedidos`
--

INSERT INTO `pedidos` (`id`, `fecha_hora`, `total`, `cliente_id`, `empresa_id`, `status_pedido_id`, `nota`, `fecha_entrga`) VALUES
(110, '2021-06-07 01:53:36', '86.00', 10, 1, 7, '', '2021-06-07'),
(111, '2021-06-07 01:54:45', '17.50', 10, 1, 7, '', '2021-06-07'),
(112, '2021-06-07 01:55:56', '14.00', 10, 1, 7, '', '2021-06-07'),
(113, '2021-06-07 01:56:04', '18.00', 10, 1, 7, '', '2021-06-07'),
(114, '2021-06-07 02:26:45', '1.95', 10, 1, 7, '', '2021-06-07'),
(115, '2021-06-07 02:27:21', '0.00', 10, 1, 6, '', '2021-06-07'),
(116, '2021-07-21 12:11:33', '0.00', 11, 1, 6, '', '2021-07-21');

-- --------------------------------------------------------

--
-- Table structure for table `plantilla`
--

CREATE TABLE `plantilla` (
  `id` int(11) NOT NULL,
  `plantilla` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='{"structure": {"img": "true"}}	';

--
-- Dumping data for table `plantilla`
--

INSERT INTO `plantilla` (`id`, `plantilla`) VALUES
(1, 'Plantilla 1'),
(2, 'Plantilla 2'),
(3, 'Plantilla 3'),
(4, 'Plantilla 4');

-- --------------------------------------------------------

--
-- Table structure for table `producto`
--

CREATE TABLE `producto` (
  `id` int(11) NOT NULL,
  `idinterno` varchar(255) DEFAULT NULL,
  `producto` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio_venta` decimal(18,2) DEFAULT NULL,
  `categoria_id` int(11) NOT NULL,
  `unidad_medida_id` int(11) NOT NULL,
  `existencia_minima` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `empresa_id` int(11) NOT NULL,
  `url_imagen` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='{"structure": {"img": "true"}}	';

--
-- Dumping data for table `producto`
--

INSERT INTO `producto` (`id`, `idinterno`, `producto`, `descripcion`, `cantidad`, `precio_venta`, `categoria_id`, `unidad_medida_id`, `existencia_minima`, `user_id`, `empresa_id`, `url_imagen`) VALUES
(1, NULL, 'InmunoBomba', '1 lb. Cebolla, 3 Cabezas de Ajo, 1/2 lb. de Gengibre, 1/2 lb. Cúrcuma, 1 Mazito de Culantro, 1 Botecito de Clavo de olor, 10 limón castilla', 100, '8.99', 1, 1, 0, 2, 1, ''),
(2, NULL, 'Bolsa Criolla (Common basket)', '2 lb. Papa, 2 lb. Tomate Perita, 1 lb. de Cebolla, 1 lb. de Zanahoria, 1 lb Repollo, 1 lb Apio, 1 lb. Pimentón verde, 1 lb. Pepinos, 1 Recao verde, 4 Plátanos verdes', 100, '17.01', 1, 1, 0, 2, 1, ''),
(3, NULL, 'Bolsa Frutera (Fruit Basket)', '2lb. Guineos, 1 Melón, 10 Naranjas, 10 Limones Castilla, 1 Piña, 2 Aguacates, 1 Papaya', 100, '17.00', 1, 1, 0, 2, 1, ''),
(4, NULL, 'Bolsa Sopera (Soup Basket)', '2 lb. Zapallo, 2 lb. de Yuca, 2 lb. de Ñame diamante, 2 mazorcas, 1 chayote, 1 Recao Verde', 100, '9.00', 1, 1, 0, 2, 1, ''),
(5, NULL, 'Bolsa de la tierra (Soil bag)', 'Ajos (6), 1 lb Camote (Sweet Potato), 2 lb Cebolla (Onion), 1 lb Cebolla Morada (Red Onion), 2 lb Ñame Baboso (Yam), 2 lb Otoe, 2 lb Papa (Potato), 1 lb Rábano (Radish)', 100, '17.50', 1, 1, 0, 2, 1, ''),
(6, NULL, 'Bolsa Yeye (Fancy basket)', '1lb. Berenjena, 1 lb. Zucchinis, 1 lb. Brócoli, 1 lb. Cebolla morada, 1 lb. Pimenton Verde', 100, '14.00', 1, 1, 0, 2, 1, ''),
(7, NULL, 'Apio (Celery)', 'lb.', 100, '0.00', 2, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/apio.png'),
(8, NULL, 'Ají Chombo', 'Unidad (each)', 100, '0.00', 2, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/aji_chombo.jpg'),
(9, NULL, 'Ají Chombo Libra', 'lb.', 100, '0.00', 2, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/aji_chombo.jpg'),
(10, NULL, 'Ají dulce (Sweet Chilli)', 'lb.', 100, '0.00', 2, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/aji_dulce.jpg'),
(11, NULL, 'Ají pico de loro (Sweet green Chilli)', 'lb.', 100, '0.00', 2, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/picoloro.jpg'),
(12, NULL, 'Ají Trompito', 'lb.', 100, '0.00', 2, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/aji_trompito.jpg'),
(13, NULL, 'Berenjena (Egg Plant)', 'lb.', 100, '0.00', 2, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/berenjena.jpg'),
(14, NULL, 'Brócoli', 'lb.', 100, '0.00', 2, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/brocoli.jpg'),
(15, NULL, 'Chayote (Squash)', 'Unidad (each)', 100, '0.00', 2, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/chayote.jpg'),
(16, NULL, 'Coliflor (Cauliflower)', 'lb.', 100, '0.00', 2, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/coliflor.jpg'),
(17, NULL, 'Esparrago (Asparagus)', 'Manojo (bunch)', 100, '0.00', 2, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/esparrago.jpg'),
(18, NULL, 'Espinaca (Spinach)', '1 lb. (2 Manojos, 2 bunches)', 100, '0.00', 2, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/espinaca.jpg'),
(19, NULL, 'Guandú Morado', 'lb.', 100, '0.00', 2, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/guandu.jpg'),
(20, NULL, 'Habichuela Larga', 'lb.', 100, '0.00', 2, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/habichuela_larga.jpg'),
(21, NULL, 'Habichuelas (Green Beans)', 'lb.', 100, '0.00', 2, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/habichuelas.jpg'),
(22, NULL, 'Kale', '1/2 lb.', 100, '0.00', 2, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/kale.jpg'),
(23, NULL, 'Lechuga Nacional (Iceberg Lettuce)', 'lb.', 100, '0.00', 2, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/lechuga.jpg'),
(24, NULL, 'Lechuga Romana (Roman Lettuce)', 'lb.', 100, '0.00', 2, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/lechugaromana.jpg'),
(25, NULL, 'Lechuga Morada (Red Lettuce)', 'lb.', 100, '0.00', 2, 1, 0, 2, 1, 'https://frutydeliveries.com/pedidos/img/lechugamorada.jpg'),
(26, NULL, 'Mazorca (Corn Cob)', 'Unidad (each)', 100, '0.00', 2, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/mazorca.jpg'),
(27, NULL, 'Mostaza Blanca (Bok Choi)', 'Mazo', 100, '0.00', 2, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/mostaza.jpg'),
(28, NULL, 'Mostaza Verde (Green Mustard)', 'Mazo', 100, '0.00', 2, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/mostazaverde.jpg'),
(29, NULL, 'Pepino Amargo (Bitter guard)', 'lb.', 100, '0.00', 2, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/pepino_amargo.jpg'),
(30, NULL, 'Pepino (Cucumber)', 'lb.', 100, '0.00', 2, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/pepino.jpg'),
(31, NULL, 'Pepino Sin Semilla', 'lb.', 100, '0.00', 2, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/pepino_sin_semilla.jpg'),
(32, NULL, 'Pimentón Amarillo  (Yellow Bell Pepper)', 'lb.', 100, '0.00', 2, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/pimentonamarillo.jpg'),
(33, NULL, 'Pimentón Rojo (Red Bell Pepper)', 'lb.', 100, '0.00', 2, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/pimentonrojo.jpg'),
(34, NULL, 'Pimentón Verde (Green Bell Pepper)', 'lb.', 100, '0.00', 2, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/pimentonverde.jpg'),
(35, NULL, 'Plátano Maduro (Mature Plantain)', 'Unidad (each)', 100, '0.00', 2, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/platanomaduro.jpg'),
(36, NULL, 'Plátano Verdes (Green Plantain)', 'Unidad (each)', 100, '0.00', 2, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/platanoverde.jpg'),
(37, NULL, 'Puerro (Leek)', 'lb.', 100, '0.00', 2, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/puerro.jpg'),
(38, NULL, 'Repollo (Cabbage)', 'lb.', 100, '0.00', 2, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/repollo.jpg'),
(39, NULL, 'Repollo Morado (Purple Cabbage)', 'lb.', 100, '0.00', 2, 1, 0, 2, 1, 'https://frutydeliveries.com/pedidos/img/repollomorado.jpg'),
(40, NULL, 'Repollo chino', 'lb.', 100, '0.00', 2, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/repollo_chino.jpg'),
(41, NULL, 'Tomate Cherry', 'lb.', 100, '0.00', 2, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/tomate_cherry.jpg'),
(42, NULL, 'Tomate Ensalada', 'lb.', 100, '0.00', 2, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/tomate.jpg'),
(43, NULL, 'Tomate Perita', 'lb.', 100, '0.00', 2, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/tomateperita.jpg'),
(44, NULL, 'Zapallo (Pumpkin)', 'lb.', 100, '0.00', 2, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/pumpkin.jpg'),
(45, NULL, 'Zucchini (Courgette)', 'lb.', 100, '0.00', 2, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/zucchini.jpg'),
(46, NULL, 'Ajo (Garlic)', 'Cabeza (Head)', 100, '0.00', 3, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/ajo.jpg'),
(47, NULL, 'Ajos (6) (Garlic)', '1/2lb. Paquete de 6', 100, '0.00', 3, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/ajo.jpg'),
(48, NULL, 'Camote (Sweet Potato)', 'lb.', 100, '0.00', 3, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/camote.jpg'),
(49, NULL, 'Cebolla (Onion)', 'lb.', 100, '0.00', 3, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/cebolla.jpg'),
(50, NULL, 'Cebolla morada (Red Onion)', 'lb.', 100, '0.00', 3, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/cebollamorada.jpg'),
(51, NULL, 'Cúrcuma (1/2 lb.)', '1/2 Lb.', 100, '0.00', 3, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/curcuma.jpg'),
(52, NULL, 'Gengibre (Ginger)', 'lb.', 100, '0.00', 3, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/gengibre.jpg'),
(53, NULL, 'Nabo (Turnip)', 'lb.', 100, '0.00', 3, 1, 0, 2, 1, 'https://frutydeliveries.com/pedidos/img/nabo.jpg'),
(54, NULL, 'Ñampí Blanco', 'lb.', 100, '0.00', 3, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/ñampi_blanco.jpg'),
(55, NULL, 'Ñampí Morado', 'lb.', 100, '0.00', 3, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/ñampi_morado.jpg'),
(56, NULL, 'Ñame Baboso (Yam)', 'lb.', 100, '0.00', 3, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/ñame.png'),
(57, NULL, 'Ñame Diamante (Yam)', 'lb.', 100, '0.00', 3, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/ñame.png'),
(58, NULL, 'Otoe', 'lb.', 100, '0.00', 3, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/otoe.jpg'),
(59, NULL, 'Papa (Potato)', 'lb.', 100, '0.00', 3, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/papa.png'),
(60, NULL, 'Papín (Andean Potato)', 'lb.', 100, '0.00', 3, 1, 0, 2, 1, 'https://frutydeliveries.com/pedidos/img/papin.jpg'),
(61, NULL, 'Rábano (Radish)', 'lb.', 100, '0.00', 3, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/rabano.jpg'),
(62, NULL, 'Remolacha (Beet)', 'lb.', 100, '0.00', 3, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/remolacha.jpg'),
(63, NULL, 'Yuca (Mandioca)', 'lb.', 100, '0.00', 3, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/yuca.jpg'),
(64, NULL, 'Zanahoria (Carrot)', 'lb.', 100, '0.00', 3, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/zanahoria.jpg'),
(65, NULL, 'Aguacate (Avocado)', 'Unidad (each)', 100, '0.00', 4, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/aguacate.jpg'),
(66, NULL, 'Blueberries', 'Caja Pequeña', 100, '0.00', 4, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/blueberries.jpg'),
(67, NULL, 'Ciruela (Plum)', 'Unidad (each)', 100, '0.00', 4, 1, 0, 2, 1, 'https://frutydeliveries.com/pedidos/img/ciruela.jpg'),
(68, NULL, 'Cereza Fresca (Fresh Cherry)', '1/2 lb', 100, '0.00', 4, 1, 0, 2, 1, 'https://frutydeliveries.com/pedidos/img/cereza.jpg'),
(69, NULL, 'Coco (Coconut)', 'Unidad (each)', 100, '0.00', 4, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/coco.jpg'),
(70, NULL, 'Durazno Melocotón (Peach)', 'Unidad (each)', 100, '0.00', 4, 1, 0, 2, 1, 'https://frutydeliveries.com/pedidos/img/durazno.jpg'),
(71, NULL, 'Fresas (Strawberries)', 'Cajita 1/2 lb', 100, '0.00', 4, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/fresa.jpg'),
(72, NULL, 'Fresas Congelada (Frozen Strawberries)', '2 Kg', 100, '0.00', 4, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/fresa.jpg'),
(73, NULL, 'Guineos (Bananas)', 'lb. (aprox 3 unidades)', 100, '0.00', 4, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/guineo.jpg'),
(74, NULL, 'Naranjilla (Lulo)', 'lb.', 100, '0.00', 4, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/lulo.jpg'),
(75, NULL, 'Granada', 'Unidad (each)', 100, '0.00', 4, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/granada.jpg'),
(76, NULL, 'Guayaba Blanca', 'lb.', 100, '0.00', 4, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/guayaba.jpg'),
(77, NULL, 'Kiwi', 'Unidad (each)', 100, '0.00', 4, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/kiwi.jpg'),
(78, NULL, 'Limón Castilla (1)', 'Unidad (each)', 100, '0.00', 4, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/limoncastilla.jpg'),
(79, NULL, 'Limón Castilla (Lemon) (10)', '10 Unidades', 100, '0.00', 4, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/limoncastilla.jpg'),
(80, NULL, 'Limón Mandarina (1)', 'Unidad (each)', 100, '0.00', 4, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/limon_mandarina.jpg'),
(81, NULL, 'Limón Mandarina (10)', 'Unidad (each)', 100, '0.00', 4, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/limon_mandarina.jpg'),
(82, NULL, 'Limón Persa (1)', 'Unidad', 100, '0.00', 4, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/limonpersa.jpg'),
(83, NULL, 'Limón Persa (Persian Lemon) (5)', '5 Unidades', 100, '0.00', 4, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/limonpersa.jpg'),
(84, NULL, 'Mandarina Importada', 'Unidad (each)', 100, '0.00', 4, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/mandarina.jpg'),
(85, NULL, 'Mandarina Nacional', 'Unidad (each)', 100, '0.00', 4, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/mandarina.jpg'),
(86, NULL, 'Mix de moras congeladas (Frozen Berry Mix)', 'Bolsa grande 400gr', 100, '0.00', 4, 1, 0, 2, 1, 'https://frutydeliveries.com/pedidos/img/mixmoras.jpg'),
(87, NULL, 'Mamón Chino (Lychee)', 'Bolsa 10 unidades', 100, '0.00', 4, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/Lychee.jpg'),
(88, NULL, 'Mango Papaya Verde (Green Papaya Mango)', 'Unidad (each) Grande', 100, '0.00', 4, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/mango.jpg'),
(89, NULL, 'Mango Tommy  (Tommy Mango)', 'Lb.', 100, '0.00', 4, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/mango.jpg'),
(90, NULL, 'Manzana Roja', 'Unidad (each)', 100, '0.00', 4, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/manzana_roja.jpg'),
(91, NULL, 'Manzana Verde', 'Unidad (each)', 100, '0.00', 4, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/manazana_verde.jpg'),
(92, NULL, 'Maracuya (Passion Fruit)', 'lb.', 100, '0.00', 4, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/maracuya.jpg'),
(93, NULL, 'Melón (Cantaloupe)', 'Unidad (each)', 100, '0.00', 4, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/melon.jpg'),
(94, NULL, 'Naranja Importada', 'Unidad (each)', 100, '0.00', 4, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/naranja_importada.jpg'),
(95, NULL, 'Naranja 1pz (Orange)', 'Unidad (each)', 100, '0.00', 4, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/naranja.jpg'),
(96, NULL, 'Naranja 25pz (Oranges)', '25 Unidades', 100, '0.00', 4, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/naranja.jpg'),
(97, NULL, 'Naranja 50pz (Oranges)', 'Bolsa de 50', 100, '0.00', 4, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/naranja.jpg'),
(98, NULL, 'Naranja 90pz Saco (Oranges)', 'Bolsa de 90', 100, '0.00', 4, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/naranja.jpg'),
(99, NULL, 'Tomate de árbol', 'lb.', 100, '0.00', 4, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/tomatearbol.jpg'),
(100, NULL, 'Toronja', 'Unidad', 100, '0.00', 4, 1, 0, 2, 1, 'https://frutydeliveries.com/pedidos/img/toronja.jpg'),
(101, NULL, 'Papaya', 'Unidad (each)', 100, '0.00', 4, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/papaya.jpg'),
(102, NULL, 'Pera (Pear)', 'Unidad (each)', 100, '0.00', 4, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/pera.jpg'),
(103, NULL, 'Piña (Pine Apple)', 'Unidad (each)', 100, '0.00', 4, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/piña.png'),
(104, NULL, 'Sandía (Watermelon)', 'Unidad (each)', 100, '0.00', 4, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/sandia.jpg'),
(105, NULL, 'Uva Roja', 'lb.', 100, '0.00', 4, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/uva_roja.jpg'),
(106, NULL, 'Uva Verde', 'lb.', 100, '0.00', 4, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/uva_verde.jpg'),
(107, NULL, 'Uva Negra', 'lb.', 100, '0.00', 4, 1, 0, 2, 1, 'https://frutydeliveries.com/pedidos/img/uva_negra.jpg'),
(108, NULL, 'Uchuva (Goose Berry)', 'Caja Pequeña', 100, '0.00', 4, 1, 0, 2, 1, 'https://frutydeliveries.com/pedidos/img/uchuva.jpg'),
(109, NULL, 'Albahaca (Basil)', 'Manojo (bunch)', 100, '0.00', 5, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/albahaca.jpg'),
(110, NULL, 'Aloe Vera (Sábila) Penca', 'Penca grande (hoja)', 100, '0.00', 5, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/aloe_vera.jpg'),
(111, NULL, 'Aloe Vera (Sábila) Mata', 'Planta entera', 100, '0.00', 5, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/aloe_vera_mata.jpg'),
(112, NULL, 'Cebollina (Chives)', 'Mazo pequeño', 100, '0.00', 5, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/cebollina.jpg'),
(113, NULL, 'Cebollina Mazo Grande (Chives)', 'Mazo grande', 100, '0.00', 5, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/cebollina.jpg'),
(114, NULL, 'Cilantro Mazo Pequeño(Coriander)', 'Medio mazo grande', 100, '0.00', 5, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/Cilantro.jpg'),
(115, NULL, 'Cilantro Mazo Grande (Coriander)', '1/2 lb.', 100, '0.00', 5, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/Cilantro.jpg'),
(116, NULL, 'Culantro (Wild Coriander)', 'Mazo pequeño', 100, '0.00', 5, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/culantro.png'),
(117, NULL, 'Culantro  Mazo grande (Wild Coriander)', 'Mazo grande', 100, '0.00', 5, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/culantro.png'),
(118, NULL, 'Eneldo (Dill)', 'Mazo', 100, '0.00', 5, 1, 0, 2, 1, 'https://frutydeliveries.com/pedidos/img/eneldo.jpg'),
(119, NULL, 'Hierbabuena', 'Mazo', 100, '0.00', 5, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/hierbabuena.jpg'),
(120, NULL, 'Hierba Limón', 'Limonaria Mazo.', 100, '0.00', 5, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/limonaria.jpg'),
(121, NULL, 'Menta (Mint)', 'Manojo (bunch)', 100, '0.00', 5, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/menta.jpg'),
(122, NULL, 'Oregano Fresco', 'Manojo (bunch)', 100, '0.00', 5, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/oregano.jpg'),
(123, NULL, 'Perejil (Parsley)', 'Unidad (each)', 100, '0.00', 5, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/perejil.jpg'),
(124, NULL, 'Perejil Mazo Grande (Parsley)', 'Unidad (each)', 100, '0.00', 5, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/perejil.jpg'),
(125, NULL, 'Reca’o verde (Perejil, Culantro, Cebollina)', 'Unidad (each)', 100, '0.00', 5, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/recaoverde.jpg'),
(126, NULL, 'Romero fresco (Fresh Rosemary)', 'Manojo (bunch)', 100, '0.00', 5, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/romero.jpg'),
(127, NULL, 'Hongo Blanco ', 'Champiñon Cajita', 100, '0.00', 6, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/hongo_blanco.jpg'),
(128, NULL, 'Hongo Crimini', 'Cajita', 100, '0.00', 6, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/hongo_crimini.jpg'),
(129, NULL, 'Hongo Portobello', 'Cajita', 100, '0.00', 6, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/hongo_portobelo.jpg'),
(130, NULL, 'Paquete hagas tu salsita (Mexican salsa ingredients)', '1lb Tomatillo,1/2 lb Chile Jalapeño, 1Lb Cebolla, 1 Ajo, 1 Cilantro. Incluye Receta', 100, '0.00', 7, 1, 0, 2, 1, 'https://frutydeliveries.com/pedidos/img/Salsa_verde.jpg'),
(131, NULL, 'Aguacate Hass Grande', 'GRANDE Unidad (each) ', 100, '0.00', 7, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/hass.jpg'),
(132, NULL, 'Aguacate Hass Chico', 'Unidad (each) ', 100, '0.00', 7, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/hass.jpg'),
(133, NULL, 'Chile Criollo', 'Muy Picante Bolsita ', 100, '0.00', 7, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/chilecriollo.jpg'),
(134, NULL, 'Chiltepín', 'Bolsita', 100, '0.00', 7, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/chiltepin.jpg'),
(135, NULL, 'Chile Ancho', 'Bolsa 6 Oz, 170 gr.', 100, '0.00', 7, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/chile_ancho.jpg'),
(136, NULL, 'Chile de Arbol', 'Bolsa 6 Oz, 170 gr.', 100, '0.00', 7, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/chile_arbol.jpg'),
(137, NULL, 'Chile Jalapeño', 'lb.', 100, '0.00', 7, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/jalapeno.jpg'),
(138, NULL, 'Chile Poblano', 'lb.', 100, '0.00', 7, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/chile-poblano.jpg'),
(139, NULL, 'Chile Serrano', 'lb.', 100, '0.00', 7, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/serrano.jpg'),
(140, NULL, 'Chile Chipotle', 'Bolsa 3 Oz 85.05 gr.', 100, '0.00', 7, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/chile_chipotle.jpg'),
(141, NULL, 'Chile Guajillo', 'Bolsa 6 Oz, 170 gr.', 100, '0.00', 7, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/chile_guajillo.jpg'),
(142, NULL, 'Chile Pasilla', 'Bolsa 3 Oz 85.05 gr.', 100, '0.00', 7, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/chile_pasilla.jpg'),
(143, NULL, 'Chile Piquín', 'Bolsa Pequeña 0.5 Oz', 100, '0.00', 7, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/chile_piquin.jpg'),
(144, NULL, 'Flor de Jamaica (Saril)', 'Bolsa 228gr. Seca', 100, '0.00', 7, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/jamaica.jpg'),
(145, NULL, 'Jícama', 'lb.', 100, '0.00', 7, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/jicama.jpg'),
(146, NULL, 'Salsa Valentina Chica', 'Botella Chica', 100, '0.00', 7, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/valentina_chica.jpg'),
(147, NULL, 'Salsa Valentina Grande', 'Botella Grande', 100, '0.00', 7, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/valentina_grande.jpg'),
(148, NULL, 'Tajin', '', 100, '0.00', 7, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/tajin.jpg'),
(149, NULL, 'Tomatillo', 'lb. Tomate Verde', 100, '0.00', 7, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/tomatillo.jpg'),
(150, NULL, 'Cacahuate (Maní, Peanuts)', 'lb. en cáscara', 100, '0.00', 7, 1, 0, 2, 1, 'https://frutydeliveries.com/pedidos/img/mani.jpg'),
(151, NULL, '12 Huevos (Eggs)', 'Paquete de 12', 100, '0.00', 8, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/huevo.jpg'),
(152, NULL, '30 Huevos (Eggs)', 'Paquete de 30', 100, '0.00', 8, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/huevo.jpg'),
(153, NULL, '12 Huevos Orgánicos (Organic Eggs)', 'Paquete de 12, huevo orgánico, fertil (de patio)', 100, '0.00', 8, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/huevo.jpg'),
(154, NULL, '30 Huevos Orgánicos (Organic Eggs)', 'Paquete de 30, huevo orgánico, fertil (de patio)', 100, '0.00', 8, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/huevo.jpg'),
(155, NULL, '18 Huevos Codorniz', 'Paquete de 18', 100, '0.00', 8, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/huevo_codorniz.jpg'),
(156, NULL, 'Coco Deshidratado', 'Bolsa 25 gr.', 100, '0.00', 9, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/coco_seco.jpg'),
(157, NULL, 'Mango deshidratado', 'Bolsa 25 gr.', 100, '0.00', 9, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/mango_seco.jpg'),
(158, NULL, 'Mix de frutas deshidratadas', 'Bolsa 25 gr.', 100, '0.00', 9, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/mix_seco.jpg'),
(159, NULL, 'Papaya Deshidratada', 'Bolsa 25 gr.', 100, '0.00', 9, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/papaya_seca.jpg'),
(160, NULL, 'Pera Deshidratada', 'Bolsa 25 gr.', 100, '0.00', 9, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/peraseca.jpg'),
(161, NULL, 'Piña enchilada Deshidratada', 'Bolsa 25 gr.', 100, '0.00', 9, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/piña_chile.jpg'),
(162, NULL, 'Naranja Deshidratada', 'Bolsa 25 gr.', 100, '0.00', 9, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/manzana_seca.jpg'),
(163, NULL, 'Banola (Banana con granola)', 'Bolsa 25 gr.', 100, '0.00', 9, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/banola.jpg'),
(164, NULL, 'Manzana Deshidratada', 'Bolsa 25 gr.', 100, '0.00', 9, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/naranja_seca.jpg'),
(165, NULL, 'Manzana Deshidratada Canela', 'Bolsa 25 gr.', 100, '0.00', 9, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/manzana_canela_seca.jpg'),
(166, NULL, 'Piña Deshidratada', 'Bolsa 25 gr.', 100, '0.00', 9, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/pina_seca.jpg'),
(167, NULL, 'Datiles Secos', '225 gr.', 100, '10.00', 9, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/datil.jpg'),
(168, NULL, 'Pasas', '225 gr.', 100, '2.45', 9, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/pasas.jpg'),
(169, NULL, 'Chia', '225 gr.', 100, '2.85', 9, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/chia.jpg'),
(170, NULL, 'Quinoa (Amaranto)', '225 gr.', 100, '4.10', 9, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/quinoa.jpg'),
(171, NULL, 'Ajonjolí', '225 gr.', 100, '2.53', 9, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/ajonjoli.jpg'),
(172, NULL, 'Achiote ', 'Bolsita', 100, '0.00', 10, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/achiote.jpg'),
(173, NULL, 'Botella de Picante (Chilly bottle)', 'Botella', 100, '0.00', 10, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/picante.jpg'),
(174, NULL, 'Canela en Polvo', 'Botecito 60 gr.', 100, '2.25', 10, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/canela_polvo.jpg'),
(175, NULL, 'Clavo de Olor', 'Botecito 36 gr.', 100, '2.25', 10, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/clavo_olor.jpg'),
(176, NULL, 'Comino en Polvo', 'Botecito 54 gr.', 100, '2.25', 10, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/comino.jpg'),
(177, NULL, 'Culantro en Polvo', 'Botecito 10 gr.', 100, '2.25', 10, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/culantro.jpg'),
(178, NULL, 'Pimienta entera (Molinillo)', 'Molinillo con 55 gr.', 100, '4.25', 10, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/pimienta_entera.jpg'),
(179, NULL, 'Pimienta Molida', 'Botecito 50 gr.', 100, '2.25', 10, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/pimienta_molida.jpg'),
(180, NULL, 'Sal del Himalaya (Molinillo)', 'Molinillo con 100 gr.', 100, '4.50', 10, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/sal_himalaya.jpg'),
(181, NULL, 'Salsa de ají chombo (Habanero)', 'Botella 59 ml', 100, '1.95', 10, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/salsa_chombo.jpg'),
(182, NULL, 'Sazonador completo', 'Botecito 72 gr.', 100, '2.75', 10, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/sazonador.jpg'),
(183, NULL, 'Aceite de Coco', 'Botella', 100, '6.00', 11, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/aceite_coco.jpg'),
(184, NULL, 'Desinfectante Orgánico de verduras', 'Desinfectante orgánico para verduras, botella de  650ml', 100, '5.50', 11, 1, 0, 2, 1, 'https://frutydeliveries.com/pedidos/img/desinfectante.jpg'),
(185, NULL, 'Hoja de Bijao', 'Rollo', 100, '0.00', 11, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/hoja_bijao.jpg'),
(186, NULL, 'Hoja de Plátano', 'Rollo GRANDE', 100, '0.00', 11, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/hoja_platano.jpg'),
(187, NULL, 'Levadura (Bread yeast)', '500 gr.', 100, '4.00', 11, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/levadura.jpg'),
(188, NULL, 'Miel de abeja grande (Bee honey)', '24 oz. Botella grande (big bottle)', 100, '0.00', 11, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/miel.png'),
(189, NULL, 'Miel de abeja pequeña (Bee honey)', '4 oz. Botella pequeña (small bottle)', 100, '0.00', 11, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/miel.png'),
(190, NULL, 'Miel de abeja 100% pura grande (Bee honey)', 'Botella grande (big bottle)', 100, '18.00', 11, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/miel.png'),
(191, NULL, 'Miel de abeja 100% pura pequeña (Bee honey)', 'Botella pequeña (small bottle)', 100, '13.00', 11, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/miel.png'),
(192, NULL, 'Raspadura (Unrefined Brown Sugar)', 'Unidad (each)', 100, '0.00', 11, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/raspadura.jpg'),
(193, NULL, 'Raspaduras', 'Paquete de 4', 100, '0.00', 11, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/raspadura.jpg'),
(194, NULL, 'Tamarindo', 'Bolsita', 100, '0.00', 11, 1, 0, 2, 1, 'https://www.frutydeliveries.com/pedidos/img/tamarindo.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `rol`
--

CREATE TABLE `rol` (
  `id` int(11) NOT NULL,
  `rol` varchar(255) DEFAULT NULL COMMENT '{"name":"Rol"}'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rol`
--

INSERT INTO `rol` (`id`, `rol`) VALUES
(1, 'Administrado'),
(2, 'Vendedor'),
(3, 'Cliente');

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `id` int(11) NOT NULL,
  `status` varchar(45) DEFAULT NULL COMMENT '{"name":"Estatus"}'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`id`, `status`) VALUES
(1, 'Activar'),
(2, 'Desactivar');

-- --------------------------------------------------------

--
-- Table structure for table `status_pedido`
--

CREATE TABLE `status_pedido` (
  `id` int(11) NOT NULL,
  `status_pedido` varchar(255) DEFAULT NULL,
  `empresa_id` int(11) NOT NULL,
  `color` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `status_pedido`
--

INSERT INTO `status_pedido` (`id`, `status_pedido`, `empresa_id`, `color`) VALUES
(6, 'Solicitado', 1, '#43d7e0'),
(7, 'Procesado', 1, '#5cd631'),
(8, 'Cancelado', 1, '#e80d69');

-- --------------------------------------------------------

--
-- Table structure for table `unidad_medida`
--

CREATE TABLE `unidad_medida` (
  `id` int(11) NOT NULL,
  `unidad_medida` varchar(255) DEFAULT NULL,
  `empresa_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `unidad_medida`
--

INSERT INTO `unidad_medida` (`id`, `unidad_medida`, `empresa_id`) VALUES
(1, 'lb', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL COMMENT '{"name":"Nombre"}',
  `email` varchar(45) DEFAULT NULL COMMENT '{"name":"Correo"}',
  `user` varchar(45) DEFAULT NULL COMMENT '{"name":"Usuario"}',
  `password` varchar(45) DEFAULT NULL COMMENT '{"name":"Clave"}',
  `rol_id` int(11) NOT NULL COMMENT '{"name":"Rol"}',
  `status_id` int(11) NOT NULL COMMENT '{"name":"Estatus"}',
  `empresa_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='{"structure": {"img": "true"}}';

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `user`, `password`, `rol_id`, `status_id`, `empresa_id`) VALUES
(1, 'Fernando', 'alfdixi@gmail.com', 'Admin', '202cb962ac59075b964b07152d234b70', 1, 1, NULL),
(2, 'José Luis Vieyra', 'alfdixi@live.com.mx', 'Vendedor', '202cb962ac59075b964b07152d234b70', 3, 1, 1),
(3, 'Eduardo Contreras', 'lalo@gmail.com', 'Eduardo', '202cb962ac59075b964b07152d234b70', 3, 1, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_categoria_empresa1_idx` (`empresa_id`);

--
-- Indexes for table `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_cliente_empresa1_idx` (`empresa_id`);

--
-- Indexes for table `codigo_pais`
--
ALTER TABLE `codigo_pais`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_codigo_pais_pais1_idx` (`pais_id`);

--
-- Indexes for table `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_detalle_pedido_producto1_idx` (`producto_id`),
  ADD KEY `fk_detalle_pedido_pedidos1_idx` (`pedidos_id`);

--
-- Indexes for table `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_empresa_plantilla1_idx` (`plantilla_id`),
  ADD KEY `fk_empresa_codigo_pais1_idx` (`codigo_pais_id`),
  ADD KEY `fk_empresa_status_pedido1_idx` (`status_pedido_id`);

--
-- Indexes for table `pais`
--
ALTER TABLE `pais`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_pedidos_cliente1_idx` (`cliente_id`),
  ADD KEY `fk_pedidos_empresa1_idx` (`empresa_id`),
  ADD KEY `fk_pedidos_status_pedido1_idx` (`status_pedido_id`);

--
-- Indexes for table `plantilla`
--
ALTER TABLE `plantilla`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_producto_categoria1_idx` (`categoria_id`),
  ADD KEY `fk_producto_unidad_medida1_idx` (`unidad_medida_id`),
  ADD KEY `fk_producto_user1_idx` (`user_id`),
  ADD KEY `fk_producto_empresa1_idx` (`empresa_id`);

--
-- Indexes for table `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `status_pedido`
--
ALTER TABLE `status_pedido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_status_pedido_empresa1_idx` (`empresa_id`);

--
-- Indexes for table `unidad_medida`
--
ALTER TABLE `unidad_medida`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_unidad_medida_empresa1_idx` (`empresa_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_rol_idx` (`rol_id`),
  ADD KEY `fk_user_status1_idx` (`status_id`),
  ADD KEY `fk_user_empresa1_idx` (`empresa_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `codigo_pais`
--
ALTER TABLE `codigo_pais`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `empresa`
--
ALTER TABLE `empresa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pais`
--
ALTER TABLE `pais`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

--
-- AUTO_INCREMENT for table `plantilla`
--
ALTER TABLE `plantilla`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `producto`
--
ALTER TABLE `producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=195;

--
-- AUTO_INCREMENT for table `rol`
--
ALTER TABLE `rol`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `status_pedido`
--
ALTER TABLE `status_pedido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `unidad_medida`
--
ALTER TABLE `unidad_medida`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categoria`
--
ALTER TABLE `categoria`
  ADD CONSTRAINT `fk_categoria_empresa1` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `fk_cliente_empresa1` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `codigo_pais`
--
ALTER TABLE `codigo_pais`
  ADD CONSTRAINT `fk_codigo_pais_pais1` FOREIGN KEY (`pais_id`) REFERENCES `pais` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD CONSTRAINT `fk_detalle_pedido_pedidos1` FOREIGN KEY (`pedidos_id`) REFERENCES `pedidos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_detalle_pedido_producto1` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `empresa`
--
ALTER TABLE `empresa`
  ADD CONSTRAINT `fk_empresa_codigo_pais1` FOREIGN KEY (`codigo_pais_id`) REFERENCES `codigo_pais` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_empresa_plantilla1` FOREIGN KEY (`plantilla_id`) REFERENCES `plantilla` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_empresa_status_pedido1` FOREIGN KEY (`status_pedido_id`) REFERENCES `status_pedido` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `fk_pedidos_cliente1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pedidos_empresa1` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pedidos_status_pedido1` FOREIGN KEY (`status_pedido_id`) REFERENCES `status_pedido` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `fk_producto_categoria1` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_producto_empresa1` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_producto_unidad_medida1` FOREIGN KEY (`unidad_medida_id`) REFERENCES `unidad_medida` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_producto_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `status_pedido`
--
ALTER TABLE `status_pedido`
  ADD CONSTRAINT `fk_status_pedido_empresa1` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `unidad_medida`
--
ALTER TABLE `unidad_medida`
  ADD CONSTRAINT `fk_unidad_medida_empresa1` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `fk_user_empresa1` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_rol` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_status1` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
