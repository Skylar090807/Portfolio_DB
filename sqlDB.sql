/* DDL : create, alter, drop
   DML : select, insert, delete, update
   DCL : revoke, deny, commit, rollback,...
*/

-- [Navigator]에서 오른쪽 마우스 Refresh All

DROP DATABASE IF EXISTS sqldb; -- 만약 sqldb가 존재하면 우선 삭제한다.
CREATE DATABASE sqldb;

USE sqldb;
CREATE TABLE usertbl -- 회원 테이블
( userID  	CHAR(8) NOT NULL PRIMARY KEY, -- 사용자 아이디(PK)
  name    	VARCHAR(10) NOT NULL, -- 이름
  birthYear   INT NOT NULL,  -- 출생년도
  addr	  	CHAR(2) NOT NULL, -- 지역(경기,서울,경남 식으로 2글자만입력)
  mobile1	CHAR(3), -- 휴대폰의 국번(011, 016, 017, 018, 019, 010 등)
  mobile2	CHAR(8), -- 휴대폰의 나머지 전화번호(하이픈제외)
  height    	SMALLINT,  -- 키
  mDate    	DATE  -- 회원 가입일
);
CREATE TABLE buytbl -- 회원 구매 테이블(Buy Table의 약자)
(  num 		INT AUTO_INCREMENT NOT NULL PRIMARY KEY, -- 순번(PK)
   userID  	CHAR(8) NOT NULL, -- 아이디(FK)
   prodName 	CHAR(6) NOT NULL, --  물품명
   groupName 	CHAR(4)  , -- 분류
   price     	INT  NOT NULL, -- 단가
   amount    	SMALLINT  NOT NULL, -- 수량
   FOREIGN KEY (userID) REFERENCES usertbl(userID) 
   -- 외래키(외부 데이터 참조 사용값)
);

INSERT INTO usertbl VALUES('LSG', '이승기', 1987, '서울', '011', '1111111', 182, '2008-8-8');
INSERT INTO usertbl VALUES('KBS', '김범수', 1979, '경남', '011', '2222222', 173, '2012-4-4');
INSERT INTO usertbl VALUES('KKH', '김경호', 1971, '전남', '019', '3333333', 177, '2007-7-7');
INSERT INTO usertbl VALUES('JYP', '조용필', 1950, '경기', '011', '4444444', 166, '2009-4-4');
INSERT INTO usertbl VALUES('SSK', '성시경', 1979, '서울', NULL  , NULL      , 186, '2013-12-12');
INSERT INTO usertbl VALUES('LJB', '임재범', 1963, '서울', '016', '6666666', 182, '2009-9-9');
INSERT INTO usertbl VALUES('YJS', '윤종신', 1969, '경남', NULL  , NULL      , 170, '2005-5-5');
INSERT INTO usertbl VALUES('EJW', '은지원', 1972, '경북', '011', '8888888', 174, '2014-3-3');
INSERT INTO usertbl VALUES('JKW', '조관우', 1965, '경기', '018', '9999999', 172, '2010-10-10');
INSERT INTO usertbl VALUES('BBK', '바비킴', 1973, '서울', '010', '0000000', 176, '2013-5-5');

INSERT INTO buytbl VALUES(NULL, 'KBS', '운동화', NULL   , 30,   2);
INSERT INTO buytbl VALUES(NULL, 'KBS', '노트북', '전자', 1000, 1);
INSERT INTO buytbl VALUES(NULL, 'JYP', '모니터', '전자', 200,  1);
INSERT INTO buytbl VALUES(NULL, 'BBK', '모니터', '전자', 200,  5);
INSERT INTO buytbl VALUES(NULL, 'KBS', '청바지', '의류', 50,   3);
INSERT INTO buytbl VALUES(NULL, 'BBK', '메모리', '전자', 80,  10);
INSERT INTO buytbl VALUES(NULL, 'SSK', '책'    , '서적', 15,   5);
INSERT INTO buytbl VALUES(NULL, 'EJW', '책'    , '서적', 15,   2);
INSERT INTO buytbl VALUES(NULL, 'EJW', '청바지', '의류', 50,   1);
INSERT INTO buytbl VALUES(NULL, 'BBK', '운동화', NULL   , 30,   2);
INSERT INTO buytbl VALUES(NULL, 'EJW', '책'    , '서적', 15,   1);
INSERT INTO buytbl VALUES(NULL, 'BBK', '운동화', NULL   , 30,   2);

SELECT * FROM usertbl;
SELECT * FROM buytbl;

/* DDL : create, alter, drop
   DML : select, insert, delete, update
   DCL : revoke, deny, commit, rollback,...
*/

-- 1. usertbl의  name, addr, mdate를 출력.
select  name, addr, mdate from usertbl; 

-- 2.usertbl의  가입일 mdate가 2010년 이후 가입한 사람의 name, addr, mdate를 출력.
select name, addr, mdate from usertbl where mdate >= 2010-01-01;

-- 3.name에 대한 내림차 순 출력.
select name, addr, mdate from usertbl where mdate >= 2010-01-01 order by name desc;

-- 4. usertbl의 가입일 mdate가 2010이상 2013년 이하 가입한 사람의 name, addr, mdate를 name에 대한 내림차 순으로 출력 2가지.

select name, addr, mdate from usertbl where mdate between '2010-01-01' and '2013-12-31' order by name desc;
select name, addr, mdate from usertbl where mdate >= '2010-01-01' and mdate <= '2013-12-31' order by name desc;

select name, addr, mdate from usertbl where mdate>=20100101 and mdate <= 20131231 order by name desc;
select name, addr, mdate from usertbl where mdate between 20100101 and 20131231 order by name desc;

-- 5. usertbl에서 주소가 경남, 전남, 경북 중 하나에 속하는 사람의 name, addr을 출력.
select name, addr from usertbl where addr in ('경남','전남','경북');
select name, addr from usertbl where addr = '경남' or addr = '전남' or addr = '경북';

-- <조건이 다수일 경우 관계 연산자 사용>

-- 6.문자열의 내용 검색 : LIKE 사용 (문자뒤에 % - 무엇이든 허용, 한 글자와 매치 '_'(언더 바) 사용)
select name, height from usertbl where name like '김%';
select name, height from usertbl where name like '김_수';

-- 7. 이름이 김경호인 사람의 키를 출력.
select height from usertbl where name = '김경호';

-- 8. 키가 김경호보다 큰 사람의 이름과 키를 출력.
select name, height from usertbl where height > 177;
-- 8. 서브 쿼리로 출력. 서브쿼리의 결과가 둘 이상이 되면 에러 발생.
select name, height from usertbl where height > (select height from usertbl where name = '김경호');

-- 서브 쿼리 결과 둘 이상 에러 예제. 8. 서울에사는 사람 중 키가 큰 사람들 출력.
select name, height from usertbl where height > (select height from usertbl where addr = '서울');
select height from usertbl where addr = '서울'; -- 결과가 네 개이므로 서브쿼리로 사용하면 에러.

-- any (서브쿼리) 여러 개 결과 값 중 하나라도 만족하면 출력.
select name, height from usertbl where height = any(select height from usertbl where addr = '서울');

-- all (서브쿼리) 여러 개 결과 값이 모두 만족하면 출력. 서울에 사는 사람보다 키가 큰 사람 출력.
select name, height from usertbl where height > all(select height from usertbl where addr = '서울');

-- <원하는 순서대로 정렬하여 출력 : ORDER BY> asc는 디폴트 값으로 생략 가능.
-- 10. 키가 큰 순서로 이름과 키를 출력하되, 같은 키이면 이름에 대해 가나다라 오름차 순으로 출력.
select name, height from usertbl order by height desc, name;  

-- <group by>
-- buytbl 대해 작업 수행
select * from buytbl; 
select userID, sum(amount) from buytbl group by userID;
-- AS(alias)별칭 사용
select userID as '아이디', sum(amount) as '총 구매 수량' from buytbl group by userID;
-- with rollup 총합 또는 중간 합계가 필요한 경우
select num, groupname, sum(price*amount) as '비용' from buytbl group by groupname with rollup;
select userID, groupname, sum(price*amount) as '비용' from buytbl group by groupname, userID with rollup;
-- HAVING WHERE와 비슷한 개념으로 조건 제한하는 것이지만, 집계 함수에 대해서 조건을 제한하는 것. HAVING절은 꼭 GROUP BY절 다음에 나와야 함(순서 바뀌면 안됨)
select userID, groupname, sum(price*amount) as '비용' from buytbl group by groupname, userID 
having groupname = '전자' or groupname = '의류';

-- <insert into>
insert into buytbl (userID, prodName, groupName, price, amount) -- 열 5개
select userID, prodName, groupName, price, amount from buytbl;  -- 열 5개 수가 같아야 한다.

select * from buytbl;

-- <update set>
update buytbl
set groupName = '신발'
where prodName = '운동화';
-- MySQL의 update, delete 명령 사용 시 주의 사항
-- Edit 메뉴의 Preference - SQL Editor Safe mode 체크 없애고, 화면 상단 오른쪽 Reconnect to DBSM
select * from buytbl;

-- 11. userID가 KBS 또는 BBK인 사람의 prodName을 스마트폰 으로 수정하고, groupname을 모바일로 수정하라.
update buytbl
set prodName = '스마트폰', groupname= '모바일'
where userID = 'BBK' or userID = 'KBS';
update buytbl set prodname='스마트폰', groupname='모바일' where userid in ('KBS', 'BBK');

select userID, groupName, prodName from buytbl where userid in ('KBS', 'BBK');

-- 12. userID가 bbk인 데이터를 삭제하시오.
Delete from buytbl where userID = 'BBK'; 

select * from buytbl where userID = 'BBK';

-- 13. buytbl에서 price가 200 이상인 전자, 모바일 그룹에 속한 데이터를 삭제.
delete from buytbl  where price >= 200 and (groupName = '전자' or groupName = '모바일');

select * from buytbl;

-- buytbl 레코드(튜플) 전부 삭제.
delete from buytbl;
-- buytbl 필드 삭제. buytbl 자체가 삭제 됨.
drop table buytbl;











