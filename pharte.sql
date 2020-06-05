-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  jeu. 04 juin 2020 à 20:15
-- Version du serveur :  10.4.10-MariaDB
-- Version de PHP :  7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `pharte`
--

-- --------------------------------------------------------

--
-- Structure de la table `arenes`
--

DROP TABLE IF EXISTS `arenes`;
CREATE TABLE IF NOT EXISTS `arenes` (
  `id_arene` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_arene`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `arenes`
--

INSERT INTO `arenes` (`id_arene`, `nom`) VALUES
(1, 'phar1'),
(2, 'phar2'),
(3, 'phar3');

-- --------------------------------------------------------

--
-- Structure de la table `combats`
--

DROP TABLE IF EXISTS `combats`;
CREATE TABLE IF NOT EXISTS `combats` (
  `id_ combat` int(11) NOT NULL AUTO_INCREMENT,
  `date_combat` date DEFAULT NULL,
  `arene_id` int(11) NOT NULL,
  `tournoi_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id_ combat`),
  KEY `fk_combats_arenes1` (`arene_id`),
  KEY `fk_combats_tournois1` (`tournoi_id`),
  KEY `fk_combats_users1` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `combats`
--

INSERT INTO `combats` (`id_ combat`, `date_combat`, `arene_id`, `tournoi_id`, `user_id`) VALUES
(1, '2020-06-12', 2, 1, 1),
(2, '2020-05-13', 1, 1, 3),
(3, '2020-06-12', 3, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `defaites`
--

DROP TABLE IF EXISTS `defaites`;
CREATE TABLE IF NOT EXISTS `defaites` (
  `id_defaites` int(11) NOT NULL AUTO_INCREMENT,
  `date_defaite` date DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id_defaites`),
  KEY `fk_defaites_users1` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `defaites`
--

INSERT INTO `defaites` (`id_defaites`, `date_defaite`, `user_id`) VALUES
(1, '2020-05-11', 3),
(2, '2020-05-14', 3);

-- --------------------------------------------------------

--
-- Structure de la table `tournois`
--

DROP TABLE IF EXISTS `tournois`;
CREATE TABLE IF NOT EXISTS `tournois` (
  `id_tournoi` int(11) NOT NULL AUTO_INCREMENT,
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL,
  PRIMARY KEY (`id_tournoi`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `tournois`
--

INSERT INTO `tournois` (`id_tournoi`, `date_debut`, `date_fin`) VALUES
(1, '2020-06-11', '2020-06-30');

-- --------------------------------------------------------

--
-- Structure de la table `tournois_has_users`
--

DROP TABLE IF EXISTS `tournois_has_users`;
CREATE TABLE IF NOT EXISTS `tournois_has_users` (
  `tournoi_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`tournoi_id`,`user_id`),
  KEY `fk_tournois_has_users_users1` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `tournois_has_users`
--

INSERT INTO `tournois_has_users` (`tournoi_id`, `user_id`) VALUES
(1, 3),
(1, 4),
(1, 5);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `date_naissance` date NOT NULL,
  `tel` varchar(120) NOT NULL,
  `courriel` varchar(120) NOT NULL,
  `pswd` varchar(120) NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id_user`, `nom`, `prenom`, `date_naissance`, `tel`, `courriel`, `pswd`) VALUES
(1, 'zie', 'ziw', '2020-05-04', '24249872', 'ziw@ziw.com', '0000'),
(2, 'zaydoua', 'saw', '2001-03-03', '223344', 'saw@saw.com', '$2y$10$jwlDwMx5Hrb7wRR2o2NKG.Qtn64BZeLDByBTITfnAc1oa0jtrORGa'),
(3, 'phark', 'phar', '2005-06-07', '667788', 'phark@phark.com', '2222'),
(4, 'phark2', 'fire', '2005-11-07', '998898', 'phark2@phar.com', '2222'),
(5, 'souadi', 'sammouda', '2012-03-09', '22445552', 'hergla12_18@hotmail.com', '$2y$10$qOu0SIvTxLNOzGpSMeWFluxuspWBYCvNOxmDA6NRf/qAuwLZ/TejK');

-- --------------------------------------------------------

--
-- Structure de la table `victoires`
--

DROP TABLE IF EXISTS `victoires`;
CREATE TABLE IF NOT EXISTS `victoires` (
  `id_victoire` int(11) NOT NULL AUTO_INCREMENT,
  `date_victoire` date DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id_victoire`),
  KEY `fk_victoires_users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `victoires`
--

INSERT INTO `victoires` (`id_victoire`, `date_victoire`, `user_id`) VALUES
(1, '2020-05-11', 1),
(2, '2020-05-12', 2),
(3, '2020-06-16', 2);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `combats`
--
ALTER TABLE `combats`
  ADD CONSTRAINT `fk_combats_arenes1` FOREIGN KEY (`arene_id`) REFERENCES `arenes` (`id_arene`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_combats_tournois1` FOREIGN KEY (`tournoi_id`) REFERENCES `tournois` (`id_tournoi`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_combats_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `defaites`
--
ALTER TABLE `defaites`
  ADD CONSTRAINT `fk_defaites_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `tournois_has_users`
--
ALTER TABLE `tournois_has_users`
  ADD CONSTRAINT `fk_tournois_has_users_tournois` FOREIGN KEY (`tournoi_id`) REFERENCES `tournois` (`id_tournoi`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tournois_has_users_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `victoires`
--
ALTER TABLE `victoires`
  ADD CONSTRAINT `fk_victoires_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
