/*
select 문
  select 절
  from 절;
*/

--직원테이블 전체 조회
select * 
from employees;

--부서테이블 전체 조회
select * 
from departments;

--원하는 컬럼만 조회
select  employee_id,
        first_name, 
        last_name
from employees;

--예)
select first_name, phone_number, hire_date, salary
from employees;

select  first_name, 
        last_name, 
        salary, 
        phone_number, 
        email, 
        hire_date
from employees;

--출력할 컬럼명 별명적용하기
select  employee_id as empNo,
        first_name as "f-name" ,
        salary as "연 봉"
from employees;

--예)
--as 생략가능
select  first_name as 이름,
        phone_number as 전화번호,
        hire_date as 입사일,
        salary as 급여
from employees;

select  employee_id as 사원번호,
        first_name as "이름",
        last_name as 성,
        salary as 급여,
        phone_number as 전화번호,
        email as 이메일,
        hire_date as 입사일
from employees;

--연결 연산자(Concatenation)로 컬럼들 붙이기
select first_name, last_name
from employees;

select first_name || last_name
from employees;

select first_name || ' ' || last_name
from employees;

select first_name || ' 입사일은 ' || hire_date
from employees;


select first_name || ' ' || last_name name
from employees;


--산술 연산자 사용하기
select  first_name,
        salary as 월급,
        salary*12 as 연봉,
        (salary+300)*12
from employees;

--예) 
select job_id*12
from employees;

select * from
employees;

--변환함수 > toc_char(날짜, 출력모양)날짜 ->문자형으로 변환하기
select sysdate,
        to_char(sysdate,'DD')
form dual;

select sysdate,
        to_char(sysdate, 'MONTH'),
        hire_date,
        to_char(hire_date,'DD')
from employees;

select sysdate,
        to_char(sysdate, 'YY/MM/DD/HH24:MI:SS')
from dual;

select sysdate,
        to_char(sysdate, 'DD/MM/YY/HH24:MI:SS')
from dual;

select first_name,
        nvl(commission_pct,0),
        nvl2(commission_pct, 100, 0)
from employees;

2021-12-16
2021/12/16
2021.12.16

1900/01/01 00:00:00 0
"1900/01/01 00:00:01" 12313123