--sub query
select employee id,
        first_name,
        salary
from employees
where salary in(select salary
                from employees
                where department_id=100);

--1.부서번호가 110인 직원의 사번, 이름, 급여 출력 -> 부서번호 110인 사원의 급여리스트를 구한다

select employee_id, first_name, salary
from employees
where department_id=110;

--2.급여가 12008, 8300인 직원 리스트를 구한다
select employee_id, first_name, salary
from employees
where salary=12008
or salary=8300;

select employee_id, first_name, salary
from employees
where salary in(12008, 8300);

--3.두 식을 조합한다

select  department_id, employee_id, first_name, salary
from    employees
where   salary in (select  salary
                    from    employees
                    where   department_id = 110);
                    
--부서별 최고급여를 받는 사원을 출력하세요
--1. 최고급여액수 부서별 출력
select department_id,
        max(salary)
from employees
group by department_id;

--사원
select first_name,
        salary,
        department_id
from employees
where (department_id, salary) in (select department_id,
                                    max(salary)
                                    from employees
                                    group by department_id);
                                    
--any
--부서번호가 110인 직원의 급여보다 큰 모든 직원의
--사번, 이름, 급여를 출력하세요.
--ANY(or) (12008 또는(or) 8300)보다 큰 = 8300보다 큰
--조건중 하나만 만족하는 값을 출력하라

--1.부서번호가 110인 직원의 급여
select salary
from employees
where department_id=110;

--02.부서번호가 110인 직원보다 급여가 큰 직원의 사번, 이름, 급여 출력
select employee_id, first_name, salary
from employees
where salary>12008
or salary>8300;

--1+2
select employee_id,
        first_name,
        salary
from employees
where salary > any(select salary
                    from employees
                    where department_id=110);
                    
--and
--12009, 8300
select employee_id, first_name, salary
from employees
where salary >all(select salary
                    from employees
                    where department_id=110);

--각 부서별로 최고 급여를 받는 사원을 출력
select department_id, employee_id, first_name, salary
from employees
where (department_id, salary) in (select department_id, max(salary)
                                from employees
                                group by department_id);
                                
select e.department_id,
        e.employee_id,
        e.first_name,
        e.salary
from    employees e, (select     department_id, max(salary) salary
                        from     employees
                        group by department_id) s
where e.department_id=s.department_id
and e.salary =s.salary;