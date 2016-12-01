-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               5.7.15-log - MySQL Community Server (GPL)
-- Операционная система:         Win64
-- HeidiSQL Версия:              9.3.0.5124
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Дамп структуры базы данных forum
CREATE DATABASE IF NOT EXISTS `forum` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `forum`;

-- Дамп структуры для таблица forum.forum
CREATE TABLE IF NOT EXISTS `forum` (
  `forumID` int(11) NOT NULL AUTO_INCREMENT,
  `nameOfForum` varchar(60) NOT NULL DEFAULT '0',
  `descriptionOfForum` varchar(140) DEFAULT NULL,
  `dateOfCreate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`forumID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы forum.forum: ~5 rows (приблизительно)
/*!40000 ALTER TABLE `forum` DISABLE KEYS */;
INSERT INTO `forum` (`forumID`, `nameOfForum`, `descriptionOfForum`, `dateOfCreate`) VALUES
	(1, 'Android', 'Форум посвященный обсуждению устройств на платформе Android', '2016-11-11 19:33:22'),
	(2, 'Apple', 'Форум посвященный обсуждению устройств на платформе IOS', '2016-11-12 01:54:06'),
	(3, 'Windows Phone', 'Форум посвященный обсуждению устройств на платформе Windows Phone', '2016-11-14 11:07:02'),
	(5, 'Test', 'testdescription', '2016-11-14 23:01:22'),
	(6, 'Название форума', 'описание фылсдурма', '2016-11-20 20:37:21');
/*!40000 ALTER TABLE `forum` ENABLE KEYS */;

-- Дамп структуры для таблица forum.messages
CREATE TABLE IF NOT EXISTS `messages` (
  `messageID` int(11) NOT NULL AUTO_INCREMENT,
  `topic_id` int(11) NOT NULL DEFAULT '0',
  `message` varchar(500) NOT NULL DEFAULT '0',
  `authorOfMessage` varchar(30) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `dateOfCreate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dateOfUpdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`messageID`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы forum.messages: ~19 rows (приблизительно)
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` (`messageID`, `topic_id`, `message`, `authorOfMessage`, `user_id`, `dateOfCreate`, `dateOfUpdate`, `status`) VALUES
	(1, 1, 'Сообщение, сообщение сообщение', 'novart', 1, '2016-11-14 13:56:55', '2016-11-14 13:56:55', NULL),
	(2, 2, 'Сообщение, сообщение сообщение', 'novart', 1, '2016-11-14 13:56:55', '2016-11-14 13:56:55', NULL),
	(3, 1, 'Сообщение, сообщение сообщение Сообщение, сообщение сообщение Сообщение, сообщение сообщение Сообщение, сообщение сообщение Сообщение, сообщение сообщение Сообщение, сообщение сообщение Сообщение, сообщение сообщение Сообщение, сообщение сообщение  м м Сообщение, сообщение сообщение Сообщение, сообщение сообщениеСообщение, сообщение сообщение Сообщение, сообщение сообщение Сообщение, сообщение сообщение Сообщение, сообщение сообщение ', 'novart', 1, '2016-11-14 13:56:55', '2016-11-14 13:56:55', NULL),
	(4, 3, 'Это мое первое сообщение', 'Artem', 2, '2016-11-15 01:41:46', '2016-11-15 01:41:46', NULL),
	(5, 2, 'Это мое второе сообщение', 'tema', 13, '2016-11-15 03:16:56', '2016-11-15 03:16:56', NULL),
	(6, 3, 'Это мое второе сообщение', 'Artem', 2, '2016-11-15 10:42:56', '2016-11-15 10:42:56', NULL),
	(8, 4, 'Фигня этот ваш Explorer!!!', 'юзернейм', 0, '2016-11-16 08:37:07', '2016-11-16 08:37:07', NULL),
	(9, 4, 'Не нравится, не пользуйся', 'логин', 0, '2016-11-16 08:42:34', '2016-11-16 08:42:34', NULL),
	(10, 5, 'Это мой первый коммент', 'юзернейм', 0, '2016-11-17 01:46:25', '2016-11-17 01:46:25', NULL),
	(11, 8, 'Nullam viverra arcu a ante varius ', 'юзернейм', 0, '2016-11-17 09:34:10', '2016-11-17 09:34:10', NULL),
	(12, 9, 'Ура! Дата вывелась. Осталось сделать вывод роли автора', 'novart', 0, '2016-11-17 15:55:32', '2016-11-17 15:55:32', NULL),
	(13, 13, 'njkbhvgfxtryughijkl; gvhg jvcjg\\', 'tester', 0, '2016-11-20 14:20:42', '2016-11-20 14:20:42', NULL),
	(14, 13, '.njnkn', 'tester', 0, '2016-11-20 14:21:04', '2016-11-20 14:21:04', NULL),
	(15, 9, 'Не получается вывести роль автора(', 'tester', 0, '2016-11-20 14:22:38', '2016-11-20 14:22:38', NULL),
	(16, 7, 'мчсмчичичмичмичмичмичмичм', 'tester', 0, '2016-11-20 14:44:26', '2016-11-20 14:44:26', NULL),
	(17, 7, 'Это мой первый коммент', 'Artem', 0, '2016-11-20 20:52:44', '2016-11-20 20:52:44', NULL),
	(18, 10, 'Windows Phone', 'Artem', 0, '2016-11-20 20:53:30', '2016-11-20 20:53:30', NULL),
	(21, 8, 'прокомментировать', 'Artem', 0, '2016-11-21 11:19:32', '2016-11-21 11:19:32', NULL),
	(22, 10, 'Привет от Динара! Я тут новенький', 'dinar', 0, '2016-11-19 11:24:26', '2016-11-21 11:24:26', NULL);
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;

-- Дамп структуры для таблица forum.topics
CREATE TABLE IF NOT EXISTS `topics` (
  `topicID` int(11) NOT NULL AUTO_INCREMENT,
  `forum_id` int(11) DEFAULT '0',
  `titleOfTopic` varchar(500) DEFAULT '0',
  `message` varchar(500) DEFAULT '0',
  `messageOfTopic` varchar(1500) DEFAULT '0',
  `authorOfMessage` varchar(50) DEFAULT '0',
  `dateOfCreate` datetime DEFAULT CURRENT_TIMESTAMP,
  `dateOfUpdate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`topicID`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы forum.topics: ~14 rows (приблизительно)
/*!40000 ALTER TABLE `topics` DISABLE KEYS */;
INSERT INTO `topics` (`topicID`, `forum_id`, `titleOfTopic`, `message`, `messageOfTopic`, `authorOfMessage`, `dateOfCreate`, `dateOfUpdate`) VALUES
	(1, 1, 'Официальная прошивка для MEIZU MX4', 'прошивка прошивка прошивка прошивка м прошивка прошивка прошивка прошивка', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque ullamcorper, nibh nec finibus sollicitudin, augue erat venenatis lectus, at varius tellus enim quis massa. Donec sed orci a sem semper hendrerit eget ac odio. Integer consectetur volutpat mauris, non commodo diam mattis eget. Interdum et malesuada fames ac ante ipsum primis in faucibus. Aenean iaculis venenatis hendrerit. Etiam tempor malesuada ullamcorper. Nunc id aliquet est, eu pharetra lacus. Etiam viverra rutrum lectus, vitae congue odio scelerisque ac. Praesent semper tellus nisi, ut mattis sem tempus porta. Sed ornare sem sit amet urna lacinia volutpat. Suspendisse congue ligula ligula, et iaculis neque ornare nec. In eleifend lorem sit amet purus varius maximus. Vestibulum sem lectus, tincidunt at aliquet nec, viverra ac ipsum. Etiam viverra ac nisi non rhoncus. Nulla malesuada eleifend scelerisque.  Etiam non tincidunt lacus. Integer et dapibus ipsum. Sed ultrices, leo et lacinia bibendum, turpis dui lacinia tellus, quis volutpat enim velit et nunc. Suspendisse nec quam a leo interdum fringilla. Pellentesque tempus consectetur venenatis. Ut nec neque vitae lorem semper blandit in sed sem. Morbi vitae commodo turpis. Nunc ante leo, luctus a pellentesque non, lacinia ut tellus. Duis rutrum nibh ac pharetra egestas.', 'Novarty', '2016-11-10 13:05:18', '2016-11-10 13:05:18'),
	(2, 2, 'Обсуждение нового флагмана IPhone9000', 'куча непонятного текста, описание, описание, очень много описания, бла-бла-бла. описание описание описание описание', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque ullamcorper, nibh nec finibus sollicitudin, augue erat venenatis lectus, at varius tellus enim quis massa. Donec sed orci a sem semper hendrerit eget ac odio. Integer consectetur volutpat mauris, non commodo diam mattis eget. Interdum et malesuada fames ac ante ipsum primis in faucibus. Aenean iaculis venenatis hendrerit. Etiam tempor malesuada ullamcorper. Nunc id aliquet est, eu pharetra lacus. Etiam viverra rutrum lectus, vitae congue odio scelerisque ac. Praesent semper tellus nisi, ut mattis sem tempus porta. Sed ornare sem sit amet urna lacinia volutpat. Suspendisse congue ligula ligula, et iaculis neque ornare nec. In eleifend lorem sit amet purus varius maximus. Vestibulum sem lectus, tincidunt at aliquet nec, viverra ac ipsum. Etiam viverra ac nisi non rhoncus. Nulla malesuada eleifend scelerisque.  Etiam non tincidunt lacus. Integer et dapibus ipsum. Sed ultrices, leo et lacinia bibendum, turpis dui lacinia tellus, quis volutpat enim velit et nunc. Suspendisse nec quam a leo interdum fringilla. Pellentesque tempus consectetur venenatis. Ut nec neque vitae lorem semper blandit in sed sem. Morbi vitae commodo turpis. Nunc ante leo, luctus a pellentesque non, lacinia ut tellus. Duis rutrum nibh ac pharetra egestas.', 'Artem', '2016-11-11 13:05:18', '2016-11-10 13:05:18'),
	(3, 1, 'Обсуждение смартфона Samsung Galaxy S10', 'Совершенно новое cупер-мега взрывное предложение от разработчиков SGS 10! Увеличенный радиус действия, большая зона покрытия,более насыщенные цвета!', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque ullamcorper, nibh nec finibus sollicitudin, augue erat venenatis lectus, at varius tellus enim quis massa. Donec sed orci a sem semper hendrerit eget ac odio. Integer consectetur volutpat mauris, non commodo diam mattis eget. Interdum et malesuada fames ac ante ipsum primis in faucibus. Aenean iaculis venenatis hendrerit. Etiam tempor malesuada ullamcorper. Nunc id aliquet est, eu pharetra lacus. Etiam viverra rutrum lectus, vitae congue odio scelerisque ac. Praesent semper tellus nisi, ut mattis sem tempus porta. Sed ornare sem sit amet urna lacinia volutpat. Suspendisse congue ligula ligula, et iaculis neque ornare nec. In eleifend lorem sit amet purus varius maximus. Vestibulum sem lectus, tincidunt at aliquet nec, viverra ac ipsum. Etiam viverra ac nisi non rhoncus. Nulla malesuada eleifend scelerisque.  Etiam non tincidunt lacus. Integer et dapibus ipsum. Sed ultrices, leo et lacinia bibendum, turpis dui lacinia tellus, quis volutpat enim velit et nunc. Suspendisse nec quam a leo interdum fringilla. Pellentesque tempus consectetur venenatis. Ut nec neque vitae lorem semper blandit in sed sem. Morbi vitae commodo turpis. Nunc ante leo, luctus a pellentesque non, lacinia ut tellus. Duis rutrum nibh ac pharetra egestas.', 'SaidShahid', '2016-11-12 23:10:30', '2016-11-12 23:10:30'),
	(4, 3, 'Internet Explorer на Windows Phone', 'Описание', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque ullamcorper, nibh nec finibus sollicitudin, augue erat venenatis lectus, at varius tellus enim quis massa. Donec sed orci a sem semper hendrerit eget ac odio. Integer consectetur volutpat mauris, non commodo diam mattis eget. Interdum et malesuada fames ac ante ipsum primis in faucibus. Aenean iaculis venenatis hendrerit. Etiam tempor malesuada ullamcorper. Nunc id aliquet est, eu pharetra lacus. Etiam viverra rutrum lectus, vitae congue odio scelerisque ac. Praesent semper tellus nisi, ut mattis sem tempus porta. Sed ornare sem sit amet urna lacinia volutpat. Suspendisse congue ligula ligula, et iaculis neque ornare nec. In eleifend lorem sit amet purus varius maximus. Vestibulum sem lectus, tincidunt at aliquet nec, viverra ac ipsum. Etiam viverra ac nisi non rhoncus. Nulla malesuada eleifend scelerisque.  Etiam non tincidunt lacus. Integer et dapibus ipsum. Sed ultrices, leo et lacinia bibendum, turpis dui lacinia tellus, quis volutpat enim velit et nunc. Suspendisse nec quam a leo interdum fringilla. Pellentesque tempus consectetur venenatis. Ut nec neque vitae lorem semper blandit in sed sem. Morbi vitae commodo turpis. Nunc ante leo, luctus a pellentesque non, lacinia ut tellus. Duis rutrum nibh ac pharetra egestas.', 'tema', '2016-11-16 00:34:16', '2016-11-20 23:04:58'),
	(5, 3, 'Название', 'Описание', ' Aenean iaculis venenatis hendrerit. Etiam tempor malesuada ullamcorper. NLorem ipsum dolor sit amet, consectetur ,ibus.unc id aliquet est, eu pharetra lacus. Etiam viverra rutrum lectus, vitae congue odio scelerisque ac. Praesent semper tellus nisi, ut mattis sem tempus porta. Sed ornare sem sit amet urna lacinia volutpat. Suspendisse congue ligula ligula, et iaculis neque ornare nec. In eleifend lorem sit amet purus varius maximus. Vestibulum sem lectus, tincidunt at aliquet nec, viverra ac ipsum. Etiam viverra ac nisi non rhoncus. Nulla malesuada eleifend scelerisque.  Etiam non tincidunt lacus. Integer et dapibus ipsum. Sed ultrices, leo et lacinia bibendum, turpis dui lacinia tellus, quis volutpat enim v', 'юзернейм', '2016-11-20 23:04:51', '2016-11-20 23:04:59'),
	(6, 3, 'Название для теста', 'Описание тест', 'Ребят, не отрабатывает эта строчка в jsp: /forum?id=<c:out value="${topicId}"></c:out> Что делать, помогите?', 'логин', '2016-11-20 23:04:54', '2016-11-20 23:04:56'),
	(7, 5, 'Testik', 'описание', 'Maecenas quis nulla vel eros scelerisque mattis. Cras eget condimentum nisl. Quisque lobortis tortor vitae scelerisque tristique. In sodales lacus eu sem dictum, sed viverra orci fringilla. Quisque interdum vestibulum urna ac vestibulum. Nam placerat quis magna vitae venenatis. Praesent auctor lacus quis libero aliquet, vitae tristique magna facilisis. Duis blandit, eros et dignissim ullamcorper, ipsum elit tincidunt ipsum, eu viverra lorem metus nec dui.  Nunc auctor arcu eu pretium auctor. Proin id placerat leo. In in odio eget odio auctor gravida. Curabitur laoreet augue et ante consectetur volutpat. Donec vulputate nibh magna, at lacinia urna ornare maximus. In et lacus fermentum, commodo arcu non, dictum ex. Nulla at eleifend ipsum, et egestas quam. Morbi eget mauris volutpat, fringilla turpis nec, lacinia enim. Etiam ultricies ornare ornare. Integer iaculis mauris sit amet elementum rutrum. Phasellus elementum sapien augue. Maecenas tincidunt ultricies nulla vel ornare. Nunc ullamcorper bibendum dolor nec vestibulum. ', 'novart', '2016-11-17 09:28:24', '2016-11-17 09:28:24'),
	(8, 5, 'название заголовочка', 'descr', 'Donec congue velit nec dolor eleifend lobortis. Phasellus dignissim ex sed eros fermentum, ullamcorper consequat arcu iaculis. Morbi lobortis turpis tempor, hendrerit libero et, viverra mauris. Morbi ut dignissim tortor, vitae luctus augue. Nunc vulputate mattis efficitur. Pellentesque sed faucibus metus. Maecenas porttitor a nunc scelerisque egestas. Integer tempus eleifend metus ac volutpat. Cras mattis aliquet consectetur. Praesent orci libero, vehicula vel mauris sit amet, viverra gravida mauris.  Fusce non semper ipsum, ut mattis quam. Etiam pretium cursus felis nec mollis. Pellentesque pharetra lorem vel vehicula sollicitudin. Nam scelerisque quam justo, nec facilisis velit condimentum sit amet. Morbi sed vestibulum magna. Sed dignissim tincidunt nulla. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed laoreet suscipit purus. Cras mollis diam non lacinia volutpat. Sed tempor pharetra est, ac egestas justo luctus vel. Morbi ipsum elit, efficitur in lectus eu, luctus porta leo. Etiam non finibus odio, nec consectetur nulla. In hac habitasse platea dictumst. Quisque sodales facilisis fringilla. Mauris dapibus turpis at imperdiet posuere.', 'юзернейм', '2016-11-17 09:32:32', '2016-11-17 09:32:32'),
	(9, 3, 'Проверка на вывод даты', 'Форум посвященный обсуждению устройств на платформе Windows Phone', 'Проверочка на вывод даты топика, если выведется, то я оставлю этот пост, если нет,  то удалю', 'novart', '2016-11-17 15:53:54', '2016-11-17 15:53:54'),
	(10, 1, 'Заголовок', 'Описание', ' Artemenean iaculis venenatis hendrerit. Etiam tempor malesuada ullamcorperra rutrum lectus, vitae congue odio scelerisque ac. Praesent semper tellus nisi, ut mattis sem tempus porta. Sed ornare sem sit amet urna lacinia volutpat. Suspendisse congue ligula ligula, et iaculis neque ornare nec. In eleifend lorem sit amet purus varius maximus. Vestibulum sem lectus, tincidunt at aliquet nec, viverra ac ipsum. Etiam viverra ac nisi non rhoncus. Nulla malesuada eleifend scelerisque.  Etiam non tincidunt lacus. Integer et dapibus ipsum. Sed ultrices, leo et lacinia bibendum, turpis dui lacinia tellus, quis volutpat enim v', 'Artem', '2016-11-18 21:12:40', '2016-11-18 21:12:40'),
	(11, 1, 'топик', 'Description', 'Textcmsdklcmsadlkcmsadlkcmasdlkcmsadlk', 'Artem', '2016-11-18 21:18:46', '2016-11-18 21:18:46'),
	(12, 2, 'Это мое первое сообщение', 'testdescription', 'ntsdvsdvdfbdfbfhkjhgfdsdghjk,jhgfdsasdfghbgfzsxdfg', 'Artem', '2016-11-18 21:35:17', '2016-11-18 21:35:17'),
	(13, 1, 'testTopic', 'testdescription', 'sdakv sndk sdl nhbjbhjbhjbjnjknk', 'tester', '2016-11-20 14:19:50', '2016-11-20 14:19:50'),
	(21, 5, 'Это мое первое сообщение', 'описание фылсдурма', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque ullamcorper, nibh nec finibus sollicitudin, augue erat venenatis lectus, at varius tellus enim quis massa. Donec sed orci a sem semper hendrerit eget ac odio. Integer consectetur volutpat mauris, non commodo diam mattis eget. Interdum et malesuada fames ac ante ipsum primis in faucibus. Aenean iaculis venenatis hendrerit. Etiam tempor malesuada ullamcorper. Nunc id aliquet est, eu pharetra lacus. Etiam viverra rutrum lectus, vitae congue odio scelerisque ac. Praesent semper tellus nisi, ut mattis sem tempus porta. Sed ornare sem sit amet urna lacinia volutpat. Suspendisse congue ligula ligula, et iaculis neque ornare nec. In eleifend lorem sit amet purus varius maximus. Vestibulum sem lectus, tincidunt at aliquet nec, viverra ac ipsum. Etiam viverra ac nisi non rhoncus. Nulla malesuada eleifend scelerisque.  Etiam non tincidunt lacus. Integer et dapibus ipsum. Sed ultrices, leo et lacinia bibendum, turpis dui lacinia tellus, quis volutpat enim v', 'dinar', '2016-11-21 11:25:01', '2016-11-21 11:25:01');
/*!40000 ALTER TABLE `topics` ENABLE KEYS */;

-- Дамп структуры для таблица forum.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(25) NOT NULL,
  `password` varchar(50) NOT NULL,
  `firstname` varchar(25) DEFAULT NULL,
  `lastname` varchar(25) DEFAULT NULL,
  `role` varchar(25) NOT NULL DEFAULT 'admin',
  `registerDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `countT` int(11) NOT NULL DEFAULT '0',
  `countM` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы forum.users: ~8 rows (приблизительно)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `username`, `password`, `firstname`, `lastname`, `role`, `registerDate`, `countT`, `countM`) VALUES
	(1, 'novart', 'fcea920f7412b5da7be0cf42b8c93759', 'test', 'test', 'MODERATOR', '2016-11-14 21:36:58', 2, 4),
	(2, 'Artem', 'e10adc3949ba59abbe56e057f20f883e', 'Artem', 'Ivanov', 'ADMIN', '2016-11-14 21:36:59', 4, 5),
	(12, 'юзернейм', 'e10adc3949ba59abbe56e057f20f883e', 'Азат', 'Ахметшин', 'ADMIN', '2016-11-14 23:03:07', 2, 3),
	(13, 'tema', 'e10adc3949ba59abbe56e057f20f883e', 'Валерий', 'Шатин', 'MEMBER', '2016-11-14 23:11:30', 1, 1),
	(14, 'логин', 'e10adc3949ba59abbe56e057f20f883e', 'Ворон', 'Летучий', 'MODERATOR', '2016-11-14 23:13:44', 1, 1),
	(17, 'tester', 'd8578edf8458ce06fbc5bb76a58c5ca4', 'tester', 'lastname', 'MEMBER', '2016-11-20 14:17:23', 1, 4),
	(18, 'dinar', 'e10adc3949ba59abbe56e057f20f883e', 'Динар', 'Раимов', 'MODERATOR', '2016-11-15 11:23:36', 1, 1),
	(19, 'ligeyn', 'e10adc3949ba59abbe56e057f20f883e', 'polina', 'edorova', 'MEMBER', '2016-11-19 12:29:25', 1, 0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
