CREATE table MEMBER;
USE projecta;
-- 회원테이블
	CREATE TABLE MEMBER(
		id BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
		userid VARCHAR(100) NOT NULL,
		passwd VARCHAR(100) NOT NULL,
		username VARCHAR(100) NOT NULL,
		phone VARCHAR(40) NOT NULL,
		email VARCHAR(40) NOT NULL,
		zipcode CHAR(6),
		address1 VARCHAR(100), -- 기본주소
		address2 VARCHAR(100), -- 상세주소
		state CHAR(1),			  -- 1.가입상태 2.가입인증 3.할중 4.강퇴
		wdate DATETIME,		  -- 가입일
		mdate DATETIME			  -- 정보 수정일
	);
	
	-- 값을 입력할때 auto_increment 속성필드는 값을 못준다.
	
	-- not null 제약조건은 다채워야함
INSERT INTO MEMBER (userid, passswd, username, phone, email, wdate)VALUES('test','1234', '홍길동', '010-0000-0001', 'hyun123@naver.com', NOW());

SELECT * FROM member;
# update 명령
# updaate 테이블명 set 필드명1='값', 필드명2='값2'
# where 조건절 : 조건절이 없으면 전체 데이터가 바뀐다.
# where 조건절 : select 문하고 동일하다.

USE mydb;
SELECT * FROM emp;
UPDATE emp SET job='CLERK', MGR=7782, sal=3400
WHERE empno=8000;

SELECT * FROM member;
# update 명령
# updaate 테이블명 set 필드명1='값', 필드명2='값2'
# where 조건절 : 조건절이 없으면 전체 데이터가 바뀐다.
# where 조건절 : select 문하고 동일하다.


-- 8000번에 hiredate 를 2022-10-17 로 변경하기
UPDATE emp SET job='manager', sal=3700, deptno=20
WHERE empno IN (8001, 8002);
-- 8001번에 8002번에 sal=3700, job='MANAGER, deptno는= 20

SELECT * FROM emp;

-- delete from 테이블 명 where 조건절
DELETE FROM emp WHERE empno=8003;
SELECT * FROM emp;

-- 데이터 전체 삭제
DELETE FROM emp2;

SELECT * FROM emp2;

-- union (행 합치기), 테이블 합치기
-- 테이블이 같을 필요도 없고 필드가 같은 필요도 없음
-- 대신 타입은 일치해야한다. 행=>열, 열=>행으로 바꿀때
-- 또는 여러개의 테이블로부터 해당 데이터를 하벼서 가져와야할때

SELECT empno, ename FROM emp WHERE deptno=10
UNION ALL 
SELECT empno, ename FROM emp WHERE deptno=20;

DROP TABLE test1;

CREATE TABLE test1(
	id BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	YEAR 	 INT,
	MONTH1 INT,
	MONTH2 INT,
	MONTH3 INT,
	MONTH4 INT,
	MONTH5 INT,
	MONTH6 INT
);

INSERT INTO test1(YEAR, MONTH1, MONTH2, MONTH3, MONTH4, MONTH5, MONTH6)VALUE(2022, 25000, 43000, 21000, 39000, 27000, 40000);
SELECT * FROM test1;

SELECT YEAR, MONTH1 FROM test1 WHERE YEAR=2022
UNION ALL
SELECT YEAR, MONTH2 FROM test1 WHERE YEAR=2022
UNION ALL
SELECT YEAR, MONTH3 FROM test1 WHERE YEAR=2022
UNION ALL
SELECT YEAR, MONTH4 FROM test1 WHERE YEAR=2022
UNION ALL
SELECT YEAR, MONTH5 FROM test1 WHERE YEAR=2022
UNION ALL
SELECT YEAR, MONTH6 FROM test1 WHERE YEAR=2022;