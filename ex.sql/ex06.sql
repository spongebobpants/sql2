select  max(salary),first_name
from employees;
-- 알아서 firstname에서 최대값을 뽑아줄 수 없음. 그러므로 에러

select  first_name,
        salary
from employees
where salary=(select max(salary)
            from employees);

--rownum 익히기
select rownum,
        first_name,
        salary
from employees;

--02. 급여순으로 정렬-->rownum이 섞여버림
--정렬이 가장 나중에 실행
select rownum,
        first_name,
        salary
from employees
order by salary desc;

--03,
select first_name,
        salary
from employees
order by salary desc;

--
select rownum,
        first_name,
        salary
from (select *
        from employees
        order by salary desc)o
where rownum>=11
and rownum<=20;

select rownum,
        first_name,
        salary
from (select *
        from employees
        order by salary desc)o
where rownum>=1
and rownum <=4;

select rownum,
        first_name,
        salary
from (select first_name,
            salary
        from employees
        order by salary desc)ot --<-정렬되어 있는 데이터 먼저 제공 
where rownum>=3
and rownum<=5;
--(1) 정렬 먼저 한 테이블 (2)row 붙이고 (3) where 절 사용

select ort.rn,
        ort.first_name,
        ort.salary
from (select rownum rn,
                ot.first_name,
                ot.salary
        from (select first_name,
                    salary
            from employees
            order by salary desc)ot   -- 01
    )ort--(2)
where rn>=1
and rn<=5;--(3)


select rownum,
        ot.first_name, --이 안에 있는 퍼스트 네임을 쓸거야
        ot.salary
from (select first_name,
            salary
        from employees
        order by salary desc)ot; --- (1)
--정렬된 테이블 ot)ot ==<정렬된 테이블을 오티라고 부를거야


--07년에 입사한 직원중 급여가 가장 많은 직원 중
--3에서 7등의 이름 급여 입사일
--일단 전체직원,

--(1)정렬하고 (2)rownum붙이고 (3)where

select ort.rn,
        ort.first_name,
        ort.salary,
        ort.hire_date
from (
    --07년도 입사중, 급여로 정렬, rownum을 가진 테이블
    select rownum rn,
        ot.first_name,
        ot.salary,
        ot.hire_date
    from (select first_name,
            salary,
            hire_date
            from employees
            where hire_date> '07/01/01'
            and hire_date<'08/01/01'
            order by salary desc)ot--(1)
)ort--(2)
where rn>=3
and rn<7; --(3)

select ort.rn,
        ort.first_name,
        ort.salary,
        ort.hire_date
from (select rownum rn,
        ot.first_name,
        ot.salary,
        ot.hire_date,
        ot.department_name
    from(select em.first_name,
            em.salary,
            em. hire_date,
            de.department_name
    from employees em, departments de
            where em.department_id=de.department_id
            and hire_date>= '07/01/01'
            and hire_date<'08/01/01'
            order by salary desc)ot    --(1)
    )ort--(2)
where ort.rn>=3
and ort.rn<=7;--(3)
