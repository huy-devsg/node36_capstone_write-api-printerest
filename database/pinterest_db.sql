/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP TABLE IF EXISTS `binh_luan`;
CREATE TABLE `binh_luan` (
  `binh_Luan_id` int NOT NULL AUTO_INCREMENT,
  `nguoi_dung_id` int DEFAULT NULL,
  `hinh_id` int DEFAULT NULL,
  `ngay_binh_luan` date DEFAULT NULL,
  `noi_dung` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`binh_Luan_id`),
  KEY `hinh_id` (`hinh_id`),
  KEY `nguoi_dung_id` (`nguoi_dung_id`),
  CONSTRAINT `binh_luan_ibfk_1` FOREIGN KEY (`hinh_id`) REFERENCES `hinh_anh` (`hinh_id`),
  CONSTRAINT `binh_luan_ibfk_2` FOREIGN KEY (`nguoi_dung_id`) REFERENCES `nguoi_dung` (`nguoi_dung_id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `hinh_anh`;
CREATE TABLE `hinh_anh` (
  `hinh_id` int NOT NULL AUTO_INCREMENT,
  `ten_hinh` varchar(255) DEFAULT NULL,
  `duong_dan` varchar(255) DEFAULT NULL,
  `mo_ta` varchar(255) DEFAULT NULL,
  `nguoi_dung_id` int DEFAULT NULL,
  PRIMARY KEY (`hinh_id`),
  KEY `nguoi_dung_id` (`nguoi_dung_id`),
  CONSTRAINT `hinh_anh_ibfk_1` FOREIGN KEY (`nguoi_dung_id`) REFERENCES `nguoi_dung` (`nguoi_dung_id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `luu_anh`;
CREATE TABLE `luu_anh` (
  `nguoi_dung_id` int NOT NULL,
  `hinh_id` int NOT NULL,
  `ngay_luu` date DEFAULT NULL,
  PRIMARY KEY (`nguoi_dung_id`,`hinh_id`),
  KEY `hinh_id` (`hinh_id`),
  CONSTRAINT `luu_anh_ibfk_1` FOREIGN KEY (`nguoi_dung_id`) REFERENCES `nguoi_dung` (`nguoi_dung_id`),
  CONSTRAINT `luu_anh_ibfk_2` FOREIGN KEY (`hinh_id`) REFERENCES `hinh_anh` (`hinh_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `nguoi_dung`;
CREATE TABLE `nguoi_dung` (
  `nguoi_dung_id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `mat_khau` varchar(255) DEFAULT NULL,
  `ho_ten` varchar(255) DEFAULT NULL,
  `tuoi` int DEFAULT NULL,
  `anh_dai_dien` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`nguoi_dung_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `binh_luan` (`binh_Luan_id`, `nguoi_dung_id`, `hinh_id`, `ngay_binh_luan`, `noi_dung`) VALUES
(15, 5, 5, '2023-05-05', 'Bình luận số 5');
INSERT INTO `binh_luan` (`binh_Luan_id`, `nguoi_dung_id`, `hinh_id`, `ngay_binh_luan`, `noi_dung`) VALUES
(16, 6, 6, '2023-06-06', 'Bình luận số 6');
INSERT INTO `binh_luan` (`binh_Luan_id`, `nguoi_dung_id`, `hinh_id`, `ngay_binh_luan`, `noi_dung`) VALUES
(17, 7, 7, '2023-07-07', 'Bình luận số 7');
INSERT INTO `binh_luan` (`binh_Luan_id`, `nguoi_dung_id`, `hinh_id`, `ngay_binh_luan`, `noi_dung`) VALUES
(18, 8, 8, '2023-08-08', 'Bình luận số 8'),
(19, 9, 9, '2023-09-09', 'Bình luận số 9'),
(20, 10, 10, '2023-10-10', 'Bình luận số 10'),
(25, 5, 5, '2023-05-05', 'Bình luận số 5'),
(26, 6, 6, '2023-06-06', 'Bình luận số 6'),
(27, 7, 7, '2023-07-07', 'Bình luận số 7'),
(28, 8, 8, '2023-08-08', 'Bình luận số 8'),
(29, 9, 9, '2023-09-09', 'Bình luận số 9'),
(30, 10, 10, '2023-10-10', 'Bình luận số 10'),
(31, 1, 10, '2023-04-17', 'Bình luận 19'),
(32, 10, 6, '2023-10-18', 'Bình luận 4'),
(33, 3, 7, '2023-04-18', 'Bình luận 17'),
(35, 1, 6, '2023-04-26', 'Bình luận 6'),
(36, 6, 6, '2023-05-03', 'Bình luận 5'),
(37, 1, 6, '2023-04-26', 'Bình luận 7'),
(38, 9, 10, '2023-03-25', 'Bình luận 10'),
(39, 9, 6, '2023-03-30', 'Bình luận 15'),
(41, 1, 6, '2023-07-16', 'Bình luận 11'),
(44, 4, 5, '2023-03-27', 'Bình luận 0'),
(46, 1, 7, '2023-03-19', 'Bình luận 6'),
(48, 5, 10, '2023-05-10', 'Bình luận 4'),
(66, 10, 10, '2023-11-23', 'hahaha mac cuoi qua'),
(67, 10, 10, '2023-11-23', 'hahahaa'),
(68, 10, 10, '2023-11-24', 'hinh số 10 đẹp quá');

INSERT INTO `hinh_anh` (`hinh_id`, `ten_hinh`, `duong_dan`, `mo_ta`, `nguoi_dung_id`) VALUES
(5, 'Hình 5', 'images/image5.jpg', 'Mô tả hình 5', 5);
INSERT INTO `hinh_anh` (`hinh_id`, `ten_hinh`, `duong_dan`, `mo_ta`, `nguoi_dung_id`) VALUES
(6, 'Hình 6', 'images/image6.jpg', 'Mô tả hình 6', 6);
INSERT INTO `hinh_anh` (`hinh_id`, `ten_hinh`, `duong_dan`, `mo_ta`, `nguoi_dung_id`) VALUES
(7, 'Hình 7', 'images/image7.jpg', 'Mô tả hình 7', 7);
INSERT INTO `hinh_anh` (`hinh_id`, `ten_hinh`, `duong_dan`, `mo_ta`, `nguoi_dung_id`) VALUES
(8, 'Hình 8', 'images/image8.jpg', 'Mô tả hình 8', 8),
(9, 'Hình 9', 'images/image9.jpg', 'Mô tả hình 9', 9),
(10, 'Hình 10', 'images/image10.jpg', 'Mô tả hình 10', 10),
(11, 'hình 11', 'images/image11.jpg', 'Mô tả hình 11', 1),
(12, 'Hình 11', 'images/image11.jpg', 'Mô tả hình 11', 1),
(14, 'Hình 13', 'images/image13.jpg', 'Mô tả hình 13', 3),
(15, 'Hình 14', 'images/image14.jpg', 'Mô tả hình 14', 4),
(16, 'Hình 15', 'images/image15.jpg', 'Mô tả hình 15', 5),
(17, 'Hình 16', 'images/image16.jpg', 'Mô tả hình 16', 6),
(18, 'Hình 17', 'images/image17.jpg', 'Mô tả hình 17', 7),
(19, 'Hình 18', 'images/image18.jpg', 'Mô tả hình 18', 8),
(20, 'Hình 19', 'images/image19.jpg', 'Mô tả hình 19', 9),
(21, 'Hình 20', 'images/image20.jpg', 'Mô tả hình 20', 10),
(74, 'hình 1099', 'images/1700731419178_g.jpg', 'mô tả', 9),
(75, 'hình 1099', 'images/1700731524356_g.jpg', 'mô tả', 1),
(79, 'hình code đẹp', 'images/1700794194046_Screenshot_2023-11-23_160546.png', 'hình screenshot code', 1);

INSERT INTO `luu_anh` (`nguoi_dung_id`, `hinh_id`, `ngay_luu`) VALUES
(5, 5, '2023-11-23');
INSERT INTO `luu_anh` (`nguoi_dung_id`, `hinh_id`, `ngay_luu`) VALUES
(5, 6, '2023-11-23');
INSERT INTO `luu_anh` (`nguoi_dung_id`, `hinh_id`, `ngay_luu`) VALUES
(5, 7, '2023-11-23');
INSERT INTO `luu_anh` (`nguoi_dung_id`, `hinh_id`, `ngay_luu`) VALUES
(6, 5, '2023-11-23'),
(6, 7, '2023-11-23'),
(7, 7, '2023-11-23');

INSERT INTO `nguoi_dung` (`nguoi_dung_id`, `email`, `mat_khau`, `ho_ten`, `tuoi`, `anh_dai_dien`) VALUES
(1, 'user1@gmail.com', '$2b$10$OjFE4gPUt3TqDX8YDn401.Ukw6CXUWxrGbzQrDHTyZdL.0bjqcyCu', 'Nguyen Thanh Huy 1', 22, 'avatar-update-user1.jpg');
INSERT INTO `nguoi_dung` (`nguoi_dung_id`, `email`, `mat_khau`, `ho_ten`, `tuoi`, `anh_dai_dien`) VALUES
(2, 'user2@example.com', '$2b$10$OjFE4gPUt3TqDX8YDn401.Ukw6CXUWxrGbzQrDHTyZdL.0bjqcyCu', 'Tran Thi B', 30, 'avatar2.jpg');
INSERT INTO `nguoi_dung` (`nguoi_dung_id`, `email`, `mat_khau`, `ho_ten`, `tuoi`, `anh_dai_dien`) VALUES
(3, 'user3@example.com', '$2b$10$OjFE4gPUt3TqDX8YDn401.Ukw6CXUWxrGbzQrDHTyZdL.0bjqcyCu', 'Le Van C', 22, 'avatar3.jpg');
INSERT INTO `nguoi_dung` (`nguoi_dung_id`, `email`, `mat_khau`, `ho_ten`, `tuoi`, `anh_dai_dien`) VALUES
(4, 'user4@example.com', '$2b$10$OjFE4gPUt3TqDX8YDn401.Ukw6CXUWxrGbzQrDHTyZdL.0bjqcyCu', 'Pham Thi D', 28, 'avatar4.jpg'),
(5, 'user50000@gmail.com', '$2b$10$OjFE4gPUt3TqDX8YDn401.Ukw6CXUWxrGbzQrDHTyZdL.0bjqcyCu', 'huy 5000', 50, 'avatar500.jpg'),
(6, 'user6@example.com', '$2b$10$OjFE4gPUt3TqDX8YDn401.Ukw6CXUWxrGbzQrDHTyZdL.0bjqcyCu', 'Do Thi F', 29, 'avatar6.jpg'),
(7, 'user7@example.com', '$2b$10$OjFE4gPUt3TqDX8YDn401.Ukw6CXUWxrGbzQrDHTyZdL.0bjqcyCu', 'Nguyen Van G', 31, 'avatar7.jpg'),
(8, 'user8@example.com', '$2b$10$OjFE4gPUt3TqDX8YDn401.Ukw6CXUWxrGbzQrDHTyZdL.0bjqcyCu', 'Tran Van H', 26, 'avatar8.jpg'),
(9, 'user9@example.com', '$2b$10$OjFE4gPUt3TqDX8YDn401.Ukw6CXUWxrGbzQrDHTyZdL.0bjqcyCu', 'Le Thi I', 23, 'avatar9.jpg'),
(10, 'user10@example.com', '$2b$10$OjFE4gPUt3TqDX8YDn401.Ukw6CXUWxrGbzQrDHTyZdL.0bjqcyCu', 'Pham Van J', 27, 'avatar10.jpg'),
(11, 'huy@gmail.com', '$2b$10$OjFE4gPUt3TqDX8YDn401.Ukw6CXUWxrGbzQrDHTyZdL.0bjqcyCu', 'Nguyen Thanh Huy', 25, NULL),
(12, 'huyhuy@gmail.com', '$2b$10$OjFE4gPUt3TqDX8YDn401.Ukw6CXUWxrGbzQrDHTyZdL.0bjqcyCu', 'huylll ne', 1000, 'avatar link update'),
(13, 'huy123@gmail.com', '$2b$10$MSUtpdPZyuuEXgVB3HjfY.AIVOzHnCHcv/CZlxm2XpSTbxdehCFsi', 'huy kkk', 25, NULL),
(14, 'huy1235@gmail.com', '$2b$10$OjFE4gPUt3TqDX8YDn401.Ukw6CXUWxrGbzQrDHTyZdL.0bjqcyCu', 'huy kkk', 25, NULL),
(15, 'a@gmail.com', '$2b$10$sdtcWa7ce/c.p55U/OlE8ODLjJ/Te3aeURJ/ZHh/0sYGrx48S6jR6', 'nguyen thanh huyyy', 22, NULL),
(18, 'string', '$2b$10$MmPJ2KRjviDRQfN/VhAaG.xuJzd2.KVMYdNf47N4KUbNOrzK3vaKu', 'string', 0, NULL),
(19, 'huytest@gmail.com', '$2b$10$4e5HmPaEtJckhXc.iWUGJuoPYnmr/8gTm2IQCBUM1bAPcLGN7ekmS', 'Nguyen Thanh Huy', 22, NULL),
(20, 'huytest1234@gmail.com', '$2b$10$.Mqtz3GwSCE2xrulzBuycuu7I1biBZY8qfmHHZNbaGMjPPKkuaqK.', 'Nguyen Thanh Huy', 22, 'images/avatarhuy.jpg');


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;