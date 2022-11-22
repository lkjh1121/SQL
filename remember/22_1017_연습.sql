-- 테이블 명 : score 
USE mydb;
DROP TABLE score;
CREATE TABLE score (
							id BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
							name VARCHAR(40),
							kor INT,
							eng INT,
							mat INT,
							wdate DATETIME);
SELECT * FROM score;

INSERT INTO score (name, kor, eng, mat, wdate)VALUES('홍길동', '80', '90', '90', NOW());
INSERT INTO score (name, kor, eng, mat, wdate)VALUES('길동이', '60', '80', '30', NOW());
INSERT INTO score (name, kor, eng, mat, wdate)VALUES('킴지민', '70', '50', '50', NOW());
INSERT INTO score (name, kor, eng, mat, wdate)VALUES('강지원', '40', '30', '96', NOW());
INSERT INTO score (name, kor, eng, mat, wdate)VALUES('이미진', '70', '50', '70', NOW());
INSERT INTO score (name, kor, eng, mat, wdate)VALUES('김상희', '50', '70', '98', NOW());
INSERT INTO score (name, kor, eng, mat, wdate)VALUES('남미연', '90', '50', '50', NOW());


select name, kor, eng, mat, 
                    (kor+eng+mat) total,
                    (kor+eng+mat)/3.0 avg,
                    DATE_format(wdate, '%Y-%m-%d') wdate 
        from score