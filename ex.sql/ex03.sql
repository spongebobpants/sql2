/*
문제1.
직원들의 사번(employee_id), 이름(firt_name), 성(last_name)과 부서명(department_name)을 
조회하여 부서이름(department_name) 오름차순, 사번(employee_id) 내림차순 으로 정렬하세요.
(106건)
*/
select      em.employee_id 사번,
            em.first_name||' '||em.last_name 이름,
            de.department_name 부서명
from        employees em, departments de
where       em.department_id = de.department_id
order by    department_name asc, employee_id desc;

select employee_id,
        salary,
        decode(job_id, 'AC_ACCOUNT', salary+salary*0.1,
                        'SA_REP', salary+salary*0.2,
                        'ST_CLERK', salary +salary*0.3,
                        salary)realSalary
from employees;

decode(a,b,x,y)
--a=b이면 x를 출력, a≠b이면 y를 출력

decode(a,b,x,c,y,z)
--a=b이면 x를 출력, a=c이면 y를 출력, A ≠ B 이고 A ≠ C이면 Z 출력

decode(a1, b, decode(a2,c,x,y),z)
a1=b이면서 a2=c이면 x출력
a1=b이면서 a2A ≠c이면 y를 출력
a1≠b이면 z 출력
--decode 중첩

--직원의 이름, 부서, 팀을 출력하세요
--팀은 코드로 결정하며 부서코드가 10~50이면 A-TEAM

select first_name ||'_'|| last_name  이름,
        department_id 부서,
        case when department_id>=10 and department_id<=50 then 'A_TEAM'
        when department_id>=60 and department_id <=100 then 'B_TEAM'
        when department_id>=110 and department_id<=150 then 'C_TEAM'
        Else 'no team'
        end team
from employees;

--q2
select      em.employee_id,
            em.first_name,
            em.salary,
            de.department_name,
            jo.job_title
from        employees em, departments de, jobs jo
where       em.department_id = de.department_id
and         em.job_id = jo.job_id
order by    em.employee_id asc;

/*
직원의 이름과 직원이 속한 부서명을 모두 가져고 오고 싶거나,
두 테이블 이상에서 동시에 데이터를 갖고오고 싶을 때
등가조인 (equi.join) 
1. from에 필요한 테이블을 모두 기입한다 (또는 3글자 이내의 별명을 적는다)
2.where절에 테이블에 겹치는 컬럼을 =로 묶는다 여러개면 and절 사용한다
3.from의 가장 앞에 있는 테이블이 불러오는 조인이 가장 빠르다
*/

select first_name,
        salary,
        de.department_id
from employees em, departments de
where em.department_id=de.department_id;

select em.first_name,
        de.department_name,
        jo.job_title
from employees em, departments de, jobs jo
where em.department_id=de.department_id
and em.job_id =jo.job_id;

--left outer join
--왼쪽 테이블의 모든 row를 결과테이블에 나타냄
select e.department_id, e.first_name, d.department_name
from   employees e left outer join departments d
on     e.department_id = d.department_id;

--right outer join
select e.first_name,
        e.salary,
        e.department_id,
        d.department_id,
        d.department_name
from employees e right outer join departments d
on e.department_id = d.department_id;

--full outer join
select *
from employees e full outer join departments d
on e.department_id=d.department_id;

--self join
--자기 자신을 조인, 1.from  절에 자기 테이블을 두번 불러온다 (별명은 다르게)

select *
from employees em, employees e
where em.manager_id=e.manager_id;

--sub query
--하나의 sql 안에 다른 sql 포함

--단일행
--den의 급여는?
select *
from employees
where first_name ='Den';

--den보다 급여가 많은 사람의 이름
select first_name,
        salary
from employees
where salary>=11000;

--두 질문을 하나로
select first_name, salary
from employees
where salary>=(select salary 
                from employees
                where first_name='Den');
                
--급여를 가장 적게 받는 사람의 이름, 급여, 사원번호
select first_name,
        salary,
        employee_id
from employees
where salary<=(select min(salary)  
                from employees);
                
--평균 급여보다 적게 받는 사람의 이름, 급여 출력
select first_name, salary
from employees
where salary<=(select avg(salary)
                from employees);

