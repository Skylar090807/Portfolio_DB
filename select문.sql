-- <select문 사용 위해 사용할 데이터베이스 지정>
use sakila; -- DB를 직접 더블클릭하여 선택하는 것도 가능

-- <테이블 이름이 확실하지 않을 때 조회하는 방법>
show databases; -- 현재 서버에 어떤 DB가 있는지 보기
show tables; -- 현재 서버에 어떤 table이 있는지 이름만 간단히 보기
show table status; -- 현재 서버에 있는 table 정보 조회

-- <테이블 열의 이름 확실하지 않을 때 조회하는 방법>
describe city;
desc city; -- [Navigator]로 확인 가능하나 명령어 알아두면 linux 명령어 모드에서 사용 가능


-- <select from where 특정 조건 데이터 조회>
-- select 열 이름
-- from 테이블이름
-- where 조건

-- <선택된 DB가 sakila 라면 다음 두 쿼리는 동일>
select * from sakila.city;
select* from city;

-- <테이블에서 필요한 필드만 가져오기 가능>
select city_id from city;

-- <여러 개의 열을 가져오고 싶을 때 콤마로 구분>
select city_id, city from city; -- 열 이름의 순서는 출력하고 싶은 순서대로 배열 가능

-- <select....from...where의 and와 in() 그리고 like>
-- and와 in() , like


--



