CREATE TABLE `Employee` (
		`uid` 	VARCHAR(10) PRIMARY KEY,
		`name` 	VARCHAR(10),
		`gender` TINYINT,
		`hp` 	  	CHAR(13),
		`email` 	VARCHAR(25),
		`pos`	  	VARCHAR(10),
		`dep`		INT,
		`rdate` 	DATETIME
	);
		
		
INSERT INTO `Employee` VALUES ('A101', '김춘추', '1', '010-1234-2222', 'kysin@naver.com', '과장','영업2부', NOW());
INSERT INTO `Employee` VALUES ('A102', '김유신','1', '010-1234-3333', 'kimm@gmail.com', '대리', '인사부' NOW());
		