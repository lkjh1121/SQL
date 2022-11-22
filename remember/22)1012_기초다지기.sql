-- my SQL 전용 명령어
SHOW TABLES; DESC emp; -- 테이블의 구조emp를 확인한다.

# QUERY 배우기

# emp 텡블의 모든 열과 행을 다 가져와라
SELECT * FROM emp;

# EMPNO, ENAME, SAL 필드만 가져오기
SELECT EMPNO, ENAME, SAL FROM emp;mydb

# 수식을 부여할 수있다. (+,-,*,/, round, sine, cosine ....
-- 수식을 쓸 경우에 수식이 필드명으로 나온다
SELECT empno. ename, sal * 12 FROM emp;

# 새로운 필드명을 부여 할 수 있다.
-- 수식이나 필드명 as 새로운 필드명
SELECT empno, ename, sal * 12 AS yearsal FROM emp;

SELECT empno 사원번호, ename 이름, sal * 12 연봉FROM emp;

# 중간에 공백이 들어갈때 : 직접 데이버베이스에서 보고서 형식으로 뽑고자 할때
SELECT empno 사원번호, ename 이름, sal * 12 연봉FROM emp;

# 검색 쿼리에 조건을 부여하기
-- 다른 dbms와 달리 mysql 은 데이터 대소문자도 무시한다.
SELECT empno, ename, sal, hiredate FROM emp WHERE ename='scott';

SELECT empno, ename, sal, hiredate FROM emp WHERE ename='ford';

# 이름이 scott 인 사람과 ford인 사람
SELECT empno, ename, sal, hiredate WHERE emp ename='ford' OR ename='scott';

SELECT empno FROM emp;

# 문제 1 사원번호가 7566, 7654, 7876, 7844, 7900, 7934인 사람들의 
-- 사원번호, 이름, 입사일자를 출력하는 쿼리 작성하기
SELECT empno, ename, hiredate FROM emp
WHERE empno='7566' OR empno='7654' OR empno='7876' OR empno='7844' OR empno='7900' OR empno='7934';

# in 연산자 where 필드명 in(값1, 값2, 값3,......) 500개쯤
SELECT empno, ename, hiredate FROM emp WHERE empno IN (7566, 7654, 7876, 7844, 7900, 7934);

# 문자열 일 경우
SELECT empno, ename, hiredate FROM emp WHERE ename IN ('scott', 'ford');

# 데이터 검색시 숫자으 경우는 ''(어포스트로피)를 써도 안써도된다.
# 문자는 반드시 써줘야 한다.

SELECT empno, ename, hiredate FROM emp WHERE empno='7566'; -- empno=7566

# 숫자 이외의 타입은 무조건 ''가 있어야 한다.
-- 1981년 10월 3일에 입사한 사람
SELECT * FROM emp WHERE hiredate = '1981-10-03';

-- 1981년에 입사한 사람
SELECT * FROM emp WHERE hiredate >= '1981-10-03' AND hiredate <='1981-12-31';

# 언어라서 함수를 제공한다. 함수가 많다.
-- 문자열을 처리하는 함수 substr, substring
SELECT SUBSTRING("1981-01-01", 1, 4) FROM emp;

# 함수 테스트만 하려면 mysql의 경우 from 절 생략가능(mysql만)
-- 다른 언어 들은 0부터 시작한다 그런데 dbms는 1부터 시작한다.
SELECT SUBSTRING("1981-01-01", 1, 4); # 1번부터 시작해서 4글자만 = 년추출

SELECT SUBSTRING("1981-01-01", 6, 2); # 6번부터 시작해서 2글자만 = 월 추출

SELECT SUBSTRING("1981-01-01", 9, 2); # 9번부터 시작해서 2글자만 = 일 추출

-- 1981년에 입사한 사람
SELECT * FROM emp WHERE substring(hiredate, 1, 4) = '1981';

# emp 테이블의 hiredate 필드를 연도 월 일로 쪼개서 사원번호, 이름, 연도, 월, 일이 나오도록
SELECT empno 사원번호, ename 이름, 
	SUBSTRING(hiredate, 1,4) 연도,
	SUBSTRING(hiredate, 6,2) 월,
	SUBSTRING(hiredate, 9,2) 일
FROM emp;

# 10월에 입사한 사람의 사원번호, 이름
SELECT empno, ename FROM emp WHERE substring(hiredate, 6, 2) = '10';

-- like 검색, ~로 시작하는 , ~를 포함하는, 등호 연산자는 값이 일치할때만 사용가능하다. like 와일드카드
-- 와일드카드 :? (한글자), %(여러글자) s로 시작하는 where ename like 's%'

# 첫글자에 s로 시작하는 데이터를 불러와라
SELECT ename FROM emp WHERE ename LIKE 's%';

# 어떠한 문장이나 중간에 s가 포함 될때 데이터를 불러와라
SELECT ename FROM emp WHERE ename LIKE '%s%';

# 마지막 글자에 d로 끝나는 문장을 가진 데이터를 불러와라
SELECT ename FROM emp WHERE ename LIKE '%d'; # like는 주소값을 가진 데이터를 불러오는것

# INSERT(올리다) INTO(안에) emp (있는 컬럼명) VALUES(행번호, '이름'); 
INSERT INTO emp (empno, ename) VALUES(8000, '홍길동'); # VALUES(행번호, '이름');
INSERT INTO emp (empno, ename) VALUES(8001, '정미홍');
INSERT INTO emp (empno, ename) VALUES(8002, '김홍철');
INSERT INTO emp (empno, ename) VALUES(8003, '홍경래');
INSERT INTO emp (empno, ename) VALUES(8004, '백장미');

SELECT * FROM emp;

#	1. 홍경래랑 백장미 검생 (사원번호, 이름)
	SELECT empno, ename FROM emp WHERE ename="홍경래" OR ename="백장미"
#	2. 성이 홍씨인 사람들
	SELECT empno, ename FROM emp WHERE ename LIKE '홍%';
#	3. 동으로 끝나는 사람들
	SELECT empno, ename FROM emp WHERE ename LIKE '동%';
#	4. 이름에 홍이 들어가는사람들
	SELECT empno, ename FROM emp WHERE ename LIKE '%홍%';

# 급여가 3000 이상인 사람
SELECT * FROM emp WHERE sal >=3000;

# 급여가 3000과 500 사이인 사람
SELECT * FROM emp WHERE sal >=3000 AND sal <=5000;

# oracle과 mariadb 필드명 between low and high
-- 그 값을 포함한다.
SELECT * FROM emp WHERE sal BETWEEN 3000 AND 5000;

# 믄제2. root 계정으로 들어가서
# 2-1 디비명은 prodict로 만든다.
# 2-2 계정은 user02로 만들고 패스워드 1234
# 2-3 product에 대한 모든 권한을 user02한테