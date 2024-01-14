-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 22-12-2023 a las 00:34:00
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_funko_shop`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(100) DEFAULT NULL,
  `category_description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `category`
--

INSERT INTO `category` (`category_id`, `category_name`, `category_description`) VALUES
(1, 'Funkos', 'Figuras coleccionables Funko Pop'),
(2, 'Remeras', 'Remeras de anime, series, peliculas y más'),
(3, 'LLaveros', 'Llaveros coleccionables');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `licence`
--

CREATE TABLE `licence` (
  `licence_id` int(11) NOT NULL,
  `licence_name` varchar(45) DEFAULT NULL,
  `licence_description` varchar(255) DEFAULT NULL,
  `licence_image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `licence`
--

INSERT INTO `licence` (`licence_id`, `licence_name`, `licence_description`, `licence_image`) VALUES
(1, 'Pokemon', 'Atrapa todos los que puedas y disfruta de una colección llena de amigos.', '/img/pokemon/pk-cover.webp'),
(2, 'Star Wars', 'Disfruta de una saga que sigue agregando personajes a su colección.', '/img/star-wars/st-cover.webp'),
(3, 'Harry Potter', 'Revive los recuerdos de una saga llena de magia y encanto.', '/img/harry-potter/hp-cover.webp'),
(4, 'Naruto', 'Una de las historias ánime más famosas ahora también coleccionable', '/img/naruto/nr-cover.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(60) NOT NULL,
  `product_description` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `discount` int(11) DEFAULT NULL,
  `sku` varchar(30) NOT NULL,
  `dues` int(11) DEFAULT NULL,
  `image_front` varchar(200) DEFAULT NULL,
  `image_back` varchar(200) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `licence_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `product_description`, `price`, `stock`, `discount`, `sku`, `dues`, `image_front`, `image_back`, `create_time`, `licence_id`, `category_id`) VALUES
(1, 'Baby Yoda Blueball', 'Figura coleccionable de Baby Yoda (Grogu) - The Mandalorian Saga, edición limitada.', 1799.99, 8, 10, 'STW001001', 3, '/star-wars/baby-yoda-1.webp', '/star-wars/baby-yoda-box.webp', '2023-06-28 02:33:21', 2, 1),
(2, 'Boba Fett Fighter', 'Figura coleccionable de Boba Fett Fighter - The Mandalorian Saga.', 1799.99, 8, 10, 'STW001002', 3, '/star-wars/bobbafeth-1.webp', '/star-wars/bobbafeth-box.webp', '2023-06-28 02:33:21', 2, 1),
(3, 'Luke Skylwalker & Grogu', 'Figura coleccionable de Luke Skylwalker & Grogu - The Mandalorian Saga.', 1799.99, 8, 10, 'STW001003', 3, '/star-wars/luke-1.webp', '/star-wars/luke-box.webp', '2023-06-28 02:33:21', 2, 1),
(4, 'Stormtrooper Lightsaber', 'Figura coleccionable de Stormtrooper Lightsaber - Star Wars Saga.', 1799.99, 8, 10, 'STW001004', 3, '/star-wars/trooper-1.webp', '/star-wars/trooper-box.webp', '2023-06-28 02:33:21', 2, 1),
(5, 'Charmander Smiley', 'Figura coleccionable de Charmander - Pokemon Saga.', 1799.99, 8, 10, 'PKM001001', 3, '/pokemon/charmander-1.webp', '/pokemon/charmander-box.webp', '2023-06-28 02:33:21', 1, 1),
(6, 'Dragonite Hi!', 'Figura coleccionable de Dragonite - Pokemon Saga.', 1799.99, 8, 10, 'PKM001002', 3, '/pokemon/dragonite-1.webp', '/pokemon/dragonite-box.webp', '2023-06-28 02:33:21', 1, 1),
(7, 'Pidgeotto Flying', 'Figura coleccionable de Pidgeotto - Pokemon Saga.', 1799.99, 8, 10, 'PKM00103', 3, '/pokemon/pidgeotto-1.webp', '/pokemon/pidgeotto-box.webp', '2023-06-28 02:33:21', 1, 1),
(8, 'Pikachu Smiley', 'Figura coleccionable de Pikachu - Pokemon Saga.', 1799.99, 8, 10, 'PKM001004', 3, '/pokemon/pikachu-1.webp', '/pokemon/pikachu-box.webp', '2023-06-28 02:33:21', 1, 1),
(9, 'Vulpix Fancy', 'Figura coleccionable de Vulpix - Pokemon Saga.', 1799.99, 8, 10, 'PKM001005', 3, '/pokemon/vulpix-1.webp', '/pokemon/vulpix-box.webp', '2023-06-28 02:33:21', 1, 1),
(10, 'Harry Potter & Hegwid', 'Figura coleccionable de Harry Potter & Hegwid - Harry Potter Saga.', 1799.99, 8, 10, 'HPT001001', 3, '/harry-potter/harry-1.webp', '/harry-potter/harry-box.webp', '2023-06-28 02:33:21', 3, 1),
(11, 'Herminione Ball Dress', 'Figura coleccionable de Herminione - Harry Potter Saga.', 1799.99, 8, 10, 'HPT001002', 3, '/harry-potter/hermione-1.webp', '/harry-potter/hermione-box.webp', '2023-06-28 02:33:21', 3, 1),
(12, 'Luna Lovegood Lion Mask', 'Figura coleccionable de Luna Lovegood - Harry Potter Saga.', 1799.99, 8, 10, 'HPT001003', 3, '/harry-potter/luna-1.webp', '/harry-potter/luna-box.webp', '2023-06-28 02:33:21', 3, 1),
(13, 'Snape Patronus', 'Figura coleccionable de Snape Patronus - Harry Potter Saga.', 1799.99, 13, 10, 'HPT001004', 3, '/harry-potter/snape-patronus-1.webp', '/harry-potter/snape-patronus-box.webp', '2023-06-28 02:33:21', 3, 1),
(35, 'Prueba', 'Prueba', 60000.00, 5, 5, '122333', 5, 'ruta_de_la_imagen_frontal', 'ruta_de_la_imagen_trasera', '2023-12-21 23:27:34', 2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `name` varchar(16) DEFAULT NULL,
  `lastname` varchar(80) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`user_id`, `name`, `lastname`, `email`, `password`) VALUES
(1, 'Valen', 'Torassa', 'valento@gmail.com', 'valen123'),
(2, 'Pablo', 'aguirre', 'aguirrepr@gmail.com', 'pablo123'),
(3, 'Pepe', 'Gracia', 'pepegarcia@gmail.com', 'pepe123'),
(4, 'Carlos', 'Lopez', 'carlos@gmail.com', 'carlos123');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indices de la tabla `licence`
--
ALTER TABLE `licence`
  ADD PRIMARY KEY (`licence_id`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD UNIQUE KEY `product_name` (`product_name`),
  ADD KEY `fk_category` (`category_id`),
  ADD KEY `fk_licence` (`licence_id`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `licence`
--
ALTER TABLE `licence`
  MODIFY `licence_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_licence` FOREIGN KEY (`licence_id`) REFERENCES `licence` (`licence_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
