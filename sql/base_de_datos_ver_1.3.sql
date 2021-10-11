-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-10-2021 a las 16:14:58
-- Versión del servidor: 10.4.17-MariaDB
-- Versión de PHP: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `base de datos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE `empresa` (
  `id_empresa` int(11) NOT NULL,
  `nit` int(11) NOT NULL,
  `nombre_empresa` varchar(70) NOT NULL,
  `ciudad` varchar(100) NOT NULL,
  `email` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ofertas`
--

CREATE TABLE `ofertas` (
  `id` int(11) NOT NULL,
  `Puesto_buscado` varchar(50) CHARACTER SET utf8 NOT NULL,
  `Nombre_empresa` varchar(50) NOT NULL,
  `Descripion_oferta` varchar(255) CHARACTER SET ucs2 NOT NULL,
  `Salario_oferta` int(11) NOT NULL,
  `Horario` varchar(50) CHARACTER SET utf32 NOT NULL,
  `Requerimientos_adicionales` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `id_persona` int(11) NOT NULL,
  `nombres` varchar(70) NOT NULL,
  `n_identificacion` varchar(20) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `email` varchar(70) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `sexo` varchar(20) NOT NULL,
  `telefono` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_empresa`
--

CREATE TABLE `usuario_empresa` (
  `id_usuario_e` int(11) NOT NULL,
  `nombre_usuario` varchar(30) COLLATE utf8_bin NOT NULL,
  `contraseña` varchar(30) COLLATE utf8_bin NOT NULL,
  `area` varchar(45) COLLATE utf8_bin NOT NULL,
  `n_ofertas` varchar(70) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_persona`
--

CREATE TABLE `usuario_persona` (
  `id_usuario` int(11) NOT NULL,
  `nombre_usuario` varchar(30) NOT NULL,
  `contraseña` varchar(30) NOT NULL,
  `area` varchar(45) NOT NULL,
  `experiencia` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`id_empresa`),
  ADD KEY `nombre_empresa` (`nombre_empresa`),
  ADD KEY `ciudad` (`ciudad`);

--
-- Indices de la tabla `ofertas`
--
ALTER TABLE `ofertas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Nombre_empresa` (`Nombre_empresa`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`id_persona`),
  ADD KEY `nombres` (`nombres`),
  ADD KEY `direccion` (`direccion`);

--
-- Indices de la tabla `usuario_empresa`
--
ALTER TABLE `usuario_empresa`
  ADD KEY `nombre_usuario` (`nombre_usuario`),
  ADD KEY `id_usuario_e` (`id_usuario_e`) USING BTREE,
  ADD KEY `area` (`area`);

--
-- Indices de la tabla `usuario_persona`
--
ALTER TABLE `usuario_persona`
  ADD KEY `Id_persona_idx` (`id_usuario`),
  ADD KEY `nombre_usuario` (`nombre_usuario`),
  ADD KEY `area` (`area`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `empresa`
--
ALTER TABLE `empresa`
  MODIFY `id_empresa` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ofertas`
--
ALTER TABLE `ofertas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `id_persona` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD CONSTRAINT `empresa_ibfk_1` FOREIGN KEY (`nombre_empresa`) REFERENCES `ofertas` (`Nombre_empresa`);

--
-- Filtros para la tabla `ofertas`
--
ALTER TABLE `ofertas`
  ADD CONSTRAINT `ofertas_ibfk_1` FOREIGN KEY (`Nombre_empresa`) REFERENCES `empresa` (`nombre_empresa`);

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `persona_ibfk_1` FOREIGN KEY (`id_persona`) REFERENCES `usuario_persona` (`id_usuario`);

--
-- Filtros para la tabla `usuario_empresa`
--
ALTER TABLE `usuario_empresa`
  ADD CONSTRAINT `usuario_empresa_ibfk_1` FOREIGN KEY (`id_usuario_e`) REFERENCES `empresa` (`id_empresa`);

--
-- Filtros para la tabla `usuario_persona`
--
ALTER TABLE `usuario_persona`
  ADD CONSTRAINT `Id_persona` FOREIGN KEY (`id_usuario`) REFERENCES `persona` (`id_persona`),
  ADD CONSTRAINT `usuario_persona_ibfk_1` FOREIGN KEY (`nombre_usuario`) REFERENCES `persona` (`nombres`),
  ADD CONSTRAINT `usuario_persona_ibfk_2` FOREIGN KEY (`area`) REFERENCES `persona` (`direccion`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
