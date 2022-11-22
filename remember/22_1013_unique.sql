/*
	unique 제약조건은 데이터가 유일해야 한다(중복안됨) 그러나 NULL값은 허용한다
	
	foreign key(외부키) : 두 테이블 사이에서 발생한다.
	
	데이터의 중복성을 배제하기 위해서 테이블을 나누어서 저장
	부서명을 직접 기술하면 일관성이 꺠진다.
	ex) emp 테이블의 부서코드 dept 테이블: 부서코드, 부서명
		- 행정부 => 행전안전부=> 안전행정부
	
			
	기본정보(부서코드)		부서테이블
	 홍길동 	   A1					A1 : 행정부 => 행정안전부
	
	# 조회할때
	- 두 개의 테이블을 부서코드를 기반으로 합친다.(join연산)
	- O O O 이 한테 부서테이블에 존재하지 않는 부서코드 A1을 넣는다.
	- Tip) 사전에 차단하자. 데이터가 잘못들어가는 걸 막자
	- 부서테이블에서는 A1(외부키 관계) 삭제를 하면 안된다.
	
	- 기본정보 테이블에서 부서테이블을 참조하고 있다. 이 관계를 우리는 외부키 관계에 있다.

*/
USE mydb
SELECT * FROM dept;
SELECT empno, deptno FROM emp;

# 1. emp 테이블의 데이터에 부서번호를 50을 할당하고자 한다

UPDATE emp SET deptno=50 WHERE empno=8000; # 사원번호 8000번인 사람의 부서번호를 50을 할당 한다.
SELECT empno, deptno FROM emp WHERE empno=8000;

-- 현재 상황을 일관성이 깨짐, 무결성이 깨진다고 표현한다.

# 2. dept 테이블의 A1을 삭제하거나 테이블도 삭제한다.
DELETE FROM dept WHERE deptno=10;
SELECT * FROM dept;
DROP TABLE dept;

CREATE TABLE DEPT
       (DEPTNO int(2),
        DNAME nvarchar(14),
        LOC nvarchar(13) );

INSERT INTO DEPT VALUES (10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO DEPT VALUES (20, 'RESEARCH',   'DALLAS');
INSERT INTO DEPT VALUES (30, 'SALES',      'CHICAGO');
INSERT INTO DEPT VALUES (40, 'OPERATIONS', 'BOSTON');

# foreign key 관계에서 중요한 점
-- 참조가 되는 필드가 primary key거나 unique 제약조건이 있어야한다.
-- dept 테이블의 deptno 필드에 primary key를 주어야 한다.

ALTER TABLE dept ADD CONSTRAINT PRIMARY KEY(deptno);

# emp, dept 엮어서 emp 테이블의 deptno 필드가 dept 테이블의 deptno 필드를 참조한다.
ALTER TABLE emp ADD FOREIGN KEY(deptno) REFERENCES dept(deptno); # 포렌 키 지정

-- 값 바꾸고 다시 실행하기
UPDATE emp SET deptno=30 WHERE empno=8000;

DROP TABLE dept;
# 데이터 삭제도 안되고 데이터 삭제도 안됨
# 고객 테이블과 상품테이블 상관관계로 일관성이 있어야하면 중복이 있으면 안된다.
# 고객테이블 : PRIMARY KEY 같은 경우 보통적으로 고객아이디에 지정을 많이 하는편이다
# 상품테이블 : FOREIGN KEY 같은 경우 하나의 명칭에 유니코드를 지정 						 