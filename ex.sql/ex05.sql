--평균 급여보다 적은 급여를 받는 직원의 수
select count(*)
from employees
where salary<(select avg(salary)
            from employees);
            
--평균 급여이상, 최대급여 이하의 월급을 받는 사원의 직원번호(employee_id),
--이름(first_name), 급여(salary), 평균급여, 최대급여를 급여의 
--오름차순으로 정렬하여 출력하세요

select employee_id
from employees
where salary in(select salary
                from employees
                where salary>avg(salary))
group by employee_id;

/*
문제3.
직원중 Steven(first_name) king(last_name)이 소속된 부서(departments)가 있는 곳의 주소를 알아보려고 한다.
도시아이디(location_id), 거리명(street_address), 우편번호(postal_code), 도시명(city), 
주(state_province), 나라아이디(country_id) 를 출력하세요
(1건)
*/

select de.department_id
from employees em, departments de
where em.department_id=de.department_id
and em.first_name='Steven'
and em.last_name='King'; --90

select *
from departments;

--executive, managerid=100, location id-1700
select lo.location_id,
        lo.street_address,
        lo.postal_code,
        lo.city,
        lo.state_province,
        lo.country_id
from departments de, locations lo
where de.location_id=lo.location_id
and de.department_id =(select de.department_id
                        from employees em, departments de
                        where em.department_id=de.department_id
                        and em.first_name='Steven'
                        and em.last_name='King');
                        
/*
문제4.
job_id 가 'ST_MAN' 인 직원의 급여보다 
작은 직원의 사번,이름,급여를 급여의 내림차순으로 출력하세요  -ANY연산자 사용
(74건)
*/

select salary
from employees
where job_id='ST_MAN';

--8000, 8200, 7900, 6500, 5800

select employee_id,
        first_name,
        salary
from employees
where salary<any(select salary
                from employees
                where job_id='ST_MAN');
                
    /*
문제5. 
각 부서별로 최고의 급여를 받는 사원의 직원번호(employee_id), 
이름(first_name)과 급여(salary) 부서번호(department_id)를 조회하세요 
단 조회결과는 급여의 내림차순으로 정렬되어 나타나야 합니다. 
조건절비교, 테이블조인 2가지 방법으로 작성하세요
(11건)
*/
select  employee_id,
        first_name,
        salary,
        department_id
from employees
where (department_id, salary) in(select department_id, max(salary)
                                from employees
                                group by department_id)
order by salary desc;

/*
문제6.
각 업무(job) 별로 연봉(salary)의 총합을 구하고자 합니다. 
연봉 총합이 가장 높은 업무부터 업무명(job_title)과 연봉 총합을 조회하시오 
(19건)
*/
SELECT
    jo.job_title 업무,
    SUM(salary)  연봉총합
FROM
    employees em,
    jobs      jo
WHERE
    em.job_id = jo.job_id
GROUP BY
    jo.job_title
ORDER BY
    SUM(salary) DESC;