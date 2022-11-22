/*
 create database mydb (디비명)
 default character set utf8 collate utf8_general_ci;
 데이터베이스는 관리자 계정 또는 관리자 권한을 받은 계정에 대해서만 
 root 계정이 mysql 에서 제공된다.
*/
create database product default character set utf8 collate utf8_general_ci;

-- 데이터베이스 삭제 명령어
DROP DATABASE product;

-- 드래그 하고 ctrl-f9
CREATE DATABASE testdb

-- mydb사용 use mydb; product
-- 계정만들기
-- create user 계정명 identified by '패스워드'
create USER USER02 identified by '1234';

-- mydb에 대한 권한을 user01한테 부여한다productmydbmydb
grant all privileges on product.* to USER01@localhost identified by '1234';product
-- mydb에 대한 권한을 user01한테 회수한다
REVOKE DROP ON *.* FROM studytest@'%';