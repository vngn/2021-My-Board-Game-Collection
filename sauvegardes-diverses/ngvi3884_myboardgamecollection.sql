-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : ven. 06 août 2021 à 20:38
-- Version du serveur :  10.3.30-MariaDB
-- Version de PHP : 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `ngvi3884_myboardgamecollection`
--

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `id` int(11) NOT NULL,
  `categorie` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`id`, `categorie`) VALUES
(1, '-'),
(2, 'Jeu de base'),
(3, 'Extension'),
(4, 'Add'),
(5, 'Autre');

-- --------------------------------------------------------

--
-- Structure de la table `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `subject` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `contact`
--

INSERT INTO `contact` (`id`, `subject`, `content`, `email`) VALUES
(1, 'test', 'plop', 'vngn@laposte.net'),
(2, 'lorem ipsum', 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?', 'vngn@laposte.net'),
(3, 'test', 'message', 'vngn@laposte.net'),
(4, 'test 15h25', 'message 15h25', 'vngn@laposte.net'),
(5, 'test 15h32', 'message 15h32', 'vngn@laposte.net'),
(6, 'test 15h35', 'message 15h35', 'vngnpro@gmail.com'),
(7, 'question du site vers gmail', 'message 15h35', 'vngnpro@gmail.com'),
(8, 'test', 'message test', 'vngn@laposte.net'),
(9, 'test', 'message test', 'vngnthomas@laposte.net'),
(10, 'plopiplop', '1647', 'vngn@laposte.net'),
(11, 'test', 'il est 1826', 'vngn@laposte.net'),
(12, 'test de 11h28', 'il est 11h28', 'vngn@laposte.net'),
(13, 'coucou', '1500', 'vngn@laposte.net'),
(14, 'test du 02 août', 'il est 07h51', 'vngn@laposte.net'),
(15, 'ezf', 'ferre', 'vngn@laposte.net'),
(16, 'test du 02 août', '15h16', 'vngn@laposte.net'),
(17, 'test du 02 août', '15h23', 'vngn@laposte.net'),
(18, 'test du 02 août', '15h36', 'vngn@laposte.net'),
(19, 'test', 'test', 'krysval@orange.fr');

-- --------------------------------------------------------

--
-- Structure de la table `jeu`
--

CREATE TABLE `jeu` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image3` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image4` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image5` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `langue` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `editeur` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sortie` int(11) DEFAULT NULL,
  `prix` int(11) DEFAULT NULL,
  `categorie_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `jeu`
--

INSERT INTO `jeu` (`id`, `nom`, `image`, `image2`, `image3`, `image4`, `image5`, `description`, `langue`, `editeur`, `sortie`, `prix`, `categorie_id`) VALUES
(31, 'Zombicide Saison 1', '2d90fa40f2be4f3523a091aa2231eb69.webp', NULL, NULL, NULL, NULL, 'Zombicide is a collaborative game for 1 to 6 players developed by Guillotine Games and published by CoolMiniOrNot.  A game lasts for 20min (beginner board) to 3 hours (expert board).\r\n\r\nEach player controls from one (for 6 players) to four (solo game) \"survivors\", human beings in a zombie-infested town. In fact, \"survivors\" hastily change to \"hunters\" to smash zombies through and through. However, the team must constantly keep the balance between survival and slaughter: as the zombicide\'s going on, the \"Danger level\" is going up and infected are growing in numbers. Any misstep can turn to disaster.\r\n\r\nZombicide is a fun and easy game with cool minis in an archetypical, popular and comics-inspired environment. Ambiance is constantly kept between \"beat\'em up\" and \"survival horror\" as characters keep on turning from preys to predators. Humor and gloom happily marry in a zombie-fest.', 'Anglais', 'CMON', 2012, 89, 2),
(32, 'Zombicide Saison 2 Prison Outbreak', '0fdd6d374d08bb84d039df03bf7cc0ff.jpg', NULL, NULL, NULL, NULL, 'Season 2: Prison Outbreak, is designed as a playable game in its own right, in the same way the Season 1 game was. A new player can enter the Zombicide universe with this box, as it contains everything needed to play as a standalone game. Even more mutated zombies roam the streets, becoming more terrible than ever.', 'Anglais', 'CMON', 2013, 100, 2),
(33, 'Zombicide Toxic City Mail', '20c0253ba3dcb72d5aea3fedabe2e1d1.jpg', NULL, NULL, NULL, NULL, 'Shopping malls are a classic zombie movie setting... experience Toxic City Mall and “shopping” will get a brand new meaning! Toxic City Mall is an expansion usable in Season 1 AND Prison Outbreak.. It contains new features to expand your Zombicide games and enrich your experience with new friends and enemies, as well as new game tiles, equipment cards and rules.', 'Anglais', 'CMON', 2013, 50, 3),
(34, 'Zombicide Saison 3 Rue Morgue', '1b489b1fecdcbd12bb1119f80e3fe25f.png', NULL, NULL, NULL, NULL, 'Zombicide Season 3: Rue Morgue is a cooperative game set in an action-movie universe for 1 to 12 players, ages 13 and up. Players control teams of survivors as they fight off a zombie horde controlled by the game itself. Survivors find weapons, battle zombies, and gain experience. The more experienced they get, the more powerful they become, but the more zombies they attract!', 'Anglais', 'CMON', 2015, 100, 2),
(35, 'Zombicide Angry Neighbors', '6b7eeb2ef3a9f614a3109dbe406a4abe.jpg', NULL, NULL, NULL, NULL, 'Zombicide Angry Neighbors challenges you to face off on a whole new breed of zombies! These Seeker zombies have you and your friends in their sights and will chase your to your bitter end!', 'Anglais', 'CMON', 2015, 50, 3),
(36, 'Zombicide Black Plague', '2d81031d710bd3d185ee321e50c2ec51.webp', NULL, NULL, NULL, NULL, 'Zombicide: Black Plague is a standalone cooperative boardgame for 1 to 6 players that brings the relentless zombie-killing action of Zombicide into a brand new fantasy setting! Players control a party of survivors as they fight to rid the land of an invasion of zombies controlled by the game itself. Survivors find weapons, learn spells, battle zombies, and gain experience. The more experienced they get, the more powerful they become, but the more zombies rise to face them!', 'Anglais', 'CMON', 2015, 100, 2),
(37, 'Zombicide Wulfsburg', '44a6f359751a4b5256bd7ba8475bcc90.png', NULL, NULL, NULL, NULL, 'Zombicide: Wulfsburg is a blood-curdling expansion for Zombicide: Black Plague!\r\n\r\nWulfsburg not only introduces four new survivors to your Zombicide: Black Plague games, but each of them comes with their own plastic dashboard, colored bases and trackers. That means this expansion allows you expand your group to up to 10 survivors at the same time!', 'Anglais', 'CMON', 2015, 50, 3),
(38, 'Zombicide Green Horde', 'ecc36bfb0cd2f13efdcfcfda8e4eb1c1.webp', NULL, NULL, NULL, NULL, 'Zombicide: Green Horde is a cooperative board game for 1 to 6 players that is both a standalone game, and fully compatible with Zombicide: Black Plague and its expansions! Players control a party of medieval fantasy survivors as they fight to rid the land of an invasion of zombie orcs controlled by the game itself. Survivors find weapons, learn spells, battle zombies, and gain experience. The more experienced they get, the more powerful they become, but the more zombies rise to face them!', 'Anglais', 'CMON', 2018, 120, 2),
(39, 'Zombicide Friends And Foes', 'ef6e5d4c38004fce6ef4a2c64d623540.webp', NULL, NULL, NULL, NULL, 'Friends and Foes is a full expansion for Zombicide: Green Horde. This box contains a myriad extras to enrich your Zombicide experience. On the \"Friends\" side, it includes not only new Survivors and weapons to equip them, but also faithful Familiars to aid them in their quests. On the \"Foes\" side, you have the challenging Tainted Walkers and Abomination, from which you\'ll want to keep your distance, 5 new treacherous tiles, and 10 new deadly Quests!', 'Anglais', 'CMON', 2018, 50, 3),
(40, 'Zombicide No Rest For The Wicked', 'b0597f28705ca7508dd022e86dcd9d0c.jpg', NULL, NULL, NULL, NULL, 'No Rest for the Wicked is a full expansion for Zombicide: Green Horde. This box contains an absurdly wide range of enemies for you to face. From tiny scurrying swarms of undead rats, to spectral walkers that only magic can touch, to a humongous undead Necromantic Dragon that will haunt your nightmares! All that plus a Ballista siege engine to give you a hand in dealing with these wicked creatures.', 'Anglais', 'CMON', 2018, 50, 3),
(41, 'Zombicide Invaders', 'b23bf8039ba98a1e22ec4652694e53df.jpg', NULL, NULL, NULL, NULL, 'Zombicide: Invader is a standalone cooperative board game for 1 to 6 players, taking the trademark Zombicide action into the far reaches of space! Players control a group of Survivors trying to defend their remote mining outpost from a swarm of infected aliens controlled by the game itself. The more experience and power the Survivors earn, the more Xenos invade the facility!\r\n\r\nThis sci-fi interpretation of Zombicide is as sleek as ever, playing fast and furious. The rules have been optimized to reduce setup time and make the game flow quickly, focusing the action on the struggle between the Survivors and the Xenos.', 'Anglais', 'CMON', 2019, 100, 2),
(42, 'Zombicide Black Ops', 'f3227fd57434abe6a102ccdafca2edd5.png', NULL, NULL, NULL, NULL, 'The Zombicide: Black Ops expansion raises the intensity to new heights while bringing new challenges for an elite group of Survivors! The Soldiers of Black Squad can be added to your roster, allowing you to play the game with up to 12 players at the same time!', 'Anglais', 'CMON', 2019, 50, 3),
(43, 'Zombicide Dark Side', 'f34b1134356757c08f0c55ee04621ef3.jpg', NULL, NULL, NULL, NULL, 'Zombicide: Dark Side! This is an entirely new standalone core box, including all the content you would expect in a Zombicide base game: Survivors, Machines, Xenos, Tiles, Missions, Equipment, Tokens, etc. While Dark Side is an independent entry point into the Zombicide sci-fi universe, it is also fully compatible with Zombicide: Invader, which means it also acts as an expansion for it, bringing a lot more content to your game.', 'Anglais', 'CMON', 2019, 90, 2),
(44, 'Zombicide Night Of The Living Dead', '8e185f4d6f193e1486616bed48b5a067.jpg', NULL, NULL, NULL, NULL, 'Night of the Living Dead: A Zombicide Game is a standalone board game that combines the fear and paranoia of George A. Romero’s 1968 horror film with the electrifying gameplay of CMON’s major board game hit Zombicide, to create this modern classic. \r\n\r\nTake on the role of the original survivors and try to make it through the NIGHT!', 'Français', 'CMON', 2020, 80, 2),
(45, 'Zombicide Undead Or Alive', '3fb4eb80abea41e4b642928b7c410385.png', NULL, NULL, NULL, NULL, 'Zombicide, the blockbuster zombie action board game is back, and this time we’re taking the fight to the wild West!\r\n\r\nFollowing in the footsteps of the recent 2nd Edition, Zombicide: Undead or Alive combines updated rules and fast setup with brand new exciting mechanics, perfect for the Western setting! \r\n\r\nThere’s a million ways to die in the West, but now nobody seems to want to stay dead. So grab your six-shooter, form your posse, and get ready for some good ol’ Zombicide!', 'Anglais', 'CMON', 2022, 100, 2),
(46, 'Zombicide Gears & Guns', 'bdbe3967d42b9544a2440734fed37728.jpg', NULL, NULL, NULL, NULL, NULL, 'Anglais', 'CMON', 2022, 40, 3),
(47, 'Zombicide Running Wild', 'a6160e16e5e1ca6c7bc509e8716d54f4.jpg', NULL, NULL, NULL, NULL, 'Running Wild expansion brings to Zombicide: Undead or Alive the gift (and the curse) of horses ! It introduces a whole posse of Survivors that can be either on foot, or riding their trusted horses. But it\'s not all good news, as this expansion also adds the nightmare of a zombie horse!', 'Anglais', 'CMON', 2022, 30, 3),
(48, 'Zombicide 2nd Edition', '15ba9eaffaf307974ad9bd6e3669718f.jpg', NULL, NULL, NULL, NULL, 'Zombicide: 2nd Edition features all-new art, miniatures, updated rules, fast setup, along with its well-known and acclaimed intense gameplay!', 'Anglais', 'CMON', 2020, 100, 2),
(49, 'Zombicide Washington Z.C.', '0fd827e36589099b009f7cb424fbaef8.jpg', NULL, NULL, NULL, NULL, 'Washington Z.C. Expansion introduces for the very first time for Zombicide a story-driven campaign, full of flavorful and impactful surprises and choices, in addition to advanced rules, new characters and an iconic location.', 'Anglais', 'CMON', 2020, 40, 3),
(50, 'Zombicide Fort Hendrix', '67a414b2fbeaf73bdb636a3d07bdd1a4.jpg', NULL, NULL, NULL, NULL, 'Zombicide: Fort Hendrix campaign expansion for Zombicide: 2nd Edition. This military-themed expansion features not only the same Campaign Mode and Advanced Rules seen in Washington Z.C., but also a slew of new additions like a special Military Equipment deck, new regular Equipment and Pimpweapons to replace the core ones, military base tiles, veteran survivors, and, of course, zombie soldiers! All this comes to life in a brand new 10-mission campaign set in Fort Hendrix, a military base where mysterious experiments were being conducted in relation to the zombie infection.', 'Anglais', 'CMON', 2020, 40, 3),
(51, 'Zombicide 2nd Edition Chronicles RPG Book', '4686404f362485e3185784e0685db2a5.jpg', NULL, NULL, NULL, NULL, 'The Roleplayer Pledge is meant for Reboot or Nostalgic backers wishing to just add the RPG to their collection. This will contain any Stretch Goals unlocked for the regular Roleplayer pledge.', 'Anglais', 'CMON', 2020, 50, 4),
(53, 'Zombicide 2nd Edition Daily Zombie Spawn Set', 'bd576719182704d61a4387efac33f303.jpg', NULL, NULL, NULL, NULL, 'Many of you manifested the interest for an Optional Buy to have extras of the Daily Zombie Spawn figures, as 1 of each didn\'t seem quite enough. Well, we\'re complying with your request!', 'Anglais', 'CMON', 2020, 35, 4),
(54, 'Zombicide 2nd Edition Chronicles Survivor Set', 'a5640a9a9362d85e1abe76b6f0f6eae9.jpg', NULL, NULL, NULL, NULL, 'Those of you who are into the Zombicide: Chronicles RPG surely have seen that the game comes with quite a few ready-to-play original Survivors with proficiencies, attributes, skills, and equipment already defined, making it very easy for you to choose one and start playing in just a few minutes.\r\n\r\nWhile developing these characters, their personas and their background were created, making them a natural part of the setting and we realized they became a part of the Zombicide universe instantly. With that in mind, it made all the sense in the world to bring them to life for the board game as well, with miniatures and ID cards!', 'Anglais', 'CMON', 2020, 30, 4),
(55, 'Zombicide 2nd Edition Urban Legends Abominations', '94bcaab4a836fd60fa2436ca8d9475bf.jpg', NULL, NULL, NULL, NULL, 'Urban Legends Abominations pack brings 4 different Abominations and their cards. The Killer Clown, Chupacabra, Sewer Crocodile, and Abductor. You\'ve heard of them. You feared them. And now, it is time to fight them!', 'Anglais', 'CMON', 2020, 25, 4),
(56, 'Zombicide 2nd Edition Extra Players Upgrade Set', '8290ace5bf2bcb36721d05e7f48c0ee2.jpg', NULL, NULL, NULL, NULL, 'Extra Players Upgrade Set Optional Buy allows you to expand your Zombicide games from 1 to 6 players to 7 to 12 players! It contains 6 plastic dashboards, 6 counter bases, 6 sets of colored pegs, and 6 Starting Equipment cards for the extra players!', 'Anglais', 'CMON', 2020, 25, 4),
(57, 'Zombicide 2nd Edition Field Guide To Zombicide Rpg', 'eb42a41bac57f3cca2fdb9c2d1a6d5f0.jpg', NULL, NULL, NULL, NULL, 'Field Guide to Zombicide, a 60-page illustrated book that describes dozens of items for Survivors to get their hands on, ranging from the mundane to the exceptional, and including military-grade gear. New rules get into the nitty-gritty of handling heavy weapons and vehicles, and add special skills for law enforcement and paramilitary Survivors.', 'Anglais', 'CMON', 2020, 20, 4),
(58, 'Zombicide 2nd Edition Tiles Set', '53facdf2e5bdcb58fac4f1a274f5e3e8.jpg', NULL, NULL, NULL, NULL, NULL, '-', 'CMON', 2020, 20, 4),
(59, 'Zombicide 2nd Edition Silver Metal Dice', 'b7eec3d272a358943ce0813b7d5418c8.jpg', NULL, NULL, NULL, NULL, 'Silver Metal Dice pack comes with 6 custom metal dice in Silver and Red.', '-', 'CMON', 2020, 16, 4),
(60, 'Zombicide 2nd Edition Golden Metal Dice', '15a7442b8b4be723da811ba65a37e49b.jpg', NULL, NULL, NULL, NULL, 'Golden Metal Dice pack comes with 6 custom metal dice in Golden and Black.', '-', 'CMON', 2020, 16, 4),
(61, 'Zombicide 2nd Edition Danny Trejo Set', '9e3124bbf2e39411cee133b26eac2c42.jpg', NULL, NULL, NULL, NULL, 'Danny Trejo Set brings this badass to Zombicide in several different flavors. Not only you get Danny Trejo as a Survivor, but you also get him as a Walker and a hulking Abomination! This set is a Kickstarter Exclusive, that may also be available in limited quantities at special conventions.', 'Anglais', 'CMON', 2020, 15, 4),
(63, 'Zombicide 2nd Edition Zombie Soldiers Set', '4a45b68d722d8ce9f0c2792bb9a6f4c5.jpg', NULL, NULL, NULL, NULL, NULL, '-', 'CMON', 2020, 12, 4),
(65, 'Zombicide 2nd Edition Zombies & Companions Upgrade Kit', '7a7fe63697d2f44a2fbc3484bb9ebbd5.jpg', NULL, NULL, NULL, NULL, '132 cards for all of the special 1st Edition types of Zombies and Companions, updated to 2nd Edition look and mechanics. As these will have the same card backs as the other 2nd Edition cards, you can just shuffle them into your decks. But not just that, like with the Stretch Goal above, these cards have been updated to 2nd Edition, with optimized organization, more spawns per card, and Zombie Rushes scattered around!', 'Anglais', 'CMON', 2020, 8, 4),
(66, 'Zombicide 2nd Edition Special Black & White Dice', '56e8b0d8eb79685e518470053b382213.jpg', NULL, NULL, NULL, NULL, 'Special Black & White Dice offers 6 White and 6 Black custom dice. These are great to spread around the table when playing the Zombicide: 2nd Edition board game, forming 2 complete sets. But they are also specially made with players of the Zombicide: Chronicles RPG in mind. This is the perfect set of dice for an RPG player, with 6 black dice to roll your Attribute and 6 white dice to roll your Proficiency. The Molotov on the 6-face denotes a success, and the Zombie Head on the 1-face denotes a failure. Sure, you can use regular dice to play the RPG... but where\'s the fun in that?', '-', 'CMON', 2020, 18, 4),
(67, 'Zombicide 2nd Edition Travel Zombicide', 'ae114bdff6f4e750120ab533633db31c.jpg', NULL, NULL, NULL, NULL, 'Travel Zombicide allows you to take Zombicide anywhere. Not only it comes with a case that allows you to carry all the game components, it also provides nifty solutions to make your game compact and easy to play in any situation or location, regardless of the space available. The Travel Edition has compact-versions of almost all the same components as the regular 2nd Edition core box, with the exception of not having Kid survivors and 1 Abomination instead of 4.', 'Anglais', 'CMON', 2020, 50, 4),
(68, 'Zombicide 2nd Edition 3D Cars', '0e48ad878fd40494527a807647028344.jpg', NULL, NULL, NULL, NULL, '3D Cars brings\r\nyou one Police Car and one Pimpmobile figures to replace the cardboard ones from the Zombicide: 2nd Edition core box.\r\nBoth cars include slots to perfectly fit up to 4 Survivors with their counter bases!', '-', 'CMON', 2020, 14, 4),
(69, 'Zombicide 2nd Edition All-Out Dice', 'f6b05a7c85f11eaced419e813448208b.jpg', NULL, NULL, NULL, NULL, 'Extra\r\nAll-Out Dice comes with 6 custom dice making up a full extra set of the All-Out dice featured in the Washington Z.C.\r\nexpansion.', '-', 'CMON', 2020, 10, 4);

-- --------------------------------------------------------

--
-- Structure de la table `reset_password_request`
--

CREATE TABLE `reset_password_request` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `selector` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hashed_token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `requested_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `expires_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pseudo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prenom` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `pseudo`, `nom`, `prenom`, `avatar`) VALUES
(8, 'vngn@laposte.net', '[\"ROLE_ADMIN\"]', '$2y$13$V7f4dTT.9Gp8m8p.6QRxK.EeoUPRG/rJzXfvU/vTuy5X2aTSnVcQi', 'Administrateur', 'NGUYEN', 'Vincent', 'b1b91cc95ec72228cfb0d18b238f9833.png'),
(9, 'user@profiltest.fr', '[\"ROLE_USER\"]', '$2y$13$f3vLkzFV06W08RgWAfZxxeoQSavYyI131yaU1.XeqsQFLHvIm56MS', 'Utilisateur test', 'TEST', 'Utilisateur', NULL),
(10, 'a@zerty.fr', '[\"ROLE_USER\"]', '$2y$13$D56o/bsNCpYSsulpZMaP8OsKpVQ9ZOvAMPobbdQ0U9cp2XjtcF6cK', 'azerty', NULL, NULL, NULL),
(13, 'vngnpro@gmail.com', '[\"ROLE_USER\"]', '$2y$13$5jZJTVY4Ld2ZXpp/Rp1UXOusAsPdzzxdE0hC90cHfcXEB05vPGNny', 'vngnpro', NULL, NULL, NULL),
(22, 'vngna@laposte.net', '[\"ROLE_USER\"]', '$2y$13$I7wTbD9YkieuHjCHR6XQv.1fC8y2z6f5IYT5jfZf0OKSogGUtPaJy', 'azerty', NULL, NULL, NULL),
(23, 'vngnpros@gmail.com', '[\"ROLE_USER\"]', '$2y$13$/.Iw7KDtunlAHIbH7LZRxeirx9N0a9GZ.1/M3Yp8O1FMMe8O0S0zi', 'azertyz', 'Utilisateur', 'test2', NULL),
(24, 'krysval@orange.fr', '[\"ROLE_USER\"]', '$2y$13$LAWJwNu9tWX3XnOqNIB9DOaIxOOYOFE/B.3Vgw3eZ3Mr5/oAW3oqq', 'krysval95', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `user_jeu`
--

CREATE TABLE `user_jeu` (
  `user_id` int(11) NOT NULL,
  `jeu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user_jeu`
--

INSERT INTO `user_jeu` (`user_id`, `jeu_id`) VALUES
(8, 31),
(8, 32),
(8, 33),
(8, 34),
(8, 35),
(8, 36),
(8, 37),
(8, 38),
(8, 39),
(8, 40),
(8, 41),
(8, 42),
(8, 43),
(8, 44),
(8, 45),
(8, 46),
(8, 47),
(8, 48),
(8, 49),
(8, 50),
(8, 51),
(8, 53),
(8, 54),
(8, 55),
(8, 59),
(8, 60),
(8, 61),
(8, 63),
(8, 65),
(8, 66),
(8, 68),
(8, 69),
(13, 48),
(24, 41),
(24, 42),
(24, 44);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `jeu`
--
ALTER TABLE `jeu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_82E48DB5BCF5E72D` (`categorie_id`);

--
-- Index pour la table `reset_password_request`
--
ALTER TABLE `reset_password_request`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_7CE748AA76ED395` (`user_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- Index pour la table `user_jeu`
--
ALTER TABLE `user_jeu`
  ADD PRIMARY KEY (`user_id`,`jeu_id`),
  ADD KEY `IDX_69F2EC3EA76ED395` (`user_id`),
  ADD KEY `IDX_69F2EC3E8C9E392E` (`jeu_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT pour la table `jeu`
--
ALTER TABLE `jeu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT pour la table `reset_password_request`
--
ALTER TABLE `reset_password_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `jeu`
--
ALTER TABLE `jeu`
  ADD CONSTRAINT `FK_82E48DB5BCF5E72D` FOREIGN KEY (`categorie_id`) REFERENCES `categorie` (`id`);

--
-- Contraintes pour la table `reset_password_request`
--
ALTER TABLE `reset_password_request`
  ADD CONSTRAINT `FK_7CE748AA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `user_jeu`
--
ALTER TABLE `user_jeu`
  ADD CONSTRAINT `FK_69F2EC3E8C9E392E` FOREIGN KEY (`jeu_id`) REFERENCES `jeu` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_69F2EC3EA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
