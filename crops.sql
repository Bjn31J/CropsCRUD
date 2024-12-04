-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-11-2024 a las 03:21:18
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
-- Base de datos: `crops`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `id_empleado` int(11) NOT NULL,
  `primer_apellido` varchar(50) DEFAULT NULL,
  `segundo_apellido` varchar(50) DEFAULT NULL,
  `nombre` varchar(50) NOT NULL,
  `rfc` varchar(13) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `fotografia` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`id_empleado`, `primer_apellido`, `segundo_apellido`, `nombre`, `rfc`, `id_usuario`, `fotografia`) VALUES
(17, 'Paramo', 'Sanchez', 'Pedro', '1233435465656', 1, 'd55bc670aac6dbfa89e35f8ccd9a2279.jpg'),
(18, 'Rodriguez', 'Peralta', 'Eduardo', '1234556678787', 2, '4028f4419167b799159349051c95111d.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `invernadero`
--

CREATE TABLE `invernadero` (
  `id_invernadero` int(11) NOT NULL,
  `invernadero` varchar(50) NOT NULL,
  `latitud` varchar(20) NOT NULL,
  `longitud` varchar(20) NOT NULL,
  `area` decimal(8,2) NOT NULL,
  `fechaCreacion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `invernadero`
--

INSERT INTO `invernadero` (`id_invernadero`, `invernadero`, `latitud`, `longitud`, `area`, `fechaCreacion`) VALUES
(17, 'Mr. Lucky Brocoli', '500', '246', 500.00, '2024-11-25'),
(18, 'Mr. Lucky Papa', '666', '999', 400.00, '2024-11-25'),
(19, 'Mr. Lucky Zanahoria', '200', '500', 1000.00, '2024-11-25'),
(20, 'Mr. Lucky Calabaza ', '456', '789', 700.00, '2024-11-25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permiso`
--

CREATE TABLE `permiso` (
  `id_permiso` int(11) NOT NULL,
  `permiso` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `permiso`
--

INSERT INTO `permiso` (`id_permiso`, `permiso`) VALUES
(1, 'index'),
(2, 'Ver invernaderos'),
(3, 'Nuevo invernadero'),
(4, 'Modificar invernadero'),
(5, 'Eliminar invernadero'),
(6, 'Agregar usuario'),
(7, 'Modificar usuario'),
(8, 'Eliminar usuario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id_rol` int(11) NOT NULL,
  `rol` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id_rol`, `rol`) VALUES
(1, 'Usuario'),
(2, 'Cliente'),
(3, 'Administrador'),
(4, 'Agricultor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol_permiso`
--

CREATE TABLE `rol_permiso` (
  `id_rol` int(11) NOT NULL,
  `id_permiso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `rol_permiso`
--

INSERT INTO `rol_permiso` (`id_rol`, `id_permiso`) VALUES
(3, 2),
(3, 3),
(3, 4),
(3, 5),
(3, 6),
(3, 7),
(3, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seccion`
--

CREATE TABLE `seccion` (
  `id_seccion` int(11) NOT NULL,
  `seccion` varchar(50) NOT NULL,
  `area` decimal(8,2) NOT NULL,
  `id_invernadero` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `seccion`
--

INSERT INTO `seccion` (`id_seccion`, `seccion`, `area`, `id_invernadero`) VALUES
(22, 'Celaya', 700.00, 17),
(23, 'Queretaro', 600.00, 18),
(24, 'Toluca', 300.00, 19),
(25, 'Chicago', 800.00, 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `contrasena` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `correo`, `contrasena`) VALUES
(1, '20030835@itcelaya.edu.mx', '202cb962ac59075b964b07152d234b70'),
(2, 'luislao@itcelaya.edu.mx', 'd16fb36f0911f878998c136191af705e'),
(3, 'l20030835@celaya.tecnm.mx', '202cb962ac59075b964b07152d234b70');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_rol`
--

CREATE TABLE `usuario_rol` (
  `id_usuario` int(11) NOT NULL,
  `id_rol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario_rol`
--

INSERT INTO `usuario_rol` (`id_usuario`, `id_rol`) VALUES
(1, 2),
(1, 3),
(2, 3),
(3, 1),
(3, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_seccion_cantidadinvernaderos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_seccion_cantidadinvernaderos` (
`seccion` varchar(50)
,`cantInvernaderos` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_seccion_cantinvernaderos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_seccion_cantinvernaderos` (
`seccion` varchar(50)
,`cant_invernaderos` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_seccion_cantidadinvernaderos`
--
DROP TABLE IF EXISTS `vista_seccion_cantidadinvernaderos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_seccion_cantidadinvernaderos`  AS SELECT `s`.`seccion` AS `seccion`, coalesce(count(`i`.`id_invernadero`),0) AS `cantInvernaderos` FROM (`seccion` `s` left join `invernadero` `i` on(`s`.`id_invernadero` = `i`.`id_invernadero`)) GROUP BY `s`.`seccion` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_seccion_cantinvernaderos`
--
DROP TABLE IF EXISTS `vista_seccion_cantinvernaderos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_seccion_cantinvernaderos`  AS SELECT `s`.`seccion` AS `seccion`, count(`i`.`invernadero`) AS `cant_invernaderos` FROM (`seccion` `s` left join `invernadero` `i` on(`s`.`id_invernadero` = `i`.`id_invernadero`)) GROUP BY `s`.`seccion` ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`id_empleado`);

--
-- Indices de la tabla `invernadero`
--
ALTER TABLE `invernadero`
  ADD PRIMARY KEY (`id_invernadero`);

--
-- Indices de la tabla `permiso`
--
ALTER TABLE `permiso`
  ADD PRIMARY KEY (`id_permiso`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `rol_permiso`
--
ALTER TABLE `rol_permiso`
  ADD PRIMARY KEY (`id_rol`,`id_permiso`),
  ADD KEY `fk_id_permiso` (`id_permiso`);

--
-- Indices de la tabla `seccion`
--
ALTER TABLE `seccion`
  ADD PRIMARY KEY (`id_seccion`),
  ADD KEY `fk_id_invernadero_seccion` (`id_invernadero`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- Indices de la tabla `usuario_rol`
--
ALTER TABLE `usuario_rol`
  ADD PRIMARY KEY (`id_usuario`,`id_rol`),
  ADD KEY `fk_id_rol_usuario_rol` (`id_rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `id_empleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `invernadero`
--
ALTER TABLE `invernadero`
  MODIFY `id_invernadero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `permiso`
--
ALTER TABLE `permiso`
  MODIFY `id_permiso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `seccion`
--
ALTER TABLE `seccion`
  MODIFY `id_seccion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `rol_permiso`
--
ALTER TABLE `rol_permiso`
  ADD CONSTRAINT `fk_id_permiso` FOREIGN KEY (`id_permiso`) REFERENCES `permiso` (`id_permiso`),
  ADD CONSTRAINT `fk_id_rol` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`);

--
-- Filtros para la tabla `seccion`
--
ALTER TABLE `seccion`
  ADD CONSTRAINT `fk_id_invernadero_seccion` FOREIGN KEY (`id_invernadero`) REFERENCES `invernadero` (`id_invernadero`);

--
-- Filtros para la tabla `usuario_rol`
--
ALTER TABLE `usuario_rol`
  ADD CONSTRAINT `fk_id_rol_usuario_rol` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`),
  ADD CONSTRAINT `fk_id_usuario_usuario_rol` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
