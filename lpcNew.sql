-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-10-2024 a las 16:46:59
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `admins`
--

INSERT INTO `admins` (`id`, `userId`, `createdAt`, `updatedAt`) VALUES
(1, 1, '2024-09-19 13:08:27', '2024-09-19 13:08:27');

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nacionCliente`, `direccion`, `userId`, `createdAt`, `updatedAt`) VALUES
(1, 'argelia', NULL, 8, '2024-09-19 13:29:22', '2024-09-19 13:30:04'),
(2, NULL, NULL, 9, '2024-09-19 13:33:44', '2024-09-19 13:33:44'),
(3, NULL, NULL, 10, '2024-09-19 13:35:13', '2024-09-19 13:35:13'),
(4, NULL, NULL, 11, '2024-09-19 16:45:33', '2024-09-19 16:45:33'),
(5, NULL, NULL, 13, '2024-10-16 14:15:50', '2024-10-16 14:15:50');

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`id`, `userId`, `showId`, `rol`, `createdAt`, `updatedAt`) VALUES
(1, 6, NULL, 'logistica', '2024-09-19 13:24:13', '2024-09-19 13:24:13');

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `jefesalas`
--

INSERT INTO `jefesalas` (`id`, `userId`, `salaId`, `createdAt`, `updatedAt`) VALUES
(1, 2, 4, '2024-09-19 13:15:54', '2024-09-19 13:15:54'),
(2, 3, 5, '2024-09-19 13:22:10', '2024-09-19 13:22:10'),
(3, 4, 6, '2024-09-19 13:22:45', '2024-09-19 13:22:45'),
(4, 5, 7, '2024-09-19 13:23:21', '2024-09-19 13:23:21'),
(5, 12, 8, '2024-09-22 01:34:46', '2024-09-22 01:34:46');

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id`, `showId`, `salaId`, `estado`, `empleadosRequeridos`, `empleadosAsignados`, `createdAt`, `updatedAt`) VALUES
(1, 1, 4, 'completado', 0, '0', '2024-09-19 13:32:20', '2024-09-19 13:36:29'),
(2, 2, 5, 'completado', 1, '0', '2024-09-19 13:34:29', '2024-09-19 13:36:59'),
(3, 3, 6, 'completado', 0, '0', '2024-09-19 13:35:58', '2024-09-19 13:37:22');

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `salas`
--

INSERT INTO `salas` (`id`, `imagen`, `nombre`, `direccion`, `capacidad`, `estado`, `createdAt`, `updatedAt`) VALUES
(4, '/images/1726751713029-teatroscolon.jpg', 'Teatro Colon', 'Teatro Colon', 250, 1, '2024-09-19 13:15:13', '2024-09-19 13:15:13'),
(5, '/images/1726751954511-camarin.jpg', 'Teatro Camarin Del Carmen', 'Teatro Camarin Del Carmen', 125, 1, '2024-09-19 13:19:14', '2024-09-19 13:19:14'),
(6, '/images/1726752013359-mayor.jpg', 'Teatro Mayor Santo Domingo', 'Cl. 170 #67-51, Bogotá', 229, 1, '2024-09-19 13:20:13', '2024-09-19 13:20:13'),
(7, '/images/1726752099069-chapi.jpg', 'Teatro Libre Chapinero', 'Cra. 11 #61-80', 176, 1, '2024-09-19 13:21:39', '2024-09-19 13:21:39'),
(8, '/images/1726753511613-metropol.jpg', 'Teatro Metropol', 'Cl. 24 #6-31', 200, 1, '2024-09-19 13:45:11', '2024-09-19 13:45:11'),
(9, '/images/1729129779691-gaitan.jpg', 'Teatro jorge eliecer gaitan', 'Cra. 7 #22-47', 250, 1, '2024-10-17 01:49:39', '2024-10-17 01:49:39');

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `shows`
--

INSERT INTO `shows` (`id`, `imagen`, `nombre`, `cuposDisponibles`, `fechaPresentar`, `horaInicio`, `horaFin`, `estado`, `salaId`, `clienteId`, `createdAt`, `updatedAt`) VALUES
(1, '/images/1726752740333-after.jpg', 'AfterGlow', 125, '2024-09-20', '08:32:00', '09:32:00', 1, 4, 8, '2024-09-19 13:32:20', '2024-09-19 13:36:29'),
(2, '/images/1726752869708-cafe.jpg', 'cafe sobre', 80, '2024-09-21', '09:34:00', '10:34:00', 1, 5, 9, '2024-09-19 13:34:29', '2024-09-19 13:36:59'),
(3, '/images/1726752958609-dulce.jpg', 'tentacion', 20, '2024-09-22', '08:35:00', '09:35:00', 1, 6, 10, '2024-09-19 13:35:58', '2024-09-19 13:37:23'),
(4, '/images/1729166552165-magia.jpg', 'Magia En Caos', 125, '2024-10-19', '07:02:00', '08:02:00', 1, 4, NULL, '2024-10-17 12:02:32', '2024-10-17 12:02:54');

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `nombre`, `apellido`, `tipIdentidad`, `identificacion`, `telefono`, `email`, `password`, `estado`, `role`, `createdAt`, `updatedAt`) VALUES
(1, 'admin', 'admin', 'C.C', '1021321546', '3124121432', 'admin@admin.co', '$2a$10$Cfe4DIsFjR1BIV6xRUMqT.Kam6G9c21qSiqeZorNQmePnyLJrP6GO', 1, 'admin', '2024-09-19 13:08:27', '2024-10-17 13:55:22'),
(2, 'andres', 'benavides', 'C.C', '155165456', '31546848478', 'andres@andres.be', '$2a$10$mFu8k2aCyL5hBGDzgfUfM.Je1JA6S0g28CIOsrR4KPv.pjrnLo5Wi', 1, 'jefesala', '2024-09-19 13:15:54', '2024-09-19 13:15:54'),
(3, 'roberto', 'perez', 'C.C', '1065454654', '3156654564', 'rober@rober.pe', '$2a$10$JSkps/WKXfBtXWGRKAkgQe9BcXV8uRAxDohOKhqLprigRrlvUpl86', 1, 'jefesala', '2024-09-19 13:22:10', '2024-09-19 13:22:10'),
(4, 'marina', 'carmen', 'C.C', '2132156456', '3125645646', 'marina@marina.ca', '$2a$10$js8VbFZYCLyzfvEEiQ8loeZj.rINu4.VmfmNDEhSCj2ThtQ6vnBo6', 1, 'jefesala', '2024-09-19 13:22:45', '2024-09-19 13:22:45'),
(5, 'david', 'muñox', 'C.C', '12324343734', '3123214325325', 'david@david.co', '$2a$10$hXGnHhh9J8TpfiuBYLzZjeLhPPNGkWQb5boJJtwOwuU.W13Cvposq', 1, 'jefesala', '2024-09-19 13:23:21', '2024-09-19 13:23:21'),
(6, 'cristhina', 'garcia', 'C.C', '3123413264', '31546454468', 'cirs@cris.ga', '$2a$10$Bog0Mw2kCifwwAY4CV3/Be/r9FBg32V5QgytQZQcZfe8qFK9Dfoa2', 1, 'empleado', '2024-09-19 13:24:13', '2024-09-19 13:24:13'),
(8, 'camilo', 'sanchez', 'C.C', '1235464864', '3156564684', 'camilo@camilo.sa', '$2a$10$gRDCwm4rB6v7fKsIGjG4BuAyb70OS.uZIR.MF5OHHb5VsgR/tiK/C', 1, 'cliente', '2024-09-19 13:29:22', '2024-09-19 13:30:04'),
(9, 'camilo', 'pardo', 'C.C', '1561546546', '3122056546', 'camilo@camilo.pa', '$2a$10$LfJxSCkVW6L45V02nVgEYu.aCFwOdam0TDnGQvwUGaEDDgE8O/rbm', 1, 'cliente', '2024-09-19 13:33:44', '2024-09-19 13:33:44'),
(10, 'armadno', 'paredes', 'C.C', '1056545646', '3155646545', 'arman@arman.pa', '$2a$10$gI9.bwIwIKENJ1MJyXUIu.LoUqthNirtF7c4hEiTWwpV2h3rW1ixS', 1, 'cliente', '2024-09-19 13:35:13', '2024-09-19 13:35:13'),
(11, 'nana', 'sanchez', 'C.C', '3242344450', '1234556677', 'sn@gmail.com', '$2a$10$5RN4ej.aIGkgf4nK4W14guklwV2nOj1yLUAlEPLvCsCFDbeQApBRC', 1, 'cliente', '2024-09-19 16:45:33', '2024-09-19 16:45:33'),
(12, 'robero', 'bolaños', 'C.C', '123156454894', '3154546484', 'rober@rober.bola', '$2a$10$4WszO1PCA7e7/tcYzHBUsOJDXZ2qluNq0VR3NA7zUwL/xRucMX2fy', 1, 'jefesala', '2024-09-22 01:34:46', '2024-09-22 01:34:46'),
(13, 'yamile', 'rocha', 'C.C', '3313545565', '3374864654', 'yamile@madre.com', '$2a$10$xSjQcUxFf/mk9RWAri4SWOsSmQQGYRqiRCb17DhNZfKIOUwvIaG8O', 1, 'cliente', '2024-10-16 14:15:50', '2024-10-16 14:15:50');

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
  ADD UNIQUE KEY `direccion` (`direccion`);

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
  ADD UNIQUE KEY `email` (`email`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `mensajes`
--
ALTER TABLE `mensajes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `salas`
--
ALTER TABLE `salas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `shows`
--
ALTER TABLE `shows`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `admins`
--
ALTER TABLE `admins`
  ADD CONSTRAINT `admins_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `empleados_ibfk_2` FOREIGN KEY (`showId`) REFERENCES `shows` (`id`);

--
-- Filtros para la tabla `jefesalas`
--
ALTER TABLE `jefesalas`
  ADD CONSTRAINT `jefesalas_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `jefesalas_ibfk_2` FOREIGN KEY (`salaId`) REFERENCES `salas` (`id`);

--
-- Filtros para la tabla `mensajes`
--
ALTER TABLE `mensajes`
  ADD CONSTRAINT `mensajes_ibfk_1` FOREIGN KEY (`emisor`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `mensajes_ibfk_2` FOREIGN KEY (`receptor`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`showId`) REFERENCES `shows` (`id`),
  ADD CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`salaId`) REFERENCES `salas` (`id`);

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
