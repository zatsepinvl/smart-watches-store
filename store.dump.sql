CREATE DATABASE  IF NOT EXISTS `store` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `store`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: store
-- ------------------------------------------------------
-- Server version	5.5.44-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item` (
  `item_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `specification` text COLLATE utf8_unicode_ci NOT NULL,
  `manufacturer_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `image` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,'Apple Watch Nike +','Apple Watch Nike +  новейшее достижение многолетнего сотрудническтва двух компаний из числа самых инновационных в мире. Идеально подходят для бега и активного образа жизни.    ','<ul><li>Дышащий спортивный ремешок Nike</li><li>Приложение Nike+ Run Club</li><li>Встроенный GPS  модуль</li><li>Эксклюзивные циферблаты Nike</li></ul>\r',0,25000,'AppleWatch2.jpg'),(2,'Apple Watch Hermes','Apple Watch Hermès — блестящий результат сотрудничества, основанного на едином видении, взаимном уважении и обмене богатым опыто.','<ul>\r <li>Кожаный ремешок Hermès ручной работы</li>\r <li>Стильный внешний вид</li>\r <li>Мощная функциональная оснаещнность</li>\r </ul>',0,30000,'AppleWatch3.jpg'),(3,'ASUS ZenWatch 2 Taupe','Смарт-часы ASUS ZenWatch 2 WI501Q Taupe являются мощным устройством, способным выдержать конкуренции со стороны менее бюджетных аналогов.','<ul><li>Надежный стальной корпус</li><li>Совместимость с Android</li><li>Мониторинг калорий, физической активности</li><li>Стекло, устойчивое к царапинам</li></ul>',1,17000,'Asus1.jpg'),(4,'ASUS ZenWatch 2','Все самые лучшие традиции и инновации слились в смарт-часах ZenWatch 2 WI502Q ОТ компании ASUS.','<ul><li>Встроенный шагомер точно подсчитывает количество сделанных пользователем шагов,\r  представляя четкую картину его общей физической активности</li><li>Совместимость с Android</li><li>Удобное приложение \"\"Будьте здоровы\"\" для контроля уровня физческой активности</li><li>Могут показывать изображения с камеры смартфона</li></ul>\r',1,19000,'Asus2.jpg'),(5,'ASUS ZenWatch','ASUS ZenWatch (WI500Q) – доступные умные часы в премиальном дизайне.','<ul><li>Возможность выступать в качестве видоискателя камеры </li><li>Отслеживание активности </li><li>Получение уведомлений со смартфона</li><li>Изготовлены из полированной стали и кожи</li></ul>',1,16000,'Asus3.jpg'),(6,'Samsung Gear S2','Gear Fit2 – Ваш личный фитнес-тренер. Оставьте смартфон дома и насладитесь тренировкой!','<ul><li>Отслеживание активностей </li><li>1,5-дюймовый экран с технологией Super AMOLED</li><li>Интуитивно понятный интерфейс</li><li>Изменяющиеся под вашу любимую музыку темы экрана </li></ul>',2,17000,'Samsung1.jpg'),(7,'Samsug Galaxy Gear S2 Classic','Смарт-часы  SAMSUNG Galaxy Gear S2 classic SM-R7320 сделаны специально для того, чтобы выглядеть безупречно в люой ситуциции.','<ul><li>Двухъядерный процессор Exynos 3250</li><li>Совместная ребота с планшетом/смартфоном</li><li>Ремешок изготовлен из натуральной кожи</li><li>Цифровой компас </li></ul>',2,18000,'Samsung2.jpg'),(10,'Apple Watch Series 2','Новый продукт компании Apple, предназначенный для людей, ведущих активный образ жизни и желающих всегда оставаться на связи.','<ul><li>Мощное приложение\"Тренировка\"</li><li>Водонепроницаемость на глубине до 50м </li><li>Встроенный GPS  модуль</li><li>Датчик сердечной активности</li></ul>',0,25000,'AppleWatch1.jpg');
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufacturer`
--

DROP TABLE IF EXISTS `manufacturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manufacturer` (
  `manufacturer_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(45) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`manufacturer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufacturer`
--

LOCK TABLES `manufacturer` WRITE;
/*!40000 ALTER TABLE `manufacturer` DISABLE KEYS */;
INSERT INTO `manufacturer` VALUES (0,'apple'),(1,'asus'),(2,'samsung');
/*!40000 ALTER TABLE `manufacturer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `items` text COLLATE utf8_unicode_ci,
  `first_name` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `last_name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (12,'[{\"item_id\":\"10\",\"name\":\"Apple Watch Series 2\",\"description\":\"Новый продукт компании Apple, предназначенный для людей, ведущих активный образ жизни и желающих всегда оставаться на связи.\",\"specification\":\"<ul><li>Мощное приложение\\\"Тренировка\\\"</li><li>Водонепроницаемость на глубине до 50м </li><li>Встроенный GPS  модуль</li><li>Датчик сердечной активности</li></ul>\",\"manufacturer_id\":\"0\",\"price\":\"25000\",\"image\":\"AppleWatch1.jpg\"}]','dkfsdf','asd','qwe23','q2312','asd@asdsad.com',25000,'2016-11-07 12:48:31'),(13,'[{\"item_id\":\"4\",\"name\":\"ASUS ZenWatch 2\",\"description\":\"Все самые лучшие традиции и инновации слились в смарт-часах ZenWatch 2 WI502Q ОТ компании ASUS.\",\"specification\":\"<ul><li>Встроенный шагомер точно подсчитывает количество сделанных пользователем шагов,\\r  представляя четкую картину его общей физической активности</li><li>Совместимость с Android</li><li>Удобное приложение \\\"\\\"Будьте здоровы\\\"\\\" для контроля уровня физческой активности</li><li>Могут показывать изображения с камеры смартфона</li></ul>\\r\",\"manufacturer_id\":\"1\",\"price\":\"19000\",\"image\":\"Asus2.jpg\"}]','asd','asd','asd','d122','asd@asdsad.com',19000,'2016-11-07 12:51:04'),(14,'[{\"item_id\":\"1\",\"name\":\"Apple Watch Nike +\",\"description\":\"Apple Watch Nike +  новейшее достижение многолетнего сотрудническтва двух компаний из числа самых инновационных в мире. Идеально подходят для бега и активного образа жизни.    \",\"specification\":\"<ul><li>Дышащий спортивный ремешок Nike</li><li>Приложение Nike+ Run Club</li><li>Встроенный GPS  модуль</li><li>Эксклюзивные циферблаты Nike</li></ul>\\r\",\"manufacturer_id\":\"0\",\"price\":\"25000\",\"image\":\"AppleWatch2.jpg\"}]','dkfsdfsdf','sdf','f43f34','43f43','asd@asdsad.com',25000,'2016-11-07 12:52:07'),(15,'[{\"item_id\":\"1\",\"name\":\"Apple Watch Nike +\",\"description\":\"Apple Watch Nike +  новейшее достижение многолетнего сотрудническтва двух компаний из числа самых инновационных в мире. Идеально подходят для бега и активного образа жизни.    \",\"specification\":\"<ul><li>Дышащий спортивный ремешок Nike</li><li>Приложение Nike+ Run Club</li><li>Встроенный GPS  модуль</li><li>Эксклюзивные циферблаты Nike</li></ul>\\r\",\"manufacturer_id\":\"0\",\"price\":\"25000\",\"image\":\"AppleWatch2.jpg\"}]','dkfsdfsdf','sdf','f43f34','43f43','asd@asdsad.com',25000,'2016-11-07 12:52:07'),(16,'[{\"item_id\":\"4\",\"name\":\"ASUS ZenWatch 2\",\"description\":\"Все самые лучшие традиции и инновации слились в смарт-часах ZenWatch 2 WI502Q ОТ компании ASUS.\",\"specification\":\"<ul><li>Встроенный шагомер точно подсчитывает количество сделанных пользователем шагов,\\r  представляя четкую картину его общей физической активности</li><li>Совместимость с Android</li><li>Удобное приложение \\\"\\\"Будьте здоровы\\\"\\\" для контроля уровня физческой активности</li><li>Могут показывать изображения с камеры смартфона</li></ul>\\r\",\"manufacturer_id\":\"1\",\"price\":\"19000\",\"image\":\"Asus2.jpg\"}]','asd','asd','asjdasdj','asd','asd@asdsad.com',19000,'2016-11-07 13:38:44'),(17,'[{\"item_id\":\"1\",\"name\":\"Apple Watch Nike +\",\"description\":\"Apple Watch Nike +  новейшее достижение многолетнего сотрудническтва двух компаний из числа самых инновационных в мире. Идеально подходят для бега и активного образа жизни.    \",\"specification\":\"<ul><li>Дышащий спортивный ремешок Nike</li><li>Приложение Nike+ Run Club</li><li>Встроенный GPS  модуль</li><li>Эксклюзивные циферблаты Nike</li></ul>\\r\",\"manufacturer_id\":\"0\",\"price\":\"25000\",\"image\":\"AppleWatch2.jpg\"}]','Иван','Иванов','г. Воронеж ул. Кольцовская 35','1234567890','ivan@mail.com',25000,'2016-11-14 05:00:45'),(18,'[{\"item_id\":\"2\",\"name\":\"Apple Watch Hermes\",\"description\":\"Apple Watch Hermès — блестящий результат сотрудничества, основанного на едином видении, взаимном уважении и обмене богатым опыто.\",\"specification\":\"<ul>\\r <li>Кожаный ремешок Hermès ручной работы</li>\\r <li>Стильный внешний вид</li>\\r <li>Мощная функциональная оснаещнность</li>\\r </ul>\",\"manufacturer_id\":\"0\",\"price\":\"30000\",\"image\":\"AppleWatch3.jpg\"}]','Иван','Иванов','г. Воронед','1234567890','ivan@mail.com',30000,'2016-11-14 06:53:28');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-25 13:55:23
