CREATE TABLE `category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`category_id`),
  KEY `fk_category` (`parent_id`),
  CONSTRAINT `fk_category` FOREIGN KEY (`parent_id`) REFERENCES `category` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*
-- Query: SELECT * FROM edudb.category
LIMIT 0, 1000

-- Date: 2025-09-15 16:09
*/
INSERT INTO `category` (`category_id`,`name`,`parent_id`) VALUES (1,'AI/코딩',NULL);
INSERT INTO `category` (`category_id`,`name`,`parent_id`) VALUES (2,'요리/취미',NULL);
INSERT INTO `category` (`category_id`,`name`,`parent_id`) VALUES (3,'운동/건강',NULL);
INSERT INTO `category` (`category_id`,`name`,`parent_id`) VALUES (4,'언어 교육',NULL);
INSERT INTO `category` (`category_id`,`name`,`parent_id`) VALUES (5,'초등 교육',NULL);
INSERT INTO `category` (`category_id`,`name`,`parent_id`) VALUES (6,'중학 교육',NULL);
INSERT INTO `category` (`category_id`,`name`,`parent_id`) VALUES (7,'고등 교육',NULL);
INSERT INTO `category` (`category_id`,`name`,`parent_id`) VALUES (8,'HTML',1);
INSERT INTO `category` (`category_id`,`name`,`parent_id`) VALUES (9,'CSS',1);
INSERT INTO `category` (`category_id`,`name`,`parent_id`) VALUES (10,'JAVASCRIPT',1);
INSERT INTO `category` (`category_id`,`name`,`parent_id`) VALUES (11,'SWIFT',1);
INSERT INTO `category` (`category_id`,`name`,`parent_id`) VALUES (12,'OBJECTIVE-C',1);
INSERT INTO `category` (`category_id`,`name`,`parent_id`) VALUES (13,'KOTLIN',1);
INSERT INTO `category` (`category_id`,`name`,`parent_id`) VALUES (14,'PYTHON',1);
INSERT INTO `category` (`category_id`,`name`,`parent_id`) VALUES (15,'한식',2);
INSERT INTO `category` (`category_id`,`name`,`parent_id`) VALUES (16,'중식',2);
INSERT INTO `category` (`category_id`,`name`,`parent_id`) VALUES (17,'일식',2);
INSERT INTO `category` (`category_id`,`name`,`parent_id`) VALUES (18,'양식',2);
INSERT INTO `category` (`category_id`,`name`,`parent_id`) VALUES (19,'베이킹',2);
INSERT INTO `category` (`category_id`,`name`,`parent_id`) VALUES (20,'공예',2);
INSERT INTO `category` (`category_id`,`name`,`parent_id`) VALUES (21,'자수/뜨게',2);
INSERT INTO `category` (`category_id`,`name`,`parent_id`) VALUES (22,'헬스/피트니스',3);
INSERT INTO `category` (`category_id`,`name`,`parent_id`) VALUES (23,'헬스케어',3);
INSERT INTO `category` (`category_id`,`name`,`parent_id`) VALUES (24,'요가',3);
INSERT INTO `category` (`category_id`,`name`,`parent_id`) VALUES (25,'건강식',3);
INSERT INTO `category` (`category_id`,`name`,`parent_id`) VALUES (26,'필라테스',3);
INSERT INTO `category` (`category_id`,`name`,`parent_id`) VALUES (27,'복싱',3);
INSERT INTO `category` (`category_id`,`name`,`parent_id`) VALUES (28,'홈트레이닝',3);
INSERT INTO `category` (`category_id`,`name`,`parent_id`) VALUES (29,'영어',4);
INSERT INTO `category` (`category_id`,`name`,`parent_id`) VALUES (30,'일본어',4);
INSERT INTO `category` (`category_id`,`name`,`parent_id`) VALUES (31,'중국어',4);
INSERT INTO `category` (`category_id`,`name`,`parent_id`) VALUES (32,'스페인어',4);
INSERT INTO `category` (`category_id`,`name`,`parent_id`) VALUES (33,'독일어',4);
INSERT INTO `category` (`category_id`,`name`,`parent_id`) VALUES (34,'한국어',4);
INSERT INTO `category` (`category_id`,`name`,`parent_id`) VALUES (35,'러시아어',4);
INSERT INTO `category` (`category_id`,`name`,`parent_id`) VALUES (36,'국어',5);
INSERT INTO `category` (`category_id`,`name`,`parent_id`) VALUES (37,'영어',5);
INSERT INTO `category` (`category_id`,`name`,`parent_id`) VALUES (38,'수학',5);
INSERT INTO `category` (`category_id`,`name`,`parent_id`) VALUES (39,'과학',5);
INSERT INTO `category` (`category_id`,`name`,`parent_id`) VALUES (40,'서브5',5);
INSERT INTO `category` (`category_id`,`name`,`parent_id`) VALUES (41,'서브6',5);
INSERT INTO `category` (`category_id`,`name`,`parent_id`) VALUES (42,'서브7',5);
INSERT INTO `category` (`category_id`,`name`,`parent_id`) VALUES (43,'국어',6);
INSERT INTO `category` (`category_id`,`name`,`parent_id`) VALUES (44,'영어',6);
INSERT INTO `category` (`category_id`,`name`,`parent_id`) VALUES (45,'수학',6);
INSERT INTO `category` (`category_id`,`name`,`parent_id`) VALUES (46,'과학',6);
INSERT INTO `category` (`category_id`,`name`,`parent_id`) VALUES (47,'서브5',6);
INSERT INTO `category` (`category_id`,`name`,`parent_id`) VALUES (48,'서브6',6);
INSERT INTO `category` (`category_id`,`name`,`parent_id`) VALUES (49,'서브7',6);
INSERT INTO `category` (`category_id`,`name`,`parent_id`) VALUES (50,'국어',7);
INSERT INTO `category` (`category_id`,`name`,`parent_id`) VALUES (51,'영어',7);
INSERT INTO `category` (`category_id`,`name`,`parent_id`) VALUES (52,'수학',7);
INSERT INTO `category` (`category_id`,`name`,`parent_id`) VALUES (53,'과학',7);
INSERT INTO `category` (`category_id`,`name`,`parent_id`) VALUES (54,'사회',7);
INSERT INTO `category` (`category_id`,`name`,`parent_id`) VALUES (55,'한국사',7);
INSERT INTO `category` (`category_id`,`name`,`parent_id`) VALUES (56,'서브7',7);
INSERT INTO `category` (`category_id`,`name`,`parent_id`) VALUES (57,'공지사항',NULL);
