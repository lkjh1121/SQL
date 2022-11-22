#날짜:	2022/01/13
#이름: 김재현
#내용: 5.SQL 연습문제

#문제1. 다음과 같은 속성을 가진 Book 테이블을 생성 후 그림과 같이 데이터를 삽입하시오.
CREATE TABLE `Book` (
	`bookid`    INT PRIMARY KEY,
	`bookname`  VARCHAR(20),
	`publisher` VARCHAR(20),
	`price`     INT
);

INSERT INTO `Book` VALUES (1, '축구의 역사',        '굿스포츠',   7000);
INSERT INTO `Book` VALUES (2, '축구아는 여자',      '나무수',     13000);
INSERT INTO `Book` VALUES (3, '축구의 이해',        '대한미디어', 22000);
INSERT INTO `Book` VALUES (4, '골프 바이블',        '대한미디어', 35000);
INSERT INTO `Book` VALUES (5, '피겨 교본',          '굿스포츠',   8000);
INSERT INTO `Book` VALUES (6, '역도 단계별기술',    '굿스포츠',   6000);
INSERT INTO `Book` VALUES (7, '야구의 추억',        '이상미디어', 20000);
INSERT INTO `Book` VALUES (8, '야구를 부탁해',      '이상미디어', 13000);
INSERT INTO `Book` VALUES (9, '올림픽 이야기',      '삼성당',     7500);
INSERT INTO `Book` VALUES (10, 'Olympic Champions', 'Pearson',    13000);

#문제2. 다음과 같은 속성을 가진 Customer 테이블을 생성 후 그림과 같이 데이터를 삽입하시오.
CREATE TABLE `Customer`(
	`custid` INT AUTO_INCREMENT PRIMARY KEY,
	`name` VARCHAR(5),
	`address` VARCHAR(20),
	`phone` VARCHAR(30)
);

INSERT INTO `Customer`(`name`,`address`,`phone`) VALUES ('박지성', '영국 맨체스타',   '000-5000-0001');
INSERT INTO `Customer`(`name`,`address`,`phone`) VALUES ('김연아', '대한민국 서울',   '000-6000-0001');
INSERT INTO `Customer`(`name`,`address`,`phone`) VALUES ('장미란', '대한민국 강원도', '000-7000-0001');
INSERT INTO `Customer`(`name`,`address`,`phone`) VALUES ('추신수', '미국 클리블랜드', '000-8000-0001');
INSERT INTO `Customer`(`name`,`address`) VALUES ('박세리', '대한민국 대전');

#문제3. 다음과 같은 속성을 가진 Orders 테이블을 생성 후 그림과 같이 데이터를 삽입하시오.
CREATE TABLE `Orders`(
	`orderid` INT AUTO_INCREMENT PRIMARY KEY,
	`custid`	INT,
	`bookid` INT,
	`saleprice` INT,
	`orderdate` DATE
);

INSERT INTO `Orders`(`custid`,`bookid`,`saleprice`,`orderdate`) VALUES (1, 1,6000,'2014-07-01');
INSERT INTO `Orders`(`custid`,`bookid`,`saleprice`,`orderdate`) VALUES (1, 3,21000,'2014-07-03');
INSERT INTO `Orders`(`custid`,`bookid`,`saleprice`,`orderdate`) VALUES (2, 5,8000,'2014-07-03');
INSERT INTO `Orders`(`custid`,`bookid`,`saleprice`,`orderdate`) VALUES (3, 6,6000,'2014-07-04');
INSERT INTO `Orders`(`custid`,`bookid`,`saleprice`,`orderdate`) VALUES (4, 7,20000,'2014-07-05');
INSERT INTO `Orders`(`custid`,`bookid`,`saleprice`,`orderdate`) VALUES (1, 2,12000,'2014-07-07');
INSERT INTO `Orders`(`custid`,`bookid`,`saleprice`,`orderdate`) VALUES (4, 8,13000,'2014-07-07');
INSERT INTO `Orders`(`custid`,`bookid`,`saleprice`,`orderdate`) VALUES (3,10,12000,'2014-07-08');
INSERT INTO `Orders`(`custid`,`bookid`,`saleprice`,`orderdate`) VALUES (2,10,7000,'2014-07-09');
INSERT INTO `Orders`(`custid`,`bookid`,`saleprice`,`orderdate`) VALUES (3, 8,13000,'2014-07-10');

#문제4. 모든 회원의 회원번호, 이름, 주소를 조회하시오.
SELECT `custid`, `name`, `address` FROM `Customer`;

#문제5. 모든 도서의 이름과 가격을 검색하시오.
SELECT `bookname`, `price` FROM `Book`;

#문제6. 모든 도서의 가격과 이름을 검색하시오.
SELECT `price`, `bookname` FROM `Book`;

#문제7. 모든 도서의 도서번호, 도서이름, 출판사, 가격을 조회하시오.
SELECT * FROM `Book`;

#문제8. 도서 테이블에 있는 모든 출판사를 조회하시오.
SELECT `publisher` FROM `Book`;


#문제9. 도서 테이블에 있는 모든 출판사를 조회하시오. 단 조회 결과에서 중복을 제거하시오.
SELECT DISTINCT `publisher` FROM `Book`;

#문제10. 가격이 20,000원 이상인 도서를 조회하시오.
SELECT * FROM `Book` WHERE `price` >= 20000;

#문제11. 가격이 20,000원 미만인 도서를 조회하시오.
SELECT * FROM `Book` WHERE `price` < 20000;

#문제12. 가격이 10,000원 이상 20,000 이하인 도서를 조회하시오.
SELECT * FROM `Book` WHERE `price` >= 10000 AND `price` <= 20000;
SELECT * FROM `Book` WHERE `price` BETWEEN 10000 AND 20000;

#문제13. 가격이 15,000원 이상 30,000 이하인 도서의 도서번호, 도서명, 도서가격을 조회하시오.
SELECT `bookid`, `bookname`, `price` FROM `Book` WHERE `price` >= 15000 AND `price` <= 30000;

#문제14. 도서번호가 2, 3, 5인 도서를 조회하시오.
SELECT * FROM `Book` WHERE `bookid`=2 OR `bookid`=3 OR `bookid`=5;
SELECT * FROM `Book` WHERE `bookid` IN(2, 3, 5);

#문제15. 도서번호가 짝수번호인 도서를 조회하시오.
SELECT * FROM `Book` WHERE `bookid` % 2 = 0;

#문제16. 박씨 성 고객을 조회하시오.
SELECT * FROM `Customer` WHERE `name` LIKE '박%'; 

#문제17. 대한민국에 거주하는 고객을 조회하시오.
SELECT * FROM `Customer` WHERE `address` LIKE '%대한민국%'; 

#문제18. 휴대폰 번호가 유효한 고객만 조회하시오.
SELECT * FROM `Customer` WHERE NOT `phone` IS NULL;

#문제19. 출판사가 ‘굿스포츠’ 혹은 ‘대한미디어’인 도서를 조회하시오.
SELECT * FROM `Book` WHERE `publisher` IN('굿스포츠', '대한미디어');
SELECT * FROM `Book` WHERE `publisher`='굿스포츠' OR  `publisher`='대한미디어';

#문제20. ‘축구의 역사’를 출간한 출판사를 조회하시오.
SELECT `publisher` FROM `Book` WHERE `bookname`='축구의 역사';

#문제21. 도서이름에 ‘축구’가 포함된 출판사를 조회하시오.
SELECT `publisher` FROM `Book` WHERE `bookname` LIKE '%축구%';

#문제22. 도서이름의 왼쪽 두 번째 위치에 ‘구’라는 문자열을 갖는 도서를 조회하시오.
SELECT * FROM `Book` WHERE `bookname` LIKE '_구%';

#문제23. 축구에 관한 도서 중 가격이 20,000원 이상인 도서를 조회하시오.
SELECT * FROM `Book` WHERE `bookname` LIKE '%축구%' AND `price` >= 20000;

#문제24. 도서를 이름순으로 조회하시오.
SELECT * FROM `Book` ORDER BY `bookname`;

#문제25. 도서를 가격순으로 조회하고, 가격이 같으면 이름순으로 조회하시오.
SELECT * FROM `Book` ORDER BY `price` ASC, `bookname` ASC;

#문제26. 도서를 가격의 내림차순으로 조회하시오. 단 가격이 같다면 출판사를 오름차순으로 조회할 것
SELECT * FROM `Book` ORDER BY `price` DESC, `publisher` ASC;

#문제27. 도서가격이 큰 1, 2, 3위 도서를 조회하시오.
SELECT * FROM `Book` ORDER BY `price` DESC LIMIT 3;

#문제28. 도서가격이 작은 1, 2, 3위 도서를 조회하시오.
SELECT * FROM `Book` ORDER BY `price` ASC LIMIT 3;

#문제29. 도서를 주문하지 않은 고객의 이름을 조회하시오.
SELECT `name` FROM `Customer` WHERE `name` NOT IN(SELECT `name` FROM `Customer` WHERE `custid` IN(SELECT `custid` FROM `Orders`));

#문제30. 고객이 주문한 도서의 총 판매액을 구하시오.
SELECT SUM(`saleprice`) AS `총판매액` FROM `Orders`;

#문제31. 2번 김연아 고객이 주문한 도서의 총 판매액을 구하시오. ***** 다시 할것 ****
SELECT SUM(`saleprice`) AS `총판매액` FROM `Orders` WHERE `custid`=2;

#문제32. 고객이 주문한 도서의 총 판매액, 평균값, 최저가, 최고가를 구하시오.
SELECT 
	SUM(`saleprice`) AS `총판매액`,
	AVG(`saleprice`) AS `평균값`,
	MIN(`saleprice`) AS `최저가`,
	MAX(`saleprice`) AS `최고가`
FROM 
	`Orders`;

#문제33. 도서 판매 건수를 구하시오.
SELECT COUNT(*) AS `판매건수` FROM `Orders`;


#문제34. 도서제목에 야구가 포함된 도서를 농구로 변경한 후 도서 목록을 보이시오.
SELECT `bookid`, REPLACE(`bookname`, '야구', '농구') AS `bookname`, `publisher`, `price` FROM `Book`;

#문제35. 가격이 8,000원 이상인 도서를 구매한 고객에 대하여 고객별 주문도서의 총 수량을 구하시오. 
#        단, 두 권 이상 구매한 고객만 구한다.
SELECT `custid`, COUNT(*) AS `수량` FROM `Orders` 
WHERE `saleprice` >= 8000
GROUP BY `custid`
HAVING `수량` >= 2;

#문제36. 고객과 고객의 주문에 관한 데이터를 모두 보이시오.
SELECT * FROM `Customer` AS a JOIN `Orders` AS b ON a.custid = b.custid;
SELECT * FROM `Customer` JOIN `Orders` USING(`custid`);
SELECT * FROM `Customer`, `Orders` WHERE `Customer`.custid = `Orders`.custid;

#문제37. 고객과 고객의 주문에 관한 데이터를 고객번호 순으로 정렬하여 보이시오.
SELECT * FROM `Customer` AS a 
	JOIN `Orders` AS b ON a.custid = b.custid
		ORDER BY a.`custid`;
	
#문제38. 고객의 이름과 고객이 주문한 도서의 판매가격을 조회하시오.
SELECT `name`, `saleprice` FROM `Customer` AS a 
	JOIN `Orders` AS b ON a.custid = b.custid;


#문제39. 고객별로 주문한 모든 도서의 총 판매액을 구하고, 고객별로 정렬하시오.
SELECT `name`, SUM(`saleprice`) FROM `Customer` AS a 
	JOIN `Orders` AS b ON a.custid = b.custid
		GROUP BY a.`custid`
			ORDER BY a.`name` ASC;

#문제40. 고객의 이름과 고객이 주문한 도서의 이름을 조회하시오.
SELECT `name`, `bookname` FROM `Book` AS a
JOIN `Orders` AS b ON a.bookid = b.bookid
JOIN `Customer` AS c ON b.custid = c.custid;

#문제41. 가격이 20,000원인 도서를 주문한 고객의 이름과 도서의 이름을 조회하시오.
SELECT `name`, `bookname` FROM `Book` AS a
JOIN `Orders` AS b ON a.bookid = b.bookid
JOIN `Customer` AS c ON b.custid = c.custid
WHERE `price`=20000;


#문제42. 도서를 구매하지 않은 고객을 포함하여 고객의 이름과 고객이 주문한 도서의 판매가격을 구하시오.
SELECT `name`, `saleprice` FROM `Orders` AS a
RIGHT JOIN `Customer` AS b ON a.custid = b.custid;

#문제43. 가장 비싼 도서의 이름을 조회하시오.
SELECT `bookname` FROM `Book` WHERE `price` = (SELECT MAX(`price`) FROM `Book`);

#문제44. Book 테이블에 새로운 도서 ‘스포츠 의학’을 삽입하시오. 스포츠 의학은 한솔의학서적에서 출간했으며 가격은 90,000원이다.
INSERT INTO `Book`(`bookid`, `bookname`,`publisher`) VALUES(11, '스포츠의학','한솔의학서적');

#문제45. Customer 테이블에서 고객번호가 5인 고객의 주소를 ‘대한민국 부산’으로 변경하시오.
UPDATE `Customer` SET `address`='대한민국 부산' WHERE `custid`=5;

#문제46. Customer 테이블에서 고객번호가 5인 고객을 삭제하시오.
DELETE FROM `Customer` WHERE `custid`=5;