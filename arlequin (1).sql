-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-02-2024 a las 03:05:16
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `arlequin`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(30) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `telefono` int(30) NOT NULL,
  `telefonodos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `nombre`, `telefono`, `telefonodos`) VALUES
(1, 'Mayra Gonzalez', 33432, 68686),
(2, 'juan hernandez', 553798764, 2147483647),
(3, 'juan hernandez', 553798764, 2147483647);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deudas`
--

CREATE TABLE `deudas` (
  `id_deuda` int(11) NOT NULL,
  `id_pastelpersozalizados` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `precios_descontar` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `kilos`
--

CREATE TABLE `kilos` (
  `id_kilos` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_kilos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `kilos`
--

INSERT INTO `kilos` (`id_kilos`, `cantidad`, `precio_kilos`) VALUES
(1, 30, 230),
(2, 90, 509),
(3, 90, 509);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pasteles_personalizados`
--

CREATE TABLE `pasteles_personalizados` (
  `id_pastelpersozalizados` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_kilos` int(11) NOT NULL,
  `id_tablas` int(11) NOT NULL,
  `ubicacion` varchar(30) NOT NULL,
  `fecha entrega` date NOT NULL,
  `flete` int(11) NOT NULL,
  `precio_total` int(11) NOT NULL,
  `id_usuario` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(30) NOT NULL,
  `foto` varchar(100) NOT NULL,
  `nombre_producto` varchar(30) NOT NULL,
  `precio_venta` int(30) NOT NULL,
  `stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `foto`, `nombre_producto`, `precio_venta`, `stock`) VALUES
(1, 'foto1', 'Arroz', 350, 10),
(3, 'Pastel cincok', 'Pasteles', 300, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tablas`
--

CREATE TABLE `tablas` (
  `id_tabla` int(11) NOT NULL,
  `nombre_tabla` varchar(30) NOT NULL,
  `stock` int(11) NOT NULL,
  `precio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idusuario` int(100) NOT NULL,
  `usuario` varchar(255) NOT NULL,
  `matricula` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `cargo` varchar(255) NOT NULL,
  `estado` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idusuario`, `usuario`, `matricula`, `password`, `cargo`, `estado`) VALUES
(1, 'Jesus', 'jahg', 'jahg', 'admin', 'activo'),
(2, 'Angel', 'adhr', 'adhr', 'admin', 'activo'),
(3, 'Aleydis Hernandez', 'ALDJ', 'ABCDE', 'vendedora', 'actocp'),
(4, 'Maria Hernandez', 'MHFE', 'AEIOU', 'vendedora', 'actitvo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id_venta` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `fecha_venta` date NOT NULL,
  `estado` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `deudas`
--
ALTER TABLE `deudas`
  ADD PRIMARY KEY (`id_deuda`),
  ADD KEY `id_pastelpersozalizados` (`id_pastelpersozalizados`,`id_cliente`,`id_usuario`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `kilos`
--
ALTER TABLE `kilos`
  ADD PRIMARY KEY (`id_kilos`);

--
-- Indices de la tabla `pasteles_personalizados`
--
ALTER TABLE `pasteles_personalizados`
  ADD PRIMARY KEY (`id_pastelpersozalizados`),
  ADD KEY `id_cliente` (`id_cliente`,`id_kilos`,`id_tablas`,`id_usuario`),
  ADD KEY `id_tablas` (`id_tablas`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_kilos` (`id_kilos`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tablas`
--
ALTER TABLE `tablas`
  ADD PRIMARY KEY (`id_tabla`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idusuario`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id_venta`),
  ADD UNIQUE KEY `id_usuario` (`id_usuario`,`id_producto`),
  ADD KEY `id_producto` (`id_producto`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `deudas`
--
ALTER TABLE `deudas`
  MODIFY `id_deuda` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `kilos`
--
ALTER TABLE `kilos`
  MODIFY `id_kilos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `pasteles_personalizados`
--
ALTER TABLE `pasteles_personalizados`
  MODIFY `id_pastelpersozalizados` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tablas`
--
ALTER TABLE `tablas`
  MODIFY `id_tabla` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idusuario` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id_venta` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `deudas`
--
ALTER TABLE `deudas`
  ADD CONSTRAINT `deudas_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`),
  ADD CONSTRAINT `deudas_ibfk_2` FOREIGN KEY (`id_pastelpersozalizados`) REFERENCES `pasteles_personalizados` (`id_pastelpersozalizados`),
  ADD CONSTRAINT `deudas_ibfk_3` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`idusuario`);

--
-- Filtros para la tabla `pasteles_personalizados`
--
ALTER TABLE `pasteles_personalizados`
  ADD CONSTRAINT `pasteles_personalizados_ibfk_2` FOREIGN KEY (`id_tablas`) REFERENCES `tablas` (`id_tabla`),
  ADD CONSTRAINT `pasteles_personalizados_ibfk_3` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`),
  ADD CONSTRAINT `pasteles_personalizados_ibfk_4` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`idusuario`),
  ADD CONSTRAINT `pasteles_personalizados_ibfk_5` FOREIGN KEY (`id_kilos`) REFERENCES `kilos` (`id_kilos`);

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`),
  ADD CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`idusuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
