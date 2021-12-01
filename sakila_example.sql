-- 1. sakila 데이터베이스 사용한다.
use sakila;

-- 2. actor 테이블에 있는 모든 내용을 화면에 출력(검색). 
select * from actor;

-- 3. actor 테이블의 first_name, last_name 같이 출력.
select first_name, last_name 
from actor;

-- actor 테이블의 first_name이 JAYNE이면서 actor_id 가 100번 이상인 사람의 모든 정보를 출력.
select * from actor where first_name='JAYNE' and actor_id>=100;

-- actor 테이블의 first_name이 JAYNE 또는 actor_id 가 100번 이상인 사람의 모든 정보를 출력.
select * from actor where first_name='JAYNE' or actor_id>=100;

-- actor 테이블의 first_name이 JAYNE 또는 actor_id 가 100번 이상인 사람의 모든 정보를
-- 출력하고 last_name에 대해 오름차순으로 정렬하시오.
select * from actor where first_name='JAYNE' or actor_id>=100
order by last_name desc; -- asc(ascending: 오름차순, 디폴트 값으로 생략 가능)
                        -- desc(descending: 내림차순, 생략 불가능)

-- BETWEEN … AND 사용. 100이상 150이하 모든 정보 출력.
select * from actor
where actor_id between 100 and 150;

-- 위 내용을 관계 연산자로 나타내고 first_name에 대하여 내림차순 정렬.
select * from actor
where actor_id >= 100 and actor_id <=150
order by first_name desc;





-- 4. address  테이블의 모든 내용을 화면 출력
select * from address;

-- 5. address 테이블의 address, address2, location 화면에 출력.
select address, address2, location from address;

 