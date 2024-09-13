-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-09-2024 a las 18:52:39
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
-- Base de datos: `lpc`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `admins`
--

INSERT INTO `admins` (`id`, `userId`, `createdAt`, `updatedAt`) VALUES
(1, 1, '2024-08-25 19:22:09', '2024-08-25 19:22:09'),
(2, 15, '2024-08-28 01:05:21', '2024-08-28 01:05:21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nacionCliente` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `userId` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nacionCliente`, `direccion`, `userId`, `createdAt`, `updatedAt`) VALUES
(1, 'argentina', 'calle novena', 2, '2024-08-27 02:32:42', '2024-09-11 14:47:41'),
(2, NULL, NULL, 22, '2024-09-10 17:10:58', '2024-09-10 17:10:58'),
(3, NULL, NULL, 23, '2024-09-10 17:16:42', '2024-09-10 17:16:42'),
(4, NULL, NULL, 24, '2024-09-10 17:26:15', '2024-09-10 17:26:15'),
(5, NULL, NULL, 25, '2024-09-11 15:28:40', '2024-09-11 15:28:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `showId` int(11) DEFAULT NULL,
  `rol` enum('logistica','tecnico','otro') NOT NULL DEFAULT 'logistica',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`id`, `userId`, `showId`, `rol`, `createdAt`, `updatedAt`) VALUES
(1, 14, NULL, 'logistica', '2024-08-28 00:16:16', '2024-08-28 00:16:16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jefesalas`
--

CREATE TABLE `jefesalas` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `salaId` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `jefesalas`
--

INSERT INTO `jefesalas` (`id`, `userId`, `salaId`, `createdAt`, `updatedAt`) VALUES
(2, 4, 1, '2024-08-27 15:32:21', '2024-08-27 15:32:21'),
(4, 13, 2, '2024-08-27 16:08:33', '2024-08-27 16:08:33'),
(5, 16, 4, '2024-09-05 06:15:23', '2024-09-05 06:15:23'),
(7, 19, 6, '2024-09-05 06:24:49', '2024-09-05 06:24:49'),
(8, 20, 7, '2024-09-05 06:25:16', '2024-09-05 06:25:16'),
(9, 21, 8, '2024-09-05 06:25:39', '2024-09-05 06:25:39');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensajes`
--

CREATE TABLE `mensajes` (
  `id` int(11) NOT NULL,
  `emisor` int(11) NOT NULL,
  `receptor` int(11) NOT NULL,
  `contenido` varchar(255) NOT NULL,
  `fechaEnvio` date DEFAULT NULL,
  `leido` tinyint(1) DEFAULT 0,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `mensajes`
--

INSERT INTO `mensajes` (`id`, `emisor`, `receptor`, `contenido`, `fechaEnvio`, `leido`, `createdAt`, `updatedAt`) VALUES
(1, 2, 13, 'Hola, te saludo estoy interesado en tu Teatro Colon', '2024-08-27', 0, '2024-08-27 19:37:58', '2024-08-27 19:37:58'),
(2, 13, 2, 'claro dime en que te puedo colaborar', '2024-08-27', 0, '2024-08-27 20:15:24', '2024-08-27 20:15:24'),
(3, 13, 2, 'peguelo ñero', '2024-08-27', 0, '2024-08-27 21:01:18', '2024-08-27 21:01:18'),
(4, 2, 13, 'Hola, te saludo estoy interesado en tu Teatro Colon', '2024-08-27', 0, '2024-08-28 00:34:59', '2024-08-28 00:34:59'),
(5, 2, 4, 'Hola, te saludo estoy interesado en tu Teatro Central', '2024-08-27', 0, '2024-08-28 00:35:03', '2024-08-28 00:35:03'),
(6, 2, 13, 'Hola, te saludo estoy interesado en tu Teatro Colon', '2024-08-27', 0, '2024-08-28 00:35:34', '2024-08-28 00:35:34'),
(7, 2, 13, 'Hola, te saludo estoy interesado en tu Teatro Colon', '2024-08-27', 0, '2024-08-28 00:35:35', '2024-08-28 00:35:35'),
(8, 2, 13, 'Hola, te saludo estoy interesado en tu Teatro Colon', '2024-08-27', 0, '2024-08-28 00:35:40', '2024-08-28 00:35:40'),
(9, 2, 4, 'Hola, te saludo estoy interesado en tu Teatro Central', '2024-08-27', 0, '2024-08-28 00:35:44', '2024-08-28 00:35:44'),
(10, 2, 13, 'Hola, te saludo estoy interesado en tu Teatro Colon', '2024-08-27', 0, '2024-08-28 00:36:16', '2024-08-28 00:36:16'),
(11, 4, 2, 'claro dime que tipo de show vas hacer', '2024-08-27', 0, '2024-08-28 01:27:27', '2024-08-28 01:27:27'),
(12, 2, 4, 'Hola, te saludo estoy interesado en tu Teatro Central', '2024-09-05', 0, '2024-09-05 18:02:33', '2024-09-05 18:02:33'),
(13, 2, 16, 'Hola, te saludo estoy interesado en tu Teatro Bogota', '2024-09-05', 0, '2024-09-06 02:21:29', '2024-09-06 02:21:29'),
(14, 25, 4, 'Hola, te saludo estoy interesado en tu Teatro Central', '2024-09-11', 0, '2024-09-11 15:44:13', '2024-09-11 15:44:13');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int(11) NOT NULL,
  `showId` int(11) NOT NULL,
  `salaId` int(11) DEFAULT NULL,
  `estado` enum('pendiente','en_proceso','completado') NOT NULL DEFAULT 'pendiente',
  `empleadosRequeridos` int(11) DEFAULT NULL,
  `empleadosAsignados` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`empleadosAsignados`)),
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id`, `showId`, `salaId`, `estado`, `empleadosRequeridos`, `empleadosAsignados`, `createdAt`, `updatedAt`) VALUES
(20, 51, 2, 'completado', 0, '0', '2024-09-10 16:58:12', '2024-09-11 15:21:26'),
(27, 58, 2, 'pendiente', 1, '0', '2024-09-11 15:41:59', '2024-09-11 15:46:48'),
(28, 59, 2, 'pendiente', 1, '0', '2024-09-11 15:43:06', '2024-09-11 15:46:46');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salas`
--

CREATE TABLE `salas` (
  `id` int(11) NOT NULL,
  `imagen` varchar(255) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `capacidad` int(11) NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `salas`
--

INSERT INTO `salas` (`id`, `imagen`, `nombre`, `direccion`, `capacidad`, `estado`, `createdAt`, `updatedAt`) VALUES
(1, 'https://www.ucentral.edu.co/sites/default/files/inline-images/bogota-instalaciones_0.jpg', 'Teatro Central', 'Cl. 95 #47-15, Barrios Unidos, Bogotá, Cundinamarca', 111, 1, '2024-08-25 19:28:10', '2024-08-25 19:28:10'),
(2, 'https://bogota.gov.co/sites/default/files/styles/1050px/public/2019-03/archivo_instituto_distrital_de_turismo_12.jpg', 'Teatro Colon', 'Teatro Colon', 501, 1, '2024-08-27 15:46:20', '2024-08-28 01:14:12'),
(4, 'https://www.ucentral.edu.co/sites/default/files/inline-images/bogota-panoramica2.jpg', 'Teatro Bogota', 'Teatro de Bogotá calle 22 n.° 5-62', 324, 1, '2024-08-27 15:50:44', '2024-08-27 15:50:44'),
(6, 'https://bogotateatralycircense.gov.co/sites/default/files/styles/900_x_515/public/img_salas/Menta%20y%20Verde%20Oscuro%20Ilustracio%CC%81n%20Di%CC%81a%20de%20la%20Tierra%20Tarjeta.jpg?itok=lS07eRuE', 'Teatro Bernardo Romero Lozano', 'Calle 46 No. 28-30', 150, 1, '2024-09-05 06:21:56', '2024-09-05 06:21:56'),
(7, 'https://bogotateatralycircense.gov.co/sites/default/files/styles/900_x_515/public/img_salas/CIATELTEATRODELAMONTA%C3%91A%20%2821%29.jpg?itok=910imoyB', 'El Teatro de la Montaña', 'Carrera 13 E No. 97-10, KM 5 Vía La Calera - Barrio San Isidro Alto.', 120, 1, '2024-09-05 06:23:10', '2024-09-05 06:23:10'),
(8, 'https://bogotateatralycircense.gov.co/sites/default/files/styles/900_x_515/public/img_salas/FOTO%201%20TN%20CALLE%2071%20copia.jpg?itok=cFsZfb7z', 'Teatro Nacional Calle 71', 'Calle 71 No. 10-25', 150, 1, '2024-09-05 06:24:03', '2024-09-05 06:24:03');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `shows`
--

CREATE TABLE `shows` (
  `id` int(11) NOT NULL,
  `imagen` varchar(255) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `cuposDisponibles` int(11) NOT NULL,
  `fechaPresentar` date NOT NULL,
  `horaInicio` time NOT NULL,
  `horaFin` time NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 0,
  `salaId` int(11) NOT NULL,
  `clienteId` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `shows`
--

INSERT INTO `shows` (`id`, `imagen`, `nombre`, `cuposDisponibles`, `fechaPresentar`, `horaInicio`, `horaFin`, `estado`, `salaId`, `clienteId`, `createdAt`, `updatedAt`) VALUES
(51, '/images/1725987492839-exorcista.jpg', 'Exorcista', 120, '2024-09-19', '07:57:00', '08:57:00', 1, 2, 2, '2024-09-10 16:58:12', '2024-09-11 15:21:26'),
(58, '/images/1726069319184-allzwt54br6x.png', 'prueba', 12, '2024-09-27', '10:41:00', '11:41:00', 0, 2, 25, '2024-09-11 15:41:59', '2024-09-11 15:46:48'),
(59, '/images/1726069386426-Captura de pantalla 2024-08-16 100902.png', 'asdasd', 1, '2024-09-27', '11:41:00', '12:41:00', 0, 2, 25, '2024-09-11 15:43:06', '2024-09-11 15:46:46');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `tipIdentidad` varchar(255) NOT NULL,
  `identificacion` varchar(255) NOT NULL,
  `telefono` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `role` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `nombre`, `apellido`, `tipIdentidad`, `identificacion`, `telefono`, `email`, `password`, `estado`, `role`, `createdAt`, `updatedAt`) VALUES
(1, 'asd', 'asd', 'C.C', '1231232132', '3243423424', 'asd@asd', '$2a$10$/.jYg26HYEZV5mfApw.JL.GM1rgaCf0Ge86BSLeRjqYiQ3dfkun9e', 1, 'admin', '2024-08-25 19:22:09', '2024-08-25 19:22:09'),
(2, 'dasdasdasd', 'asdsada', 'C.C', '3243243243', '3246565456', 'clien@clien.co', '$2a$10$fyloPgMNpMbZww3izD3BvuMDfvckQ0dR7aNaMVjaGNQGJEIiqN60a', 1, 'cliente', '2024-08-27 02:32:40', '2024-09-11 14:47:41'),
(4, 'Pedro', 'garcuia', 'C.C', '3123123123', '32432432432', 'jefe@jefe', '$2a$10$jO7bvKuC7YUd/et9T69kC.WEWfxGj0qRq4dv0DVkWnUZdvStXGgZa', 1, 'jefesala', '2024-08-27 15:32:21', '2024-08-27 15:32:21'),
(13, 'jefe asla 2', 'jefe', 'C.C', '2131232132123', '31233213123', 'jefesala@jefe', '$2a$10$vrR3mjOybHfvZsqSIxzQuORtalJQqC7K2HbtTOwOFAIMjK3eIBFtG', 1, 'jefesala', '2024-08-27 16:08:33', '2024-08-27 16:08:33'),
(14, 'edward', 'reyes', 'T.I', '1312321321', '3242831232', 'emple@emple', '$2a$10$nsAJJ8GRPUQk/BeGpPtrtOI.rF283qTt2niphcGbWQQ/zIrQF/RYm', 1, 'empleado', '2024-08-28 00:16:15', '2024-08-28 00:16:15'),
(15, 'sadsdasds', 'Garciadsadsada', 'C.C', '23434234', '213213123', 'admin@admin', '$2a$10$NwYDkcySrlPQiMqCChNVT.2nayjqVxImnRnv60VQeAjL83/HctB0q', 1, 'admin', '2024-08-28 01:05:21', '2024-08-28 01:05:21'),
(16, 'jefe', 'jefe', 'C.C', '21373584987', '32132135465', 'jefe3@jefe', '$2a$10$Jwwbyw.4ZcKUghx7oPWsMuy7EXJModWKiKvLSrHQWqAd88oKcDs8O', 1, 'jefesala', '2024-09-05 06:15:23', '2024-09-05 06:15:23'),
(17, 'jefe5', 'sdasd', 'C.C', '5634256409', '23132321322', 'jefe5@jefe', '$2a$10$zvc/Q3tJQZmOAfezunbjDehmMSvLb.7mPX0C7laQydRJeAHNCHJ6K', 1, 'jefesala', '2024-09-05 06:19:58', '2024-09-05 06:19:58'),
(19, 'jefe6@', 'adae', 'C.C', '2345467865', '132356797865', 'jefe6@jefe', '$2a$10$kixT7.5ObJ0XvFpRSRXc/ubylqgqx7QMULG0.KgM7QOPyYkL4SliK', 1, 'jefesala', '2024-09-05 06:24:49', '2024-09-05 06:24:49'),
(20, 'dasdsad', 'sadsda', 'C.C', '23432434234', '4332434234', 'jefe7@jefe', '$2a$10$BO6sToOFhH4eiBI0HsbiouFzxwW8SQYnovUHlZcMTU34UKCIuD14O', 1, 'jefesala', '2024-09-05 06:25:16', '2024-09-05 06:25:16'),
(21, 'dasdsad', 'asdasdass', 'C.C', '54353543624', '4656546353', 'jefe8@jefe', '$2a$10$tsyQnKDwEcftn/7CYk64TeksYV18lqWS6gHkgTZlqQnEJqax0837.', 1, 'jefesala', '2024-09-05 06:25:39', '2024-09-05 06:25:39'),
(22, 'andrea', 'andera', 'C.C', '3213213321', '3124638352', 'andrea@andrea.co', '$2a$10$VkyX/Zk/XqmlE6c/aOZWtegQF0x2Pvy/ZFVdjsR7KMbMSKerVJtH.', 1, 'cliente', '2024-09-10 17:10:57', '2024-09-10 17:10:57'),
(23, 'pablo', 'armando', 'C.C', '4512315465', '3123532434', 'pablo@pablo.co', '$2a$10$sSEjyJR8AExcTPTBpLKAEu8WTh0S9hSA/dpu0Qewd9npO/iqIThbO', 1, 'cliente', '2024-09-10 17:16:42', '2024-09-10 17:16:42'),
(24, 'lorena', 'garcia', 'C.C', '1021341654', '1321546546', 'lorena@lorena.co', '$2a$10$a7TpfW06gjSkYoovtmPaeulnqPh9dPT3gITlIVuvSeXAMP1/ibVMO', 1, 'cliente', '2024-09-10 17:26:15', '2024-09-10 17:26:15'),
(25, 'pedrito', 'garcia', 'C.C', '1321354546', '3135456354', 'pedro@pedro.co', '$2a$10$HNd/HWQNz1Ta0nqhgu8VFOqyANwfUhihwPGzRKB0C6Vy5359No9US', 1, 'cliente', '2024-09-11 15:28:40', '2024-09-11 15:28:40');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `user_shows`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `user_shows` (
`show_id` int(11)
,`nombre` varchar(255)
,`fechaPresentar` date
,`user_id` int(11)
,`user_nombre` varchar(255)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `user_shows`
--
DROP TABLE IF EXISTS `user_shows`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `user_shows`  AS SELECT `s`.`id` AS `show_id`, `s`.`nombre` AS `nombre`, `s`.`fechaPresentar` AS `fechaPresentar`, `u`.`id` AS `user_id`, `u`.`nombre` AS `user_nombre` FROM (`shows` `s` join `users` `u` on(`s`.`clienteId` = `u`.`id`)) ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `userId` (`userId`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `userId` (`userId`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `userId` (`userId`),
  ADD KEY `showId` (`showId`);

--
-- Indices de la tabla `jefesalas`
--
ALTER TABLE `jefesalas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `userId` (`userId`),
  ADD UNIQUE KEY `salaId` (`salaId`);

--
-- Indices de la tabla `mensajes`
--
ALTER TABLE `mensajes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `emisor` (`emisor`),
  ADD KEY `receptor` (`receptor`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `showId` (`showId`),
  ADD KEY `salaId` (`salaId`);

--
-- Indices de la tabla `salas`
--
ALTER TABLE `salas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`),
  ADD UNIQUE KEY `direccion` (`direccion`),
  ADD UNIQUE KEY `nombre_2` (`nombre`),
  ADD UNIQUE KEY `direccion_2` (`direccion`),
  ADD UNIQUE KEY `nombre_3` (`nombre`),
  ADD UNIQUE KEY `direccion_3` (`direccion`),
  ADD UNIQUE KEY `nombre_4` (`nombre`),
  ADD UNIQUE KEY `direccion_4` (`direccion`),
  ADD UNIQUE KEY `nombre_5` (`nombre`),
  ADD UNIQUE KEY `direccion_5` (`direccion`),
  ADD UNIQUE KEY `nombre_6` (`nombre`),
  ADD UNIQUE KEY `direccion_6` (`direccion`),
  ADD UNIQUE KEY `nombre_7` (`nombre`),
  ADD UNIQUE KEY `direccion_7` (`direccion`),
  ADD UNIQUE KEY `nombre_8` (`nombre`),
  ADD UNIQUE KEY `direccion_8` (`direccion`),
  ADD UNIQUE KEY `nombre_9` (`nombre`),
  ADD UNIQUE KEY `direccion_9` (`direccion`),
  ADD UNIQUE KEY `nombre_10` (`nombre`),
  ADD UNIQUE KEY `direccion_10` (`direccion`),
  ADD UNIQUE KEY `nombre_11` (`nombre`),
  ADD UNIQUE KEY `direccion_11` (`direccion`),
  ADD UNIQUE KEY `nombre_12` (`nombre`),
  ADD UNIQUE KEY `direccion_12` (`direccion`),
  ADD UNIQUE KEY `nombre_13` (`nombre`),
  ADD UNIQUE KEY `direccion_13` (`direccion`),
  ADD UNIQUE KEY `nombre_14` (`nombre`),
  ADD UNIQUE KEY `direccion_14` (`direccion`);

--
-- Indices de la tabla `shows`
--
ALTER TABLE `shows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `salaId` (`salaId`),
  ADD KEY `clienteId` (`clienteId`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `identificacion` (`identificacion`),
  ADD UNIQUE KEY `telefono` (`telefono`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `identificacion_2` (`identificacion`),
  ADD UNIQUE KEY `telefono_2` (`telefono`),
  ADD UNIQUE KEY `email_2` (`email`),
  ADD UNIQUE KEY `identificacion_3` (`identificacion`),
  ADD UNIQUE KEY `telefono_3` (`telefono`),
  ADD UNIQUE KEY `email_3` (`email`),
  ADD UNIQUE KEY `identificacion_4` (`identificacion`),
  ADD UNIQUE KEY `telefono_4` (`telefono`),
  ADD UNIQUE KEY `email_4` (`email`),
  ADD UNIQUE KEY `identificacion_5` (`identificacion`),
  ADD UNIQUE KEY `telefono_5` (`telefono`),
  ADD UNIQUE KEY `email_5` (`email`),
  ADD UNIQUE KEY `identificacion_6` (`identificacion`),
  ADD UNIQUE KEY `telefono_6` (`telefono`),
  ADD UNIQUE KEY `email_6` (`email`),
  ADD UNIQUE KEY `identificacion_7` (`identificacion`),
  ADD UNIQUE KEY `telefono_7` (`telefono`),
  ADD UNIQUE KEY `email_7` (`email`),
  ADD UNIQUE KEY `identificacion_8` (`identificacion`),
  ADD UNIQUE KEY `telefono_8` (`telefono`),
  ADD UNIQUE KEY `email_8` (`email`),
  ADD UNIQUE KEY `identificacion_9` (`identificacion`),
  ADD UNIQUE KEY `telefono_9` (`telefono`),
  ADD UNIQUE KEY `email_9` (`email`),
  ADD UNIQUE KEY `identificacion_10` (`identificacion`),
  ADD UNIQUE KEY `telefono_10` (`telefono`),
  ADD UNIQUE KEY `email_10` (`email`),
  ADD UNIQUE KEY `identificacion_11` (`identificacion`),
  ADD UNIQUE KEY `telefono_11` (`telefono`),
  ADD UNIQUE KEY `email_11` (`email`),
  ADD UNIQUE KEY `identificacion_12` (`identificacion`),
  ADD UNIQUE KEY `telefono_12` (`telefono`),
  ADD UNIQUE KEY `email_12` (`email`),
  ADD UNIQUE KEY `identificacion_13` (`identificacion`),
  ADD UNIQUE KEY `telefono_13` (`telefono`),
  ADD UNIQUE KEY `email_13` (`email`),
  ADD UNIQUE KEY `identificacion_14` (`identificacion`),
  ADD UNIQUE KEY `telefono_14` (`telefono`),
  ADD UNIQUE KEY `email_14` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `jefesalas`
--
ALTER TABLE `jefesalas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `mensajes`
--
ALTER TABLE `mensajes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `salas`
--
ALTER TABLE `salas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `shows`
--
ALTER TABLE `shows`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `admins`
--
ALTER TABLE `admins`
  ADD CONSTRAINT `admins_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `admins_ibfk_10` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `admins_ibfk_11` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `admins_ibfk_12` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `admins_ibfk_13` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `admins_ibfk_14` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `admins_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `admins_ibfk_3` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `admins_ibfk_4` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `admins_ibfk_5` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `admins_ibfk_6` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `admins_ibfk_7` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `admins_ibfk_8` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `admins_ibfk_9` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `clientes_ibfk_10` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `clientes_ibfk_11` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `clientes_ibfk_12` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `clientes_ibfk_13` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `clientes_ibfk_14` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `clientes_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `clientes_ibfk_3` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `clientes_ibfk_4` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `clientes_ibfk_5` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `clientes_ibfk_6` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `clientes_ibfk_7` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `clientes_ibfk_8` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `clientes_ibfk_9` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `empleados_ibfk_10` FOREIGN KEY (`showId`) REFERENCES `shows` (`id`),
  ADD CONSTRAINT `empleados_ibfk_11` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `empleados_ibfk_12` FOREIGN KEY (`showId`) REFERENCES `shows` (`id`),
  ADD CONSTRAINT `empleados_ibfk_13` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `empleados_ibfk_14` FOREIGN KEY (`showId`) REFERENCES `shows` (`id`),
  ADD CONSTRAINT `empleados_ibfk_15` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `empleados_ibfk_16` FOREIGN KEY (`showId`) REFERENCES `shows` (`id`),
  ADD CONSTRAINT `empleados_ibfk_17` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `empleados_ibfk_18` FOREIGN KEY (`showId`) REFERENCES `shows` (`id`),
  ADD CONSTRAINT `empleados_ibfk_19` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `empleados_ibfk_2` FOREIGN KEY (`showId`) REFERENCES `shows` (`id`),
  ADD CONSTRAINT `empleados_ibfk_20` FOREIGN KEY (`showId`) REFERENCES `shows` (`id`),
  ADD CONSTRAINT `empleados_ibfk_21` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `empleados_ibfk_22` FOREIGN KEY (`showId`) REFERENCES `shows` (`id`),
  ADD CONSTRAINT `empleados_ibfk_23` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `empleados_ibfk_24` FOREIGN KEY (`showId`) REFERENCES `shows` (`id`),
  ADD CONSTRAINT `empleados_ibfk_25` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `empleados_ibfk_26` FOREIGN KEY (`showId`) REFERENCES `shows` (`id`),
  ADD CONSTRAINT `empleados_ibfk_27` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `empleados_ibfk_28` FOREIGN KEY (`showId`) REFERENCES `shows` (`id`),
  ADD CONSTRAINT `empleados_ibfk_3` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `empleados_ibfk_4` FOREIGN KEY (`showId`) REFERENCES `shows` (`id`),
  ADD CONSTRAINT `empleados_ibfk_5` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `empleados_ibfk_6` FOREIGN KEY (`showId`) REFERENCES `shows` (`id`),
  ADD CONSTRAINT `empleados_ibfk_7` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `empleados_ibfk_8` FOREIGN KEY (`showId`) REFERENCES `shows` (`id`),
  ADD CONSTRAINT `empleados_ibfk_9` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `jefesalas`
--
ALTER TABLE `jefesalas`
  ADD CONSTRAINT `jefesalas_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `jefesalas_ibfk_10` FOREIGN KEY (`salaId`) REFERENCES `salas` (`id`),
  ADD CONSTRAINT `jefesalas_ibfk_11` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `jefesalas_ibfk_12` FOREIGN KEY (`salaId`) REFERENCES `salas` (`id`),
  ADD CONSTRAINT `jefesalas_ibfk_13` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `jefesalas_ibfk_14` FOREIGN KEY (`salaId`) REFERENCES `salas` (`id`),
  ADD CONSTRAINT `jefesalas_ibfk_15` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `jefesalas_ibfk_16` FOREIGN KEY (`salaId`) REFERENCES `salas` (`id`),
  ADD CONSTRAINT `jefesalas_ibfk_17` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `jefesalas_ibfk_18` FOREIGN KEY (`salaId`) REFERENCES `salas` (`id`),
  ADD CONSTRAINT `jefesalas_ibfk_19` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `jefesalas_ibfk_2` FOREIGN KEY (`salaId`) REFERENCES `salas` (`id`),
  ADD CONSTRAINT `jefesalas_ibfk_20` FOREIGN KEY (`salaId`) REFERENCES `salas` (`id`),
  ADD CONSTRAINT `jefesalas_ibfk_21` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `jefesalas_ibfk_22` FOREIGN KEY (`salaId`) REFERENCES `salas` (`id`),
  ADD CONSTRAINT `jefesalas_ibfk_23` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `jefesalas_ibfk_24` FOREIGN KEY (`salaId`) REFERENCES `salas` (`id`),
  ADD CONSTRAINT `jefesalas_ibfk_25` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `jefesalas_ibfk_26` FOREIGN KEY (`salaId`) REFERENCES `salas` (`id`),
  ADD CONSTRAINT `jefesalas_ibfk_27` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `jefesalas_ibfk_28` FOREIGN KEY (`salaId`) REFERENCES `salas` (`id`),
  ADD CONSTRAINT `jefesalas_ibfk_3` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `jefesalas_ibfk_4` FOREIGN KEY (`salaId`) REFERENCES `salas` (`id`),
  ADD CONSTRAINT `jefesalas_ibfk_5` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `jefesalas_ibfk_6` FOREIGN KEY (`salaId`) REFERENCES `salas` (`id`),
  ADD CONSTRAINT `jefesalas_ibfk_7` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `jefesalas_ibfk_8` FOREIGN KEY (`salaId`) REFERENCES `salas` (`id`),
  ADD CONSTRAINT `jefesalas_ibfk_9` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `mensajes`
--
ALTER TABLE `mensajes`
  ADD CONSTRAINT `mensajes_ibfk_1` FOREIGN KEY (`emisor`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `mensajes_ibfk_10` FOREIGN KEY (`receptor`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `mensajes_ibfk_11` FOREIGN KEY (`emisor`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `mensajes_ibfk_12` FOREIGN KEY (`receptor`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `mensajes_ibfk_13` FOREIGN KEY (`emisor`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `mensajes_ibfk_14` FOREIGN KEY (`receptor`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `mensajes_ibfk_15` FOREIGN KEY (`emisor`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `mensajes_ibfk_16` FOREIGN KEY (`receptor`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `mensajes_ibfk_17` FOREIGN KEY (`emisor`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `mensajes_ibfk_18` FOREIGN KEY (`receptor`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `mensajes_ibfk_19` FOREIGN KEY (`emisor`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `mensajes_ibfk_2` FOREIGN KEY (`receptor`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `mensajes_ibfk_20` FOREIGN KEY (`receptor`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `mensajes_ibfk_21` FOREIGN KEY (`emisor`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `mensajes_ibfk_22` FOREIGN KEY (`receptor`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `mensajes_ibfk_23` FOREIGN KEY (`emisor`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `mensajes_ibfk_24` FOREIGN KEY (`receptor`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `mensajes_ibfk_25` FOREIGN KEY (`emisor`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `mensajes_ibfk_26` FOREIGN KEY (`receptor`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `mensajes_ibfk_27` FOREIGN KEY (`emisor`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `mensajes_ibfk_28` FOREIGN KEY (`receptor`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `mensajes_ibfk_3` FOREIGN KEY (`emisor`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `mensajes_ibfk_4` FOREIGN KEY (`receptor`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `mensajes_ibfk_5` FOREIGN KEY (`emisor`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `mensajes_ibfk_6` FOREIGN KEY (`receptor`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `mensajes_ibfk_7` FOREIGN KEY (`emisor`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `mensajes_ibfk_8` FOREIGN KEY (`receptor`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `mensajes_ibfk_9` FOREIGN KEY (`emisor`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`showId`) REFERENCES `shows` (`id`),
  ADD CONSTRAINT `pedidos_ibfk_10` FOREIGN KEY (`salaId`) REFERENCES `salas` (`id`),
  ADD CONSTRAINT `pedidos_ibfk_11` FOREIGN KEY (`showId`) REFERENCES `shows` (`id`),
  ADD CONSTRAINT `pedidos_ibfk_12` FOREIGN KEY (`salaId`) REFERENCES `salas` (`id`),
  ADD CONSTRAINT `pedidos_ibfk_13` FOREIGN KEY (`showId`) REFERENCES `shows` (`id`),
  ADD CONSTRAINT `pedidos_ibfk_14` FOREIGN KEY (`salaId`) REFERENCES `salas` (`id`),
  ADD CONSTRAINT `pedidos_ibfk_15` FOREIGN KEY (`showId`) REFERENCES `shows` (`id`),
  ADD CONSTRAINT `pedidos_ibfk_16` FOREIGN KEY (`salaId`) REFERENCES `salas` (`id`),
  ADD CONSTRAINT `pedidos_ibfk_17` FOREIGN KEY (`showId`) REFERENCES `shows` (`id`),
  ADD CONSTRAINT `pedidos_ibfk_18` FOREIGN KEY (`salaId`) REFERENCES `salas` (`id`),
  ADD CONSTRAINT `pedidos_ibfk_19` FOREIGN KEY (`showId`) REFERENCES `shows` (`id`),
  ADD CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`salaId`) REFERENCES `salas` (`id`),
  ADD CONSTRAINT `pedidos_ibfk_20` FOREIGN KEY (`salaId`) REFERENCES `salas` (`id`),
  ADD CONSTRAINT `pedidos_ibfk_21` FOREIGN KEY (`showId`) REFERENCES `shows` (`id`),
  ADD CONSTRAINT `pedidos_ibfk_22` FOREIGN KEY (`salaId`) REFERENCES `salas` (`id`),
  ADD CONSTRAINT `pedidos_ibfk_3` FOREIGN KEY (`showId`) REFERENCES `shows` (`id`),
  ADD CONSTRAINT `pedidos_ibfk_4` FOREIGN KEY (`salaId`) REFERENCES `salas` (`id`),
  ADD CONSTRAINT `pedidos_ibfk_5` FOREIGN KEY (`showId`) REFERENCES `shows` (`id`),
  ADD CONSTRAINT `pedidos_ibfk_6` FOREIGN KEY (`salaId`) REFERENCES `salas` (`id`),
  ADD CONSTRAINT `pedidos_ibfk_7` FOREIGN KEY (`showId`) REFERENCES `shows` (`id`),
  ADD CONSTRAINT `pedidos_ibfk_8` FOREIGN KEY (`salaId`) REFERENCES `salas` (`id`),
  ADD CONSTRAINT `pedidos_ibfk_9` FOREIGN KEY (`showId`) REFERENCES `shows` (`id`);

--
-- Filtros para la tabla `shows`
--
ALTER TABLE `shows`
  ADD CONSTRAINT `shows_ibfk_1` FOREIGN KEY (`salaId`) REFERENCES `salas` (`id`),
  ADD CONSTRAINT `shows_ibfk_2` FOREIGN KEY (`clienteId`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
