-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: student-databases.cvode4s4cwrc.us-west-2.rds.amazonaws.com
-- Generation Time: May 06, 2026 at 02:14 PM
-- Server version: 8.0.42
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `KYLABENTLEY`
--

-- --------------------------------------------------------

--
-- Table structure for table `pokemon_cards`
--

CREATE TABLE `pokemon_cards` (
  `id` int NOT NULL,
  `pokemon_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `number` int NOT NULL,
  `rarity` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `collection_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `pokemon_cards`
--

INSERT INTO `pokemon_cards` (`id`, `pokemon_name`, `number`, `rarity`, `collection_id`) VALUES
(1, '', 0, '', 1),
(2, 'Serperior V', 7, 'One Star', 1),
(3, 'Lillie\'s Clefairy EX', 173, 'Two Stars', 1),
(4, '', 0, 'Promo.2', 1),
(5, 'Gyarados', 21, 'One Star', 1),
(6, 'Serperior', 6, 'One Star', 1),
(7, 'asdfas', 123, 'Rare', 1234),
(8, 'Placeholder', 111, 'Placeholder', 1),
(9, '', 0, '', 1),
(10, '', 0, '', 1),
(11, 'Leafeon V', 0, '', 1),
(12, '1', 1, '1', 1),
(13, 'Gyarados', 32, 'Diamond', 1),
(14, 'Gyarados', 21, 'One Star', 1),
(15, 'Misty\'s Gyarados', 49, 'One Star', 1),
(16, 'Vaporeon', 0, 'One Star', 1),
(17, 'Nidorina', 73, 'Circle', 1),
(18, 'Scolipede', 54, 'One Star', 1),
(19, 'Dawn Wings Necrozma EX', 0, 'Promo', 1),
(20, 'Mewtwo', 56, 'One Star', 1),
(21, 'Galarian Articuno', 63, 'One Star', 1),
(22, 'Sylveon V', 0, 'Promo', 1),
(23, 'Noivern', 77, 'One Star', 1),
(24, 'Flygon', 110, 'One Star', 1),
(25, 'Metagross', 50, 'One Star', 1),
(26, 'Genesect V', 185, 'One Star', 1),
(27, 'Galarian Perrserker', 129, 'One Star', 1),
(28, 'Rayquaza EX', 0, 'Promo', 1),
(29, 'Raticate Break', 89, 'Break', 1),
(30, 'Lugia Break', 79, 'Break', 1),
(31, 'Zeraora', 78, 'One Star', 1),
(32, 'Sparkling Crystal', 129, 'Ace Spec', 1),
(33, 'Leafeon', 170, 'Promo', 1),
(34, 'Iron Crown Ex', 146, 'Promo', 1),
(35, 'Mamoswine', 79, 'Two Stars', 1),
(36, 'Slaking Ex', 227, 'Two Stars', 1),
(37, 'Arboliva Ex', 207, 'Two Stars', 1),
(38, 'N\'s Darmanitan', 27, 'Diamond', 1),
(39, 'Brassius', 135, 'Two Stars', 1),
(40, 'Team Rocket\'s Crobat Ex', 122, 'Two Stars', 1),
(41, 'Lugia Ex', 82, 'Two Stars', 1),
(42, 'Diancie', 71, 'One Star', 1),
(43, 'Numel', 69, 'Circle', 1),
(44, 'Camerupt Ex', 29, 'One Star', 1),
(45, 'Houndoom Ex', 21, 'One Star', 1),
(46, 'Charmander', 48, 'Circle', 1),
(47, 'Pachirisu', 35, 'One Star Stamped', 1),
(48, 'Shaymin V', 13, 'One Star', 1),
(49, 'Shedinja', 11, 'One Star', 1),
(50, 'Seadra', 29, 'Diamond', 1),
(51, 'Whiscash', 41, 'One Star', 1),
(52, 'Milotic', 23, 'One Star', 1),
(53, 'Milotic', 44, 'One Star', 1),
(54, 'Regice', 24, 'One Star', 1),
(55, 'Kingler V', 28, 'One Star', 1),
(56, 'Jolteon', 0, 'One Star', 1),
(57, 'Enamorus V', 82, 'One Star', 1),
(58, 'Delphox V', 27, 'One Star', 1),
(59, 'Leafeon V', 7, 'One Star', 1),
(60, 'Luxray V', 50, 'One Star', 1),
(61, 'Zeraora V', 53, 'One Star', 1),
(62, 'Heatran V', 25, 'One Star', 1),
(63, 'Hisuian Typhlosion V', 53, 'One Star', 1),
(64, 'Rotom V', 58, 'One Star', 1),
(65, 'Parasect', 0, 'One Star', 1),
(66, 'Lucario V', 146, 'One Star', 1),
(67, 'Indeedee V', 39, 'One Star', 1),
(68, 'Zekrom', 0, 'One Star', 1),
(69, 'Shadow Rider Calyrex V', 74, 'One Star', 1),
(70, 'Cramorant V', 54, 'One Star', 1),
(71, 'Talonflame V', 29, 'One Star', 1),
(72, 'Trevenant V', 13, 'One Star', 1),
(73, 'Entei V', 22, 'One Star', 1),
(74, 'Cinderace V', 43, 'One Star', 1),
(75, 'Dracozolt V', 58, 'One Star', 1),
(76, 'Vikavolt V', 60, 'One Star', 1),
(77, 'Gengar V', 156, 'One Star', 1),
(78, 'Breloom V', 6, 'One Star', 1),
(79, 'Yveltal', 46, 'Amazing Rare', 1),
(80, 'Dragonite V', 0, 'Promo', 1),
(81, 'Arctovish V', 48, 'One Star', 1),
(82, 'Flareon', 0, 'One Star', 1),
(83, 'Houndoom', 0, 'One Star', 1),
(84, 'Eevee', 0, 'One Star', 1),
(85, 'Alcremie', 0, 'One Star', 1),
(86, 'Boltund V', 103, 'One Star', 1),
(87, 'Dhelmise V', 9, 'One Star', 1),
(88, 'Dusknoir', 0, 'One Star', 1),
(89, 'Crobat V', 104, 'One Star', 1),
(90, 'Granbull V', 57, 'One Star', 1),
(91, 'Octillery', 0, 'One Star', 1),
(92, 'Mimikyu', 0, 'Promo', 1),
(93, 'Lycanroc V', 91, 'One Star', 1),
(94, 'Drampa V', 128, 'One Star', 1),
(95, 'Mew V', 113, 'One Star', 1),
(96, 'Alolan Exeggutor V', 0, 'One Star', 1),
(97, 'Eldegoss V', 0, 'One Star', 1),
(98, 'Greedent V', 120, 'One Star', 1),
(99, 'Blissey V', 119, 'One Star', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pokemon_cards`
--
ALTER TABLE `pokemon_cards`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pokemon_cards`
--
ALTER TABLE `pokemon_cards`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
