customerscustomerscustomerscustomersSHOW TABLES;

# 1. customername 에 volvo 가 들어가는 고객들의 customername, contactLastname, contractfirstname, phone, addresslinel
SELECT customerName, contactLastName, contactFirstName, phone, addressLine1
FROM customers
WHERE customerName LIKE 'Volvo%';

# 2. city가 nyc 또는 lyon, singapore인 지역의 고객이름
SELECT customerName, contactLastName, contactFirstName, phone, addressLine1, city
FROM customers
WHERE city IN('nyc', 'lyon');

# 3. country가 usa, poland, sweden, denmark지역 고객들만 
SELECT customerName, contactLastName, contactFirstName, phone, addressLine1, city
FROM customers
WHERE country IN('usa', 'poland', 'sweden', 'denmarl');


# 4. creditlimit가 10만 이상인 고객들 이름과 신용한계
SELECT customerName, creditlimit
FROM customers
WHERE creditlimit>=100000;

# 5. usa에 살면서 신용한계가 50000 이상 10만이하인 고객들 정보
SELECT customerName, creditlimit
FROM customers
WHERE country='USA' AND (creditlimit>=50000 AND creditlimit<=100000);

# 그룹 함수: COUNT, MAX, MIN, SUM, AVERAGE
-- 데이터 전체 개수를 알고 싶다.
--- 해당 필드에 NULL 값이 있으면 건너뛴다.
SELECT COUNT(*) FROM customers;

# 나라별로 고객이 몇명인지 확인 GROUP BY
-- GROUP BY 절에 기술된 필드만 SELECT 절에 기술 할 수 있다.
SELECT COUNTRY, COUNT(*) FROM customers GROUP BY country;

# 그룹함수는 데이터 통 털어서 한개를 내놓는다.
SELECT customername, COUNT(*)
FROM customers;

-- MYSQL만  된다.
# 고객 이름 , 나라, 그 나라의 회원이 몇명인가?
SELECT customername, country, COUNT(*)
FROM customers
GROUP BY country; -- 다른 DBMS는 에러가 발생, 서브쿼리, 조인을 사용한다.
-- MYSQL은 나라의 대표자 한명씩만 나온다.
# 서브쿼리 = 주 쿼리가 아니고 쿼리 안에 또 쿼리가 있다.

# 서브쿼리가 먼저 실행되고 주쿼리가 나중에 실행된다.
SELECT customername, country,
(SELECT COUNT(*) FROM customers B WHERE B.country=A.country) AS cnt
FROM customers A;

# Join
USE mydb;
/*
	# 기존의 파일시스템이 갖고 있는 문제점
	1. 데이터의 일관성이 보장되지 않는다
	2. 데이터의 중복되어 저장되는 문제

	사원의 정보 
	- 기본정보 (이름, 주소, 전번, 가족사항)
	- 인사정보 (근태, 일하는 부서정보, 부서에 대한 정보)
	- 급여정보
	
	# 퇴사를 할 경우에 파일 3개를 다 고쳐야 하는데 실수로 급여정보를 누락일 경우
	# 퇴사했다 표시를 해야 하는데 빠트림, 이 오류체크를 할 방법이 없다.
	- 일관성에 유배된다.

	데이터의 일관성을 보장하고 중복성을 배제한 시스템을 제안
	관계형 데이터베이스 모델
	기본정보 테이블, 인사정보 테이블, 급여정보테이
	- 일관성을 유지하기위한 제약조건을 만든다.
	PRIMARY KEY, FOREIGN KEY라는 제약조건을 만든다.
	
	# PRIMARY KEY(주 키) - 테이블 내의 여러 데이터에 다른 데이터로부터
	- 식별하기위한 유일한 값을 갖는 필드 또는 필드의 조합에 부여할 수 있다.
	- 주민번호, 사원번호 등 입력 실수로 중복된 사람들이 있기 때문에 PRIMARY KEY에 알맞지 않다.
	= 유일해야 하는데 일련번호(1,2,3,4......)를 사용하기도 하고 유일한 값을 갖는 필드에 PRIMARY KEY 제약조건

	장점
	중복된 데이터가 들어가거나 그 필드 null값이 들어가면 에러발생
	이걸 지정해주면 이 필드로 검색할때 엄청 빠르다.
	테이블에 반드시 PRIMARY KEY 를 지정해야 하는건 아니지만 무조건 필드 하나는 정해서 PRIMARY KEY를 주자
	테이블마다 한개만 줄 수 있고 필드가 하나도 가능하지만 여러개의 필드를 조합해서 유일한 값이면
	여러개의 필드를 묶어서 부여 할 수 있다.
	최근에는 자동번호 부여 값에 PRIMARY KEY 지정한다.

	ALTER TABLE 테이블명 ADD CONSTRAINI 프라이머리 키 이름
	PRIMARY KEY(필드명);
*/
# EMPNO 필드에 PRIMARY KEY 를 주는데 만일 데이터가 중복된값이 있거나, Null값이 있으면 안된다.
SELECT * FROM emp;
ALTER TABLE emp ADD CONSTRAINT pk_emp PRIMARY KEY(empno);

# ex) PRIMARY KEY가 지정한후에 중복된 값을 insert하게 되면 에러발생 : Duplocate key 에러메세지 출력된다. 
INSERT INTO emp(empno, ename) VALUES(8000, '김재현');
	