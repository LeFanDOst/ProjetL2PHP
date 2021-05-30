-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le :  Dim 30 mai 2021 à 17:55
-- Version du serveur :  8.0.25-0ubuntu0.20.04.1
-- Version de PHP :  7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `projet`
--

-- --------------------------------------------------------

--
-- Structure de la table `Equipe`
--

CREATE TABLE `Equipe` (
  `idEquipe` int NOT NULL,
  `nomEquipe` varchar(25) NOT NULL,
  `niveau` int DEFAULT '0',
  `adresse` varchar(50) NOT NULL,
  `numTel` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `Equipe`
--

INSERT INTO `Equipe` (`idEquipe`, `nomEquipe`, `niveau`, `adresse`, `numTel`) VALUES
(1, 'NANTES', 80, 'Une adresse 671', '66-66-66-66-71'),
(2, 'TOULOUSE', 81, 'Une adresse 672', '66-66-66-66-72'),
(3, 'MARSEILLE', 43, 'Une adresse 3', '03-04-03-04-03'),
(4, 'LYON', 50, 'Une adresse 4', '04-05-04-05-04'),
(5, 'ST-ETIENNE', 21, 'Une adresse 5', '05-06-05-06-05'),
(6, 'FC BARCELONA', 98, 'Une adresse 7', '02-03-02-03-06'),
(7, 'LIVERPOOL', 75, 'Une adresse 8', '03-04-03-04-07'),
(8, 'CHELSEA', 80, 'Une adresse 9', '04-05-04-05-08'),
(9, 'MANCHESTER', 90, 'Une adresse 10', '05-06-05-06-09'),
(10, 'PSG', 93, 'Une adresse 11', '01-02-01-02-01'),
(11, 'BORDEAUX', 94, 'Une adresse 12', '02-03-02-03-02'),
(12, 'GODS', 100, 'Une adresse 666', '66-66-66-66-66'),
(13, 'CHICAGO', 60, 'Une adresse 667', '66-66-66-66-67'),
(14, 'BOSTON', 53, 'Une adresse 668', '66-66-66-66-68'),
(15, 'MILAN', 78, 'Une adresse 669', '66-66-66-66-69'),
(16, 'JUVINTUS', 87, 'Une adresse 670', '66-66-66-66-70');

-- --------------------------------------------------------

--
-- Structure de la table `EquipeMatchT`
--

CREATE TABLE `EquipeMatchT` (
  `idEquipe` int NOT NULL,
  `idMatchT` int NOT NULL,
  `score` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `EquipeMatchT`
--

INSERT INTO `EquipeMatchT` (`idEquipe`, `idMatchT`, `score`) VALUES
(1, 14, 6),
(1, 28, 9),
(1, 41, 9),
(1, 53, 1),
(1, 64, 4),
(1, 74, 3),
(1, 83, 6),
(1, 91, 6),
(1, 98, 6),
(1, 104, 6),
(1, 109, 3),
(1, 113, 0),
(1, 116, 3),
(1, 118, 1),
(1, 120, 2),
(2, 15, 3),
(2, 29, 7),
(2, 42, 10),
(2, 54, 2),
(2, 65, 7),
(2, 75, 9),
(2, 84, 6),
(2, 92, 8),
(2, 99, 0),
(2, 105, 10),
(2, 110, 7),
(2, 114, 4),
(2, 117, 9),
(2, 119, 3),
(2, 120, 6),
(3, 3, 10),
(3, 17, 6),
(3, 30, 2),
(3, 43, 6),
(3, 44, 0),
(3, 45, 6),
(3, 46, 6),
(3, 47, 9),
(3, 48, 1),
(3, 49, 8),
(3, 50, 4),
(3, 51, 7),
(3, 52, 2),
(3, 53, 4),
(3, 54, 5),
(4, 5, 10),
(4, 19, 10),
(4, 32, 5),
(4, 44, 2),
(4, 55, 9),
(4, 66, 3),
(4, 67, 1),
(4, 68, 3),
(4, 69, 9),
(4, 70, 10),
(4, 71, 7),
(4, 72, 9),
(4, 73, 4),
(4, 74, 4),
(4, 75, 2),
(5, 7, 6),
(5, 21, 8),
(5, 34, 5),
(5, 46, 1),
(5, 57, 4),
(5, 67, 6),
(5, 76, 4),
(5, 85, 7),
(5, 86, 5),
(5, 87, 9),
(5, 88, 5),
(5, 89, 10),
(5, 90, 0),
(5, 91, 9),
(5, 92, 4),
(6, 2, 1),
(6, 16, 0),
(6, 30, 0),
(6, 31, 9),
(6, 32, 2),
(6, 33, 4),
(6, 34, 7),
(6, 35, 3),
(6, 36, 9),
(6, 37, 7),
(6, 38, 6),
(6, 39, 3),
(6, 40, 10),
(6, 41, 3),
(6, 42, 7),
(7, 4, 5),
(7, 18, 10),
(7, 31, 2),
(7, 43, 7),
(7, 55, 3),
(7, 56, 0),
(7, 57, 10),
(7, 58, 7),
(7, 59, 2),
(7, 60, 9),
(7, 61, 5),
(7, 62, 0),
(7, 63, 4),
(7, 64, 3),
(7, 65, 0),
(8, 6, 9),
(8, 20, 4),
(8, 33, 2),
(8, 45, 1),
(8, 56, 1),
(8, 66, 9),
(8, 76, 7),
(8, 77, 1),
(8, 78, 5),
(8, 79, 9),
(8, 80, 4),
(8, 81, 8),
(8, 82, 9),
(8, 83, 7),
(8, 84, 0),
(9, 8, 4),
(9, 22, 10),
(9, 35, 1),
(9, 47, 7),
(9, 58, 9),
(9, 68, 9),
(9, 77, 7),
(9, 85, 9),
(9, 93, 2),
(9, 94, 1),
(9, 95, 10),
(9, 96, 9),
(9, 97, 4),
(9, 98, 4),
(9, 99, 8),
(10, 1, 0),
(10, 2, 4),
(10, 3, 10),
(10, 4, 8),
(10, 5, 1),
(10, 6, 2),
(10, 7, 2),
(10, 8, 7),
(10, 9, 7),
(10, 10, 7),
(10, 11, 9),
(10, 12, 5),
(10, 13, 7),
(10, 14, 2),
(10, 15, 8),
(11, 1, 3),
(11, 16, 6),
(11, 17, 6),
(11, 18, 5),
(11, 19, 1),
(11, 20, 8),
(11, 21, 1),
(11, 22, 10),
(11, 23, 4),
(11, 24, 3),
(11, 25, 8),
(11, 26, 0),
(11, 27, 7),
(11, 28, 1),
(11, 29, 4),
(12, 9, 3),
(12, 23, 9),
(12, 36, 10),
(12, 48, 1),
(12, 59, 9),
(12, 69, 5),
(12, 78, 1),
(12, 86, 10),
(12, 93, 2),
(12, 100, 0),
(12, 101, 4),
(12, 102, 8),
(12, 103, 0),
(12, 104, 10),
(12, 105, 5),
(13, 10, 1),
(13, 24, 8),
(13, 37, 9),
(13, 49, 7),
(13, 60, 2),
(13, 70, 4),
(13, 79, 1),
(13, 87, 10),
(13, 94, 9),
(13, 100, 0),
(13, 106, 3),
(13, 107, 9),
(13, 108, 9),
(13, 109, 6),
(13, 110, 8),
(14, 11, 4),
(14, 25, 8),
(14, 38, 10),
(14, 50, 10),
(14, 61, 5),
(14, 71, 4),
(14, 80, 3),
(14, 88, 1),
(14, 95, 10),
(14, 101, 9),
(14, 106, 8),
(14, 111, 0),
(14, 112, 8),
(14, 113, 2),
(14, 114, 0),
(15, 12, 10),
(15, 26, 1),
(15, 39, 4),
(15, 51, 0),
(15, 62, 10),
(15, 72, 9),
(15, 81, 9),
(15, 89, 2),
(15, 96, 7),
(15, 102, 9),
(15, 107, 8),
(15, 111, 9),
(15, 115, 1),
(15, 116, 1),
(15, 117, 5),
(16, 13, 10),
(16, 27, 4),
(16, 40, 8),
(16, 52, 9),
(16, 63, 10),
(16, 73, 5),
(16, 82, 3),
(16, 90, 1),
(16, 97, 4),
(16, 103, 0),
(16, 108, 8),
(16, 112, 7),
(16, 115, 6),
(16, 118, 10),
(16, 119, 1);

-- --------------------------------------------------------

--
-- Structure de la table `EquipePoule`
--

CREATE TABLE `EquipePoule` (
  `idEquipe` int NOT NULL,
  `idPoule` int NOT NULL,
  `idMatchT` int NOT NULL,
  `score` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Structure de la table `EquipeTournoi`
--

CREATE TABLE `EquipeTournoi` (
  `idEquipe` int NOT NULL,
  `idTournoi` int NOT NULL,
  `estInscrite` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `EquipeTournoi`
--

INSERT INTO `EquipeTournoi` (`idEquipe`, `idTournoi`, `estInscrite`) VALUES
(1, 3, 1),
(2, 3, 1),
(3, 3, 1),
(4, 3, 1),
(5, 3, 1),
(6, 3, 1),
(7, 3, 1),
(8, 3, 1),
(9, 3, 1),
(10, 3, 1),
(11, 3, 1),
(12, 3, 1),
(13, 3, 1),
(14, 3, 1),
(15, 3, 1),
(16, 3, 1);

-- --------------------------------------------------------

--
-- Structure de la table `Gestionnaire`
--

CREATE TABLE `Gestionnaire` (
  `idGestionnaire` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `Gestionnaire`
--

INSERT INTO `Gestionnaire` (`idGestionnaire`) VALUES
(2),
(14),
(16);

-- --------------------------------------------------------

--
-- Structure de la table `Joueur`
--

CREATE TABLE `Joueur` (
  `idJoueur` int NOT NULL,
  `idEquipe` int NOT NULL,
  `estCapitaine` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `Joueur`
--

INSERT INTO `Joueur` (`idJoueur`, `idEquipe`, `estCapitaine`) VALUES
(2, 10, 1),
(3, 10, 0),
(4, 10, 0),
(5, 11, 1),
(6, 11, 0),
(7, 11, 0),
(8, 3, 1),
(9, 3, 0),
(10, 3, 0),
(11, 4, 1),
(12, 2, 1),
(13, 1, 1),
(19, 12, 1),
(20, 13, 1),
(21, 14, 1),
(22, 15, 1);

-- --------------------------------------------------------

--
-- Structure de la table `MatchT`
--

CREATE TABLE `MatchT` (
  `idMatchT` int NOT NULL,
  `idTournoi` int NOT NULL,
  `date` date NOT NULL,
  `horaire` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `MatchT`
--

INSERT INTO `MatchT` (`idMatchT`, `idTournoi`, `date`, `horaire`) VALUES
(1, 3, '2021-05-30', '17:41:00'),
(2, 3, '2021-05-30', '17:41:00'),
(3, 3, '2021-05-30', '17:41:00'),
(4, 3, '2021-05-30', '17:41:00'),
(5, 3, '2021-05-30', '17:41:00'),
(6, 3, '2021-05-30', '17:41:00'),
(7, 3, '2021-05-30', '17:41:00'),
(8, 3, '2021-05-30', '17:41:00'),
(9, 3, '2021-05-30', '17:41:00'),
(10, 3, '2021-05-30', '17:41:00'),
(11, 3, '2021-05-30', '17:41:00'),
(12, 3, '2021-05-30', '17:41:00'),
(13, 3, '2021-05-30', '17:41:00'),
(14, 3, '2021-05-30', '17:41:00'),
(15, 3, '2021-05-30', '17:41:00'),
(16, 3, '2021-05-30', '17:42:00'),
(17, 3, '2021-05-30', '17:42:00'),
(18, 3, '2021-05-30', '17:42:00'),
(19, 3, '2021-05-30', '17:42:00'),
(20, 3, '2021-05-30', '17:42:00'),
(21, 3, '2021-05-30', '17:42:00'),
(22, 3, '2021-05-30', '17:42:00'),
(23, 3, '2021-05-30', '17:42:00'),
(24, 3, '2021-05-30', '17:42:00'),
(25, 3, '2021-05-30', '17:42:00'),
(26, 3, '2021-05-30', '17:42:00'),
(27, 3, '2021-05-30', '17:42:00'),
(28, 3, '2021-05-30', '17:42:00'),
(29, 3, '2021-05-30', '17:42:00'),
(30, 3, '2021-05-30', '17:42:00'),
(31, 3, '2021-05-30', '17:42:00'),
(32, 3, '2021-05-30', '17:42:00'),
(33, 3, '2021-05-30', '17:42:00'),
(34, 3, '2021-05-30', '17:42:00'),
(35, 3, '2021-05-30', '17:42:00'),
(36, 3, '2021-05-30', '17:42:00'),
(37, 3, '2021-05-30', '17:42:00'),
(38, 3, '2021-05-30', '17:42:00'),
(39, 3, '2021-05-30', '17:42:00'),
(40, 3, '2021-05-30', '17:42:00'),
(41, 3, '2021-05-30', '17:42:00'),
(42, 3, '2021-05-30', '17:42:00'),
(43, 3, '2021-05-30', '17:42:00'),
(44, 3, '2021-05-30', '17:42:00'),
(45, 3, '2021-05-30', '17:42:00'),
(46, 3, '2021-05-30', '17:42:00'),
(47, 3, '2021-05-30', '17:42:00'),
(48, 3, '2021-05-30', '17:42:00'),
(49, 3, '2021-05-30', '17:42:00'),
(50, 3, '2021-05-30', '17:42:00'),
(51, 3, '2021-05-30', '17:42:00'),
(52, 3, '2021-05-30', '17:42:00'),
(53, 3, '2021-05-30', '17:42:00'),
(54, 3, '2021-05-30', '17:42:00'),
(55, 3, '2021-05-30', '17:42:00'),
(56, 3, '2021-05-30', '17:42:00'),
(57, 3, '2021-05-30', '17:42:00'),
(58, 3, '2021-05-30', '17:42:00'),
(59, 3, '2021-05-30', '17:42:00'),
(60, 3, '2021-05-30', '17:42:00'),
(61, 3, '2021-05-30', '17:42:00'),
(62, 3, '2021-05-30', '17:42:00'),
(63, 3, '2021-05-30', '17:42:00'),
(64, 3, '2021-05-30', '17:42:00'),
(65, 3, '2021-05-30', '17:42:00'),
(66, 3, '2021-05-30', '17:42:00'),
(67, 3, '2021-05-30', '17:42:00'),
(68, 3, '2021-05-30', '17:42:00'),
(69, 3, '2021-05-30', '17:42:00'),
(70, 3, '2021-05-30', '17:42:00'),
(71, 3, '2021-05-30', '17:42:00'),
(72, 3, '2021-05-30', '17:42:00'),
(73, 3, '2021-05-30', '17:42:00'),
(74, 3, '2021-05-30', '17:42:00'),
(75, 3, '2021-05-30', '17:42:00'),
(76, 3, '2021-05-30', '17:42:00'),
(77, 3, '2021-05-30', '17:42:00'),
(78, 3, '2021-05-30', '17:42:00'),
(79, 3, '2021-05-30', '17:42:00'),
(80, 3, '2021-05-30', '17:42:00'),
(81, 3, '2021-05-30', '17:42:00'),
(82, 3, '2021-05-30', '17:42:00'),
(83, 3, '2021-05-30', '17:42:00'),
(84, 3, '2021-05-30', '17:42:00'),
(85, 3, '2021-05-30', '17:42:00'),
(86, 3, '2021-05-30', '17:42:00'),
(87, 3, '2021-05-30', '17:42:00'),
(88, 3, '2021-05-30', '17:42:00'),
(89, 3, '2021-05-30', '17:42:00'),
(90, 3, '2021-05-30', '17:42:00'),
(91, 3, '2021-05-30', '17:42:00'),
(92, 3, '2021-05-30', '17:42:00'),
(93, 3, '2021-05-30', '17:42:00'),
(94, 3, '2021-05-30', '17:42:00'),
(95, 3, '2021-05-30', '17:42:00'),
(96, 3, '2021-05-30', '17:42:00'),
(97, 3, '2021-05-30', '17:42:00'),
(98, 3, '2021-05-30', '17:42:00'),
(99, 3, '2021-05-30', '17:42:00'),
(100, 3, '2021-05-30', '17:42:00'),
(101, 3, '2021-05-30', '17:42:00'),
(102, 3, '2021-05-30', '17:42:00'),
(103, 3, '2021-05-30', '17:42:00'),
(104, 3, '2021-05-30', '17:42:00'),
(105, 3, '2021-05-30', '17:42:00'),
(106, 3, '2021-05-30', '17:42:00'),
(107, 3, '2021-05-30', '17:42:00'),
(108, 3, '2021-05-30', '17:42:00'),
(109, 3, '2021-05-30', '17:42:00'),
(110, 3, '2021-05-30', '17:42:00'),
(111, 3, '2021-05-30', '17:42:00'),
(112, 3, '2021-05-30', '17:42:00'),
(113, 3, '2021-05-30', '17:42:00'),
(114, 3, '2021-05-30', '17:42:00'),
(115, 3, '2021-05-30', '17:42:00'),
(116, 3, '2021-05-30', '17:42:00'),
(117, 3, '2021-05-30', '17:42:00'),
(118, 3, '2021-05-30', '17:42:00'),
(119, 3, '2021-05-30', '17:42:00'),
(120, 3, '2021-05-30', '17:42:00');

-- --------------------------------------------------------

--
-- Structure de la table `Poule`
--

CREATE TABLE `Poule` (
  `idPoule` int NOT NULL,
  `idTournoi` int NOT NULL,
  `nbEquipes` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Structure de la table `Tournoi`
--

CREATE TABLE `Tournoi` (
  `idTournoi` int NOT NULL,
  `nom` varchar(25) NOT NULL,
  `dateDeb` date NOT NULL,
  `duree` int NOT NULL,
  `idGestionnaire` int NOT NULL,
  `lieu` text NOT NULL,
  `nombreTotalEquipes` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `Tournoi`
--

INSERT INTO `Tournoi` (`idTournoi`, `nom`, `dateDeb`, `duree`, `idGestionnaire`, `lieu`, `nombreTotalEquipes`) VALUES
(1, 'COUPE', '2021-06-05', 50, 2, 'Saint-Tropez (43.26285;6.658133)', 16),
(2, 'POULE', '2021-07-05', 100, 14, 'Dunkerque (51.027316;2.346036)', 16),
(3, 'CHAMPIONNAT', '2021-05-27', 40, 16, 'Perpignan (42.703744;2.877974)', 16);

-- --------------------------------------------------------

--
-- Structure de la table `Type`
--

CREATE TABLE `Type` (
  `idType` int NOT NULL,
  `idTournoi` int NOT NULL,
  `typeTournoi` enum('Coupe','Championnat','Tournoi') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `Type`
--

INSERT INTO `Type` (`idType`, `idTournoi`, `typeTournoi`) VALUES
(1, 1, 'Coupe'),
(2, 2, 'Tournoi'),
(3, 3, 'Championnat');

-- --------------------------------------------------------

--
-- Structure de la table `Utilisateur`
--

CREATE TABLE `Utilisateur` (
  `idUtilisateur` int NOT NULL,
  `nom` varchar(25) NOT NULL,
  `prenom` varchar(25) NOT NULL,
  `email` varchar(200) NOT NULL,
  `motDePasse` varchar(64) NOT NULL,
  `role` enum('Utilisateur','Administrateur') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `Utilisateur`
--

INSERT INTO `Utilisateur` (`idUtilisateur`, `nom`, `prenom`, `email`, `motDePasse`, `role`) VALUES
(1, 'ADMIN', 'Admin', 'admin@test.com', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'Administrateur'),
(2, 'DUJARDIN', 'Jean', 'JeanDujardin@test.com', '4ff17bc8ee5f240c792b8a41bfa2c58af726d83b925cf696af0c811627714c85', 'Utilisateur'),
(3, 'Machin', 'Truc', 'M@T.com', '74913f96f46a13995ef292f85deffae7b86a35d5d3180a5581b04b12b7b30245', 'Utilisateur'),
(4, 'Jean', 'Dupont', 'J@D.com', '74913f96f46a13995ef292f85deffae7b86a35d5d3180a5581b04b12b7b30245', 'Utilisateur'),
(5, 'Henri', 'Guibet', 'H@G.com', '74913f96f46a13995ef292f85deffae7b86a35d5d3180a5581b04b12b7b30245', 'Utilisateur'),
(6, 'Louis', 'De Funès', 'L@F.com', '74913f96f46a13995ef292f85deffae7b86a35d5d3180a5581b04b12b7b30245', 'Utilisateur'),
(7, 'Jean', 'Gabin', 'J@G.com', '74913f96f46a13995ef292f85deffae7b86a35d5d3180a5581b04b12b7b30245', 'Utilisateur'),
(8, 'Robert', 'Redford', 'R@R.com', '74913f96f46a13995ef292f85deffae7b86a35d5d3180a5581b04b12b7b30245', 'Utilisateur'),
(9, 'Lino', 'Ventura', 'L@V.com', '74913f96f46a13995ef292f85deffae7b86a35d5d3180a5581b04b12b7b30245', 'Utilisateur'),
(10, 'Francis', 'Blanche', 'F@B.com', '74913f96f46a13995ef292f85deffae7b86a35d5d3180a5581b04b12b7b30245', 'Utilisateur'),
(11, 'Venantino', 'Venantini', 'V@V.com', '74913f96f46a13995ef292f85deffae7b86a35d5d3180a5581b04b12b7b30245', 'Utilisateur'),
(12, 'Jean', 'Lefevre', 'J@L.com', '74913f96f46a13995ef292f85deffae7b86a35d5d3180a5581b04b12b7b30245', 'Utilisateur'),
(13, 'Bernard', 'Blier', 'B@B.com', '74913f96f46a13995ef292f85deffae7b86a35d5d3180a5581b04b12b7b30245', 'Utilisateur'),
(14, 'Line', 'Renaud', 'L@R.com', '74913f96f46a13995ef292f85deffae7b86a35d5d3180a5581b04b12b7b30245', 'Utilisateur'),
(15, 'Jean-Pierre', 'Marielle', 'JP@M.com', '74913f96f46a13995ef292f85deffae7b86a35d5d3180a5581b04b12b7b30245', 'Utilisateur'),
(16, 'Jean', 'Rochefort', 'J@R.com', '74913f96f46a13995ef292f85deffae7b86a35d5d3180a5581b04b12b7b30245', 'Utilisateur'),
(17, 'Jean-Pierre', 'Belmondo', 'JP@B.com', '74913f96f46a13995ef292f85deffae7b86a35d5d3180a5581b04b12b7b30245', 'Utilisateur'),
(18, 'Philippe', 'Noiret', 'P@N.com', '74913f96f46a13995ef292f85deffae7b86a35d5d3180a5581b04b12b7b30245', 'Utilisateur'),
(19, 'Claude', 'Rich', 'C@R.com', '74913f96f46a13995ef292f85deffae7b86a35d5d3180a5581b04b12b7b30245', 'Utilisateur'),
(20, 'Guy', 'Bedos', 'G@B.com', '74913f96f46a13995ef292f85deffae7b86a35d5d3180a5581b04b12b7b30245', 'Utilisateur'),
(21, 'Claude', 'Brasseur', 'C@B.com', '74913f96f46a13995ef292f85deffae7b86a35d5d3180a5581b04b12b7b30245', 'Utilisateur'),
(22, 'Pierre', 'Richard', 'P@R.com', '74913f96f46a13995ef292f85deffae7b86a35d5d3180a5581b04b12b7b30245', 'Utilisateur'),
(23, 'Mireille', 'Darc', 'M@D.com', '74913f96f46a13995ef292f85deffae7b86a35d5d3180a5581b04b12b7b30245', 'Utilisateur');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Equipe`
--
ALTER TABLE `Equipe`
  ADD PRIMARY KEY (`idEquipe`),
  ADD UNIQUE KEY `nomEquipe` (`nomEquipe`),
  ADD UNIQUE KEY `adresse` (`adresse`),
  ADD UNIQUE KEY `numTel` (`numTel`);

--
-- Index pour la table `EquipeMatchT`
--
ALTER TABLE `EquipeMatchT`
  ADD PRIMARY KEY (`idEquipe`,`idMatchT`),
  ADD KEY `FK_EquipeMatchT_MatchT` (`idMatchT`);

--
-- Index pour la table `EquipePoule`
--
ALTER TABLE `EquipePoule`
  ADD PRIMARY KEY (`idEquipe`,`idPoule`,`idMatchT`),
  ADD KEY `FK_EquipePoule_Poule` (`idPoule`),
  ADD KEY `FK_EquipePoule_MatchT` (`idMatchT`);

--
-- Index pour la table `EquipeTournoi`
--
ALTER TABLE `EquipeTournoi`
  ADD PRIMARY KEY (`idEquipe`,`idTournoi`),
  ADD KEY `FK_EquipeTournoi_Tournoi` (`idTournoi`);

--
-- Index pour la table `Gestionnaire`
--
ALTER TABLE `Gestionnaire`
  ADD PRIMARY KEY (`idGestionnaire`);

--
-- Index pour la table `Joueur`
--
ALTER TABLE `Joueur`
  ADD PRIMARY KEY (`idJoueur`),
  ADD KEY `FK_Joueur_Equipe` (`idEquipe`);

--
-- Index pour la table `MatchT`
--
ALTER TABLE `MatchT`
  ADD PRIMARY KEY (`idMatchT`),
  ADD KEY `FK_MatchT_Tournoi` (`idTournoi`);

--
-- Index pour la table `Poule`
--
ALTER TABLE `Poule`
  ADD PRIMARY KEY (`idPoule`),
  ADD KEY `FK_Poule_Tournoi` (`idTournoi`);

--
-- Index pour la table `Tournoi`
--
ALTER TABLE `Tournoi`
  ADD PRIMARY KEY (`idTournoi`),
  ADD KEY `FK_Tournoi_Gestionnaire` (`idGestionnaire`);

--
-- Index pour la table `Type`
--
ALTER TABLE `Type`
  ADD PRIMARY KEY (`idType`),
  ADD KEY `FK_Type_Tournoi` (`idTournoi`);

--
-- Index pour la table `Utilisateur`
--
ALTER TABLE `Utilisateur`
  ADD PRIMARY KEY (`idUtilisateur`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `EquipeMatchT`
--
ALTER TABLE `EquipeMatchT`
  ADD CONSTRAINT `FK_EquipeMatchT_Equipe` FOREIGN KEY (`idEquipe`) REFERENCES `Equipe` (`idEquipe`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EquipeMatchT_MatchT` FOREIGN KEY (`idMatchT`) REFERENCES `MatchT` (`idMatchT`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `EquipePoule`
--
ALTER TABLE `EquipePoule`
  ADD CONSTRAINT `FK_EquipePoule_Equipe` FOREIGN KEY (`idEquipe`) REFERENCES `Equipe` (`idEquipe`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EquipePoule_MatchT` FOREIGN KEY (`idMatchT`) REFERENCES `MatchT` (`idMatchT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EquipePoule_Poule` FOREIGN KEY (`idPoule`) REFERENCES `Poule` (`idPoule`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `EquipeTournoi`
--
ALTER TABLE `EquipeTournoi`
  ADD CONSTRAINT `FK_EquipeTournoi_Equipe` FOREIGN KEY (`idEquipe`) REFERENCES `Equipe` (`idEquipe`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EquipeTournoi_Tournoi` FOREIGN KEY (`idTournoi`) REFERENCES `Tournoi` (`idTournoi`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `Gestionnaire`
--
ALTER TABLE `Gestionnaire`
  ADD CONSTRAINT `FK_Gestionnaire_Utilisateur` FOREIGN KEY (`idGestionnaire`) REFERENCES `Utilisateur` (`idUtilisateur`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `Joueur`
--
ALTER TABLE `Joueur`
  ADD CONSTRAINT `FK_Joueur_Equipe` FOREIGN KEY (`idEquipe`) REFERENCES `Equipe` (`idEquipe`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Joueur_Utilisateur` FOREIGN KEY (`idJoueur`) REFERENCES `Utilisateur` (`idUtilisateur`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `MatchT`
--
ALTER TABLE `MatchT`
  ADD CONSTRAINT `FK_MatchT_Tournoi` FOREIGN KEY (`idTournoi`) REFERENCES `Tournoi` (`idTournoi`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `Poule`
--
ALTER TABLE `Poule`
  ADD CONSTRAINT `FK_Poule_Tournoi` FOREIGN KEY (`idTournoi`) REFERENCES `Tournoi` (`idTournoi`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `Tournoi`
--
ALTER TABLE `Tournoi`
  ADD CONSTRAINT `FK_Tournoi_Gestionnaire` FOREIGN KEY (`idGestionnaire`) REFERENCES `Gestionnaire` (`idGestionnaire`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `Type`
--
ALTER TABLE `Type`
  ADD CONSTRAINT `FK_Type_Tournoi` FOREIGN KEY (`idTournoi`) REFERENCES `Tournoi` (`idTournoi`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
