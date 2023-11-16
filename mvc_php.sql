-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 16 nov. 2023 à 12:53
-- Version du serveur : 10.4.10-MariaDB
-- Version de PHP : 8.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `mvc_php`
--

-- --------------------------------------------------------

--
-- Structure de la table `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
  `id_comment` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `id_picture` int(11) NOT NULL,
  `text` varchar(225) NOT NULL,
  PRIMARY KEY (`id_comment`),
  KEY `FK_id_id_picture` (`id_picture`),
  KEY `FK_id_id_user` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `comments`
--

INSERT INTO `comments` (`id_comment`, `id_user`, `id_picture`, `text`) VALUES
(1, 1, 3, 'Bonjour'),
(2, 2, 1, 'Tant de mystère, tant de beauté'),
(3, 1, 4, 'Jolie ville'),
(4, 2, 3, 'Très joli ! Ca donne envie de voyager');

-- --------------------------------------------------------

--
-- Structure de la table `picture`
--

DROP TABLE IF EXISTS `picture`;
CREATE TABLE IF NOT EXISTS `picture` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `src` varchar(225) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `description` varchar(225) DEFAULT NULL,
  `author` varchar(100) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `picture`
--

INSERT INTO `picture` (`id`, `src`, `title`, `description`, `author`, `created_at`, `updated_at`) VALUES
(1, 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f9/Mona_Lisa%2C_by_Leonardo_da_Vinci%2C_from_C2RMF_natural_color.jpg/800px-Mona_Lisa%2C_by_Leonardo_da_Vinci%2C_from_C2RMF_natural_color.jpg', 'La Joconde', 'Propriété de l\'État français, affectée à la collection du département des peintures du musée du Louvre. Protégée au titre de bien d\'un musée de France.', 'Durana', '2023-10-24 11:13:49', '2023-11-03 13:31:43'),
(2, 'https://upload.wikimedia.org/wikipedia/commons/6/65/Otgonbayar_Ershuu_Buddha_Painting.jpg', 'Bouddha', 'Le mot bouddha est à l\'origine un nom commun (« le bouddha », « un bouddha ») (issu d\'un participe passé sanskrit – voir ci-dessus) signifiant « éveillé ».', 'Durana', '2023-10-24 14:37:13', '2023-11-03 13:31:31'),
(3, './uploads\\1699458718.jpg', 'Hathor', 'Elle est la déesse de la Beauté, l\'Amour, la Maternité, des fêtes, de la Musique et de la Joie. Hathor, fille de Rê et de Nout était une déesse très importante et très populaire', 'Durana', '2023-10-24 14:48:57', '2023-11-03 13:31:21'),
(4, 'https://www.celebritycruises.com/blog/content/uploads/2022/12/best-time-to-visit-istanbul-hero-cta-375x540.jpg', 'Istanbul', 'Métropole à cheval entre l\'Europe et l\'Asie, carrefour des routes continentales et maritimes, l\'histoire a façonné le destin de cette ville aux deux empires (empire byzantin et ottoman)', 'Durana', '2023-10-25 16:27:23', '2023-10-25 16:27:23'),
(8, 'https://media.gettyimages.com/id/522080738/fr/photo/turkey-konya-mevlana-museum.jpg?s=612x612&w=gi&k=20&c=jwPSPSgCSDs5ogH7nn9PRjEYleauHYQGm8Lpu2UY6W8=', 'Konya', 'Konya, anciennement nommée Iconium, est une ville de Turquie.  Elle est traditionnellement connue pour ses tapis à motifs de maisons (en frise) . Elle abrite le mausoloée de Rumi Mevlana', 'Durana', '2023-11-16 10:36:50', '2023-11-16 10:36:50');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pseudo` varchar(100) NOT NULL,
  `nom` varchar(100) DEFAULT NULL,
  `prenom` varchar(100) DEFAULT NULL,
  `mail` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `pseudo`, `nom`, `prenom`, `mail`, `password`) VALUES
(1, 'Durana', 'Ozen', 'Andrea', 'mamzelledu4659@gmail.com', 'Laravel23'),
(2, 'Shaa', 'Chaabouni', 'Omar', 'omar.chaabouni@gmail.com', 'gsdghuhyv54'),
(3, 'Dekpo74', 'Yologaza', 'Dekpo', 'dekp.yolo@wanadoo.fr', 'wxcvbn');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `FK_id_id_picture` FOREIGN KEY (`id_picture`) REFERENCES `picture` (`id`),
  ADD CONSTRAINT `FK_id_id_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
