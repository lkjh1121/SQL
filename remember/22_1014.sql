-- join 연산 :  테이블의 각각의 데이터가 있으니까
--              묶어서 하나의 테이블로 내보내려고 한다
-- inner join, outer join, full join
-- 쿼리도 ANSI(미국협회)  표준
/*
  select empno, ename, A.deptno, dname
  from emp A     -- 테이블에 새로운 이름을 주면 속도가 빠르다
  inner join dept B   on A.deptno=B.deptno
*/
​
select empno, ename, A.deptno, dname
from emp A     -- 테이블에 새로운 이름을 주면 속도가 빠르다
inner join dept B   on A.deptno=B.deptno;
​
select empno, ename, A.deptno, dname
from dept A     -- 테이블에 새로운 이름을 주면 속도가 빠르다
inner join emp B   on A.deptno=B.deptno;
​
-- 부서번호 할당 못받은 애들은 직원도 아님, 안나오고 있음
-- outer join (left outer , right outer join)
-- left outer join from 절에 보다 가까운 애가 왼쪽임
-- 이 데이터는 무조건 다 출력
-- right outer join from 절에 조금이라도 더 먼애가 오른쪽임
-- 이 데이터는 무조건 다 출력
​
select empno, ename, A.deptno, dname
FROM emp A     -- 테이블에 새로운 이름을 주면 속도가 빠르다
LEFT outer join dept B   on A.deptno=B.deptno;
​
INSERT INTO dept(deptno, dname, loc) VALUES(50, '개발1부', '서울');
​
select empno, ename, A.deptno, dname
FROM emp A    
right outer join dept B   on A.deptno=B.deptno;
​
USE product; -- db 바꿈
​
SELECT customername,
      concat(B.firstName, " ", B.lastName) employeeName  
FROM customers A
LEFT OUTER JOIN employees B
ON A.salesRepEmployeeNumber=B.employeeNumber;
​
-- employee 테이블의 officecode필드가 offices테이블과 연동되어 있다
-- 직원이름, 근무지(city, country, state)
​
SELECT concat(A.firstName, " ", A.lastName) name,
      B.city,
      B.country,
      B.state
FROM employees A
LEFT OUTER JOIN offices B
ON A.officeCode=B.officeCode;
-- 미국에 근무하는 직원이 담당하는 고객명단
SELECT A.customerName,
      concat(B.firstName, " ", B.lastName) employName
FROM customers A
LEFT OUTER JOIN employees B
ON A.salesRepEmployeeNumber=B.employeeNumber
LEFT OUTER JOIN offices C
ON B.officeCode = C.officeCode
WHERE C.country = 'usa';
-- join 연산이 데이터 중복성을 없애준다.
-- 조건 연산 null값에 대한 처리가 예외가 있어서
​
USE mydb;
​
SELECT * FROM emp;
​
-- job 이 null인것을 찾아보자
SELECT * FROM emp where job = NULL;  -- 안된다.
​
-- null : 정의할 수 없는값
SELECT * FROM emp where job IS NULL;
​
-- null 이 아니다. is not null
SELECT * FROM emp where job IS not NULL;
​
-- 연산수행시 연산이 안된다.
-- sal + comm : comm 이 null값이면 연산의 결과도 null이다
SELECT empno, ename, sal+comm FROM emp;
​
-- nvl(필드명, 값1) : 필드의 값이 null 이면 값1을 반환
-- 필드의 값이 null 이 아니면 원래 필드값을 반환한다
​
SELECT nvl(comm, 0) FROM emp; -- comm필드의 값이 null인건 전부 0으로
​
SELECT empno, ename, nvl(sal,0)+nvl(comm, 0) sal FROM emp;
​
USE product;
​
-- 고객주문 (orders)필드, 고객이름
SELECT A.orderNumber, A.orderDate, A.requiredDate,
      A.shippedDate, A.status, A.comments,
      B.customerName
FROM orders A
LEFT OUTER JOIN customers B
ON A.customerNumber=B.customerNumber;
-- 위의 정보에  계약 담당 직원 이름,
-- 근무하는 나라 정보
​
-- 두개 이상의 테이블로 부터 원하는 필드들만 특정 조건으로 묶인
-- 데이터를 가져오는걸 join이라 한다
​
-- 결합조건을 명시하지 않으면 catasian 결합
-- orders테이블에 데이터 m건, customers 테이블이 데이터가 n건
-- m * n 건 출력
SELECT A.orderNumber, A.orderDate, A.requiredDate,
      A.shippedDate, A.status, A.comments,
      B.customerName
FROM orders A, customers B;
​
-- 특정 직원이 받은 주문 정보를 가져오고 싶다.
-- lastName이 Patterson 인 사람이 받은 주문과
-- 고객정보가 필요하다
-- orders, customers, employees
-- 주문의 선적일
​
SELECT A.lastName, B.customerName, C.orderNumber, C.shippedDate
FROM employees A
LEFT outer JOIN customers B ON A.employeeNumber=B.salesRepEmployeeNumber
LEFT OUTER JOIN orders C  ON B.customerNumber=C.customerNumber
WHERE A.lastName='Patterson' AND B.customername IS NOT null;
​
​
-- productLine 이 classic 인 제품 주문내역을 확인
-- products 테이블과 orders, ordersdetail
-- orders orderdetails ordernumber로결합
-- ordersedetail products 테이블이 productcode로 결합
-- 주문정보, 선적일, 제품코드, 제품명, 단가, 가격
​
SELECT A.ordernumber, A.shippeddate, C.productcode,
      C.productName, B.quantityOrdered, B.priceEach  
FROM orders A
LEFT OUTER JOIN orderdetails B ON A.orderNumber=B.orderNumber
LEFT OUTER JOIN products C ON B.productCode=C.productCode
WHERE C.productLine like 'classic%';
​
/*
서브쿼리 : 쿼리 안에 또다른 쿼리를 작성할 수 있다.
서브쿼리는 select  절, from 절, where절에 각각 사용할 수 있다
select 절에 올때는 결과값이 null또는 한개의 데이터만
가져와야 한다. 2개의 데이터가 오는 서브쿼리는 사용불가
from 절에 올때는 인라인 뷰의 역