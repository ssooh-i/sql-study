-- ※ MySQL DML
-- [1] MySQL의 개요
-- 1. 데이타 조작어(DML : Data Manipulation Language)
--    : insert, update, delete
-- 2. 데이타 정의어(DDL : Data Definition Language)
--     : create, alter, drop, rename, truncate    
-- 3. 데이타검색
--    : select 
-- 4. 트랜젝션제어
--    : commit, rollback, savepoint
-- 5. 데이타 제어어(DCL : Data Control Language)
--     : grant,  revoke

-- [2] MySQL 데이터베이스 생성/삭제/사용
-- 1. 데이터베이스 생성
-- create database 데이터베이스명;
-- create database 데이터베이스명 default character set 값 collate 값;
--    --특정 문자 셋에 의해 데이터베이스에저장된 값들을 비교검색하거나 정렬 등의
--      작업을 위해 문자들을 서로 ＇비교＇ 할 때 사용하는 규칙들의 집합을 의미
--    -- 예) 다국어 처리(utf8mb3)  
--           create database dbtest
--           default character set utf8mb3 collate utf8mb3_general_ci;

-- 2. 데이터베이스 변경
-- alter database 데이터베이스명 default character set 값 collate 값;  

-- 3. 데이터베이스 삭제
-- drop database 데이터베이스명;

-- 4. 데이터베이스 사용
-- use 데이터베이스명;

-- 5. 테이블 목록확인
-- show tables;
-- ------------------------------------------------------------------------
-- [3] 테이블 생성/수정/복사 
-- 1.테이블생성
-- create table 테이블명(컬럼명1   컬럼타입  [제약조건],컬럼명2  컬럼타입  [제약조건],.....);

--  -  문자로 시작: 영문 대소문자,숫자,특수문자( _ , $ , # ),한글
--  -  중복되는 이름은 사용안됨
--  -  예약어(create, table, column등)은 사용할수 없다

--  -  자료형
--    varchar(M):  문자,문자열(가변형) ==> M은 1~255
--    char(M)   :  문자,문자열(고정형) ==> M은 1~65535
--    text(M)   :  문자,문자열        ==> 최대 65535 
--    int(M)    :  정수형 숫자
--    float / double(M,D) : 실수형 숫자
--    datetime :    YYYY-MM-DD HH:MM:SS('1001-01-01 00:00:00' ~ '9999-12-31 23:59:59')
--    timestamp(M) : 1970-01-01 ~ 2037년 임의 시간(1970-01-01 00:00:00 를 0으로 해서 1초단위로 표기

--  - 제약조건
--     not null:  해당컬럼에 NULL을 포함되지 않도록 함 
--     unique:  해당컬럼 또는 컬럼 조합값이 유일하도록 함
--     primary key: 각 행을 유일하게 식별할수 있도록함(P.K:기본키)
--     foreign key: references를 이용하여 어떤 컬럼에 어떤 데이터를 참조하는지 반드시 지정(F.K:참조키,외래키)
--     default: NULL값이 들어올 경우 기본 설정되는 값을 지정
--     check : 해당컬럼에 특정 조건을 항상 만족시키도록함
--             MySQL의 경우 작성은 가능하지만(에러발생 x) 적용은 안됨

--     [참고]  primary key = unique + not null

--     ex)       idx          int          auto_increment    자동 값증가   
--               userid       varchar(16)  not null          아이디 
--               username     varchar(20)                    이름
-- 	             userpwd      varchar(16)                    비밀번호
--               emailid      varchar(16)                    이메일아이디
--               emaildomain  varchar(16)                    이메일도메인
--               joindate     timestamp    current_timestamp 가입일 
-- -----------------------------
-- 2.테이블수정
-- (1)테이블 내용 수정
-- alter  table 테이블명 
-- add    컬럼명  데이터타입 [제약조건]
-- add    constraint  제약조건명  제약조건타입(컬럼명)
-- modify 컬럼명 데이터타입 
-- drop   column  컬럼명 [cascade constraints]
-- drop   primary key [cascade] | union (컬럼명,.....) [cascade] .... | constraint 
-- 제약조건명 [cascade]

-- (2)테이블 이름변경
-- alter table  기존테이블명  rename to  새테이블명
-- rename  기존테이블명  to 새테이블명

-- (3)테이블 컬럼이름 변경
-- alter table 테이블명 rename column  기존컬럼명 to 새컬럼명
-- alter table 테이블명 rename constraint 기존제약조건명 to 새제약조건명
-- ---------------------------------------------------------------------------------
-- [4]추가하기: insert
-- : 테이블에 데이터(새로운 행)추가 -- 행의 수가 변경

-- insert into 테이블명 [ (column1, column2, .....)]   values (value1,value2,.....)
--  -  column과 values의 순서일치
--  -  column과 values의 개수 일치
-- ---------------------------------------------------------------------------------
-- [5]수정하기: update
-- : 테이블에 포함된 기존 데이터수정 -- 행의 수가 변경되지 않음
--   전체 데이터 건수(행수)는 달라지지 않음
--   조건에 맞는 행(또는 열)의 컬럼값을 갱신할수 있다

-- update 테이블명  set  컬럼명1=value1, 컬럼명2=value2 ..... [where  조건절]
--   - where 이 생략이 되면 전체행이 갱신
--   - set절은 서브쿼리사용가능, default옵션 사용가능 
-- ---------------------------------------------------------------------------------
-- [6]삭제하기:delete
--  : 테이블에 포함된 기존데이터를 삭제  -- 행의 수가 변경
--    행 단위로 삭제되므로 전체행수가 달라짐
   
-- delete [from] 테이블명 [where  조건절];
-- - where을 생략하면 전체행이 삭제됨
--  - 데이터는 삭제되고 테이블 구조는 유지됨
-- ---------------------------------------------------------------------------------
-- [7]tracnsation처리
-- commit: 일의 시작과 끝이 완벽하게 마무리가 되면 테이블에 적용
-- rollback: 처리도중 인터럽트(interrupt:장애)가 발생하면 되돌아옴
-- ---------------------------------------------------------------------------------
-- [8]연습하기
-- 계정을 바꾸시오 : ssafy/ssafy

use ssafydb;  -- ssafydb 데이터베이스 사용
show tables;  -- 테이블 목록 확인

CREATE TABLE ssafy_member (
	idx INT NOT NULL AUTO_INCREMENT,
	userid VARCHAR(16) NOT NULL,
	username VARCHAR(20),
	userpwd VARCHAR(16),
	emailid VARCHAR(20),
	emaildomain VARCHAR(50),
	joindate TIMESTAMP NOT NULL DEFAULT current_timestamp,
	PRIMARY KEY (idx)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO ssafy_member (userid, username, userpwd, emailid, emaildomain, joindate)
VALUES ('kimssafy', '김싸피', '1234', 'kimssafy', 'ssafy.com', now());

INSERT INTO ssafy_member (username, userid , userpwd, joindate)
VALUES ('김싸피', 'kimssafy', '1234', now());

INSERT INTO ssafy_member (username, userid , userpwd, joindate)
VALUES
('김싸피', 'kimssafy', '1234', now()), 
('박싸피', 'parkssafy', '9876', now());

UPDATE ssafy_member
SET userpwd = 9876, emaildomain = 'ssafy.co.kr'
WHERE userid = 'kimssafy';

DELETE from ssafy_member
WHERE userid = 'kimssafy';
-- --------------------------------------------------------------------------------------
-- [9]검색하기(select)
-- [형식]
-- select [distinct] [컬럼1,컬럼2,.....][as 별명][*]  --- 6
-- from 테이블명     --- 1
-- [where 조건절]    --- 2
-- [group by컬럼명]  --- 3
-- [having 조건절]   --- 4
-- [order by 컬럼명 asc|desc ]  --- 5

-- [조건]
-- distinct: 중복제거
-- *: 모든
-- 조건절 : and,or,like,in,between and,is null,is not null

-- [연산자]
-- =  : 같다
-- !=,  ^=,  <> : 같지않다
-- >=, <=, >, < : 크거나같다,작거나같다,크다,작다
-- and, or, between and, in, like, is null/is not null

-- [정렬]
-- order by 정렬방법
--          asc  - 오름차순(생략가능)
--          desc - 내림차순
-- 컬럼명 : 숫자로도 가능

-- [그룹과 조건]
-- group by : 그룹함수(max,min,sum,avg,count..)와 같이 사용
-- having : 묶어놓은 그룹의 조건절
-- --------------------------------------------------------
select * from employees;   -- employees테이블의 내용확인하기
select * from departments; 

-- ex1)employees테이블의 모든 사원의 사원번호(employee_id),이름(last_name),급여(salary) 검색
select employee_id, last_name, salary
from employees;

-- ex2)employees테이블에서 모든 사원의 이름, 입사일(hire_date), 업무ID(job_id)만 검색
select last_name, hire_date, job_id
from employees;

-- ex3)employees테이블에서 모든 사원의 이름(last_name), 연봉(salary*12)만 검색
select last_name, salary*12
from employees;

-- ex4)별명붙이기(as는 생략가능)
--    employees테이블의 모든 사원의 사원번호,이름(last_name),급여 검색
--    조건) title 사원번호, 이름 ,급여로 출력할것
select employee_id as "사원번호",last_name as "이름",salary as "급여"
from employees;

select employee_id "사원번호",last_name "이름",salary "급여"
from employees;

select employee_id 사원번호,last_name 이름,salary 급여
from employees;

select employee_id 사원번호,last_name "이  름",salary "급  여"
from employees;

-- ex5)employee테이블에서 사원번호,이름,연봉을 구하시오
--     조건1) 연봉 = 급여 * 12
--     조건2) 제목을 사원번호,이  름,연  봉으로 출력
select employee_id as "사원번호",last_name as "이  름",salary*12 as "연  봉"
from employees;

-- ex6)연결연산자(concat): 컬럼을 연결해서 출력
--    first_name과  last_name을 연결해서 출력하시오
--     이   름
--     ------------
--     Ellen   Abel
-- 일반적인 DBMS에서는 ||로 문자열을 연결하지만 MySQL에서는 ||을 사용할수 없다. 
-- concat()사용해야 한다.
select concat(first_name,concat('  ',last_name)) as "이  름"
from employees;

-- ex7)다음처럼 출력하시오
--   사원번호        이  름                 연 봉
--   ---------------------------------------------
--    100      Steven King   288000달러 
select employee_id as "사원번호", concat(first_name,' ',last_name) as "이 름", 
       concat(salary,'달러') as "연 봉"
from employees;  

-- ex8) 다음처럼 출력하시오 (last_name, job_id이용)
--     Employee  Detail
--     --------------------
--     King  is a  AD_PRES
select concat(last_name,' is a ',job_id)
from employees;

-- 중복제거(distinct)
-- ex9)employees테이블에서 부서를 출력하시오
--    조건1)중복되는 부서는 1번만 출력하시오
--    조건2)부서별 오름차순으로 보여주시오
select distinct department_id
from employees
order by department_id desc;

-- ex10) 10번부서 또는 90번부서 사원들의 이름,입사일,부서ID를 출력하시오
-- 방법1)or 연산자
select last_name,hire_date,department_id
from employees
where department_id=10 or department_id=90;

-- 방법2)in연산자(or연산자의 다른표현)
select last_name,hire_date,department_id
from employees
where department_id in(10,90);

-- ex11)급여가 2500이상 3500이하인 사원의 이름(last_name), 입사일, 급여를 검색하시오 --33건
-- 방법1)and 연산자
select last_name,hire_date,salary
from employees
where salary>=2500 and salary<=3500;

--방법2)between연산자(and연산자의 다른 표현): 초과,미만에서는 사용할수 없다
select last_name,hire_date,salary
from employees
where salary between 2500 and 3500;

-- ex12) 급여가 2500이하 이거나 3000이상이면서, 90번 부서인 사원의 이름, 급여, 부서ID를 출력하시오. --3건
--      조건1) 제목은 사원명, 월  급, 부서코드로 하시오
--      조건2) 급여앞에 $를 붙이시오
--      조건3) 사원명은 first_name과 last_name을 연결해서 출력하시오
select concat(first_name,'  ',last_name) as "사원명",
       concat('$',salary) as "월   급", department_id as "부서 코드"
from employees
where (salary<=2500 or salary>=3000) and department_id=90;

-- ex13)'King'사원의 모든 컬럼을 표시하시오
select * 
from employees
where last_name='King';          --->문자열검색할때 대.소문자를 구분

select *
from employees
where upper(last_name)='KING';   --->문자열을 대문자로

select *
from employees
where lower(last_name)='king';   --->문자열을 소문자로

-- like: 문자를 포함
-- '%d'      d로 끝나는 
-- 'a%'      a로 시작하는
-- '%test%'  test가 포함되어있는
-- 예)select * from employees where first_name like '%net%';

-- ex14)업무ID에 CL이 포함되어있는 사원들의 이름,업무ID,부서ID를 출력하시오  --45건
select last_name, job_id, department_id
from employees
where job_id like '%CL%';

-- ex15)업무ID가  IT로 시작하는 사원들의 이름,업무ID,부서ID를 출력하시오  -- 5건
select last_name, job_id, department_id
from employees
where job_id like 'IT%';

-- ex16) is null / is not null 
-- 커미션을 받는 사원들의 이름과 급여,커미션을 출력하시오 -- 35건
select last_name,salary,commission_pct
from employees
where commission_pct is not null;

-- ex17)커미션을 받지 않는 사원들의 이름과 급여,커미션을 출력하시오 -- 72건
select last_name,salary,commission_pct
from employees
where commission_pct is null;

-- ex18) 사원명,부서ID,입사일을 부서별로 오름차순 정렬하시오
select last_name,department_id,hire_date
from employees
order by 2;   -- or order by department_id asc;   (asc는 생략가능)

-- ex19) 사원명, 부서ID, 입사일을  부서별로 내림차순 정렬하시오
--       같은부서가 있을때는  입사일순으로 정렬하시오
select last_name,department_id, hire_date
from employees
order by 2 desc, 3;  -- or  order by department_id desc, hire_date asc;

-- ex20) 사원들의 연봉을 구한후 연봉순으로 내림차순정렬하시오   
-- 이 름     연 봉     
-- ---------------
-- King   28800달러
select last_name "이 름", concat(round(salary*12,0),"달러") as "연봉"
from employees
order by salary desc;

-- Data Manipulation Language (DML) : SELECT
-- [형식]
-- case [value] when  표현식  then  구문1
--              when  표현식  then  구문2
--                       :
--              else  구문3
-- end

-- ex21)업무 id가 'SA_MAN'또는'SA_REP'이면 'Sales Dept' 그 외 부서이면 'Another'로 표시
-- 조건) 분류별로 내림차순정렬
--        직무          분류
--       --------------------------
--       SA_MAN    Sales Dept
--       SA_REP    Sales Dept
--       IT_PROG   Another
select job_id as "직무",
       case job_id when 'SA_MAN' then 'Sales Dept'
                   when 'SA_REP' then 'Sales Dept'
                   else               'Another'
       end as "분류"
from employees
order by 2 desc;       


-- ex22) 급여가 10000미만이면 초급, 20000미만이면 중급 그 외이면 고급을 출력하시오 
--      조건1) 컬럼명은  '구분'으로 하시오
--      조건2) 제목은 사원번호, 사원명, 구  분
--      조건3) 구분(오름차순)으로 정렬하고, 구분값이 같으면 사원명(오름차순)으로 정렬하시오
select employee_id as "사원번호", last_name as "사원명",
       case when salary < 10000 then '초급'
            when salary < 20000 then '중급'
            else '고급' 
       end as "구분"
 from employees
 order by 3, 2;






