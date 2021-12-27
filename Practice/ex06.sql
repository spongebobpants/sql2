/*문제1.
담당 매니저가 배정되어있으나 커미션비율이 없고, 월급이 3000초과인 직원의
이름, 매니저아이디, 커미션 비율, 월급 을 출력하세요.
(45건)*/
select first_name,
    commission_pct,
    salary
from employees
where salary>3000
and commission_pct is null
and manager_id is not null
order by salary desc;

/*문제2.
각 부서별로 최고의 급여를 받는 사원의 직원번호(employee_id), 이름(first_name), 급여
(salary), 입사일(hire_date), 전화번호(phone_number), 부서번호(department_id) 를 조회하
세요
-조건절비교 방법으로 작성하세요
-급여의 내림차순으로 정렬하세요
-입사일은 2001-01-13 토요일 형식으로 출력합니다.
-전화번호는 515-123-4567 형식으로 출력합니다.
(11)*/
select first_name,
        employee_id,
        salary,
        replace(hire_date, '/','-') || to_char(hire_date, 'DAY'),
        replace(phone_number, '.','-'),
        department_id
from employees
where (department_id,salary) IN (SELECT department_id,
                                        max(salary)
                                FROM employees
                                GROUP by department_id)
order by salary asc;