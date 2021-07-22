-- sql SELECT활용
-- 1. table 호출
-- * : 모든컬럼
SELECT * 
FROM sakila.address;
SELECT * 
FROM sakila.city;

-- 2. 데이터의 전체 크기를 보자(데이터의 개수)
SELECT count(*) 
FROM sakila.city;

-- 3. 컬럼을 카운트하여 그 데이터가 몇개인지 확인
SELECT count(city)
FROM sakila.city;
SELECT count(address) 
FROM sakila.address;

-- 4. 결과물로 나오는 컬렴명에 별칭을 부여함
SELECT count(city) 
as newcity 
FROM sakila.city;

-- 5. 상위 데이터 확인
-- limit를 사용하여 최상위 데이터 1개 확인 가능함.
SELECT * 
FROM sakila.city 
limit 1;
-- 맨 마지막 데이터 5개만 가져오기
-- desc를 사용하면 내림차순이 가능
SELECT * FROM sakila.city
order by country_id desc
limit 5;

-- 처음 데이터에서 1번째부터, 5개 확인
SELECT * FROM sakila.city
limit 0, 5;

-- 처음 데이터에서 5번째부터, 5개 확인
SELECT * FROM sakila.city
limit 5, 5;

-- 처음 데이터에서 10번째부터, 5개 확인
SELECT * FROM sakila.city
limit 10, 5;

-- 6. 특정 컬럼 항목만 가져오기
-- 컬럼명 as 이름설정
SELECT 
	Name as '도시 이름', Population as '인구 수' 
FROM 
	world.city;

-- 7. 암스테르담의 인구수 가져오기
SELECT Population as '인구수'
FROM world.city
WHERE Name = 'Amsterdam'; 

-- 나라 코드가 NLD이고 인구수가 10만 이상인 도시만 고르기 
SELECT 
id, countrycode, population
FROM world.city
WHERE countrycode = 'NLD' and population > 100000;

-- 나라코드를 그룹으로 잡기
SELECT 
id, sum(population) as '10만미만나라별인구수', countrycode
FROM world.city
WHERE population < 100000
group by countrycode;

-- 나라코드 ARG,BRA,CHN 중에서 인구수 100000미만만 가져오기
SELECT *
FROM world.city 
WHERE population < 100000 and
countrycode in('ARG','BRA','CHN');

 