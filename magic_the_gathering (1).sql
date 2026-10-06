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
-- Table structure for table `magic_the_gathering`
--

CREATE TABLE `magic_the_gathering` (
  `id` int NOT NULL,
  `mtg_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `supertype` varchar(255) NOT NULL,
  `mtg_rarity` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `card_number` int NOT NULL,
  `is_foil` tinyint(1) NOT NULL,
  `collection_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `magic_the_gathering`
--

INSERT INTO `magic_the_gathering` (`id`, `mtg_name`, `supertype`, `mtg_rarity`, `card_number`, `is_foil`, `collection_id`) VALUES
(1, 'Aerith Gainsborough', 'Legendary Creature', 'Rare', 519, 1, 2),
(2, 'Tiamat', 'Legendary Creature', 'Mythic Rare', 235, 1, 2),
(3, 'Teleportation Circle', 'Enchantment', 'Rare', 39, 1, 2),
(4, 'Icingdeath, Frost Tyrant', 'Legendary Creature', 'Mythic Rare', 287, 0, 2),
(5, 'Ellywick Tumblestrum', 'Legendary Planeswalker', 'Mythic Rare', 286, 0, 2),
(6, 'Orcus, Prince of Undeath', 'Legendary Creature', 'Rare', 229, 0, 2),
(7, 'Icingdeath, Frost Tongue', 'Token Legendary Artifact', 'Common', 2, 1, 2),
(8, '', '', 'common', 0, 1, 1),
(9, '', '', '', 0, 0, 1),
(10, 'Deepchannel Duelist', 'Creature', 'rare', 213, 1, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `magic_the_gathering`
--
ALTER TABLE `magic_the_gathering`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `magic_the_gathering`
--
ALTER TABLE `magic_the_gathering`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
