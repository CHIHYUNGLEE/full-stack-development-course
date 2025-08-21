--from where groupby having select order by
SELECT * FROM employees;

SELECT employee_id,first_name,salary,hire_date
FROM employees;


--컬럼 별칭주기 : heading에 별칭값이 나타남,열의 이름 바꿈.heading은 기본 대문자로 출력됨.
SELECT employee_id 사번, first_name "사원 이름",salary , hire_date "hiredate"
FROM employees;

--문자열 기호 ''
--문자열 결합연산자 ||

SELECT employee_id, first_name,last_name, first_name || last_name, first_name ||'-'|| last_name "사원 성명"
from employees;
-----------------------------------------------
--자료형
--문자형  CHAR,VARCHAR2
--숫자형  NUMBER 
--날짜형  DATE, TIMESTAMP

--연산자
--산술연산자 : +, -, *, /
--비교연산자 : >, <, >=, <=, =, <>
--대입연산자 : 없음
--논리연산자 : AND , OR , NOT
--증감연산자,삼항연산자 : 없음.
--괄호연산자 : ()   연산 우선 순위를 높이는데 사용.
--between연산자 : <= and >=와 같음.
--IN연산자 : OR와 같음.

--LIKE문자열 처리용 연산자의 형식 -> % : 0개이상의 문자 , _ : 1개의 문자

-----------------------------------------------
--특정 행 추출하기 : WHERE
--급여가 5000이상인 사원들의 사번,이름,급여를 출력하시오.

SELECT employee_id, first_name, salary
From employees
WHERE salary>=5000;

--급여를 12를 곱한값이 100000이상인 사원들의 사번,이름,급여,12달치 급여를 출력하시오.

SELECT employee_id, first_name, salary, salary*12
From employees
WHERE salary * 12>=100000;

--급여가 5000이상 10000이하인 사원들의 사번, 이름, 급여를 출력하시오

SELECT  employee_id, first_name, salary
FROM employees
WHERE salary>=5000 AND salary<=10000;

SELECT  employee_id, first_name, salary
FROM employees
WHERE salary BETWEEN 5000 AND 10000;

--사원들의 사번,부서번호
SELECT employee_id,department_id
FROM employees;

--부서번호가 90이거나, 30이거나 20인 사원들의 사번,부서번호를 출력하시오.

SELECT employee_id,department_id
FROM employees
WHERE department_id = 90 OR department_id=30 OR department_id=20;

SELECT employee_id,department_id
FROM employees
WHERE department_id IN(90,30,20);

--부서번호가 90이거나, 30이거나 20이고 급여가 5000이상 10000이하인 사원들의 사번, 이름, 급여,부서번호를 출력하시오
SELECT  employee_id, first_name, salary, department_id
FROM employees
WHERE (department_id = 90 or department_id=30 or department_id=20) and (salary>=5000 and salary<=10000);

SELECT  employee_id, first_name, salary, department_id
FROM employees
WHERE department_id IN(90,30,20) AND salary BETWEEN 5000 AND 10000;

--부서번호가 90아니고 30아니고 20아닌 부서의 사번 이름 부서번호를 출력하시오.
SELECT  employee_id, first_name, department_id
FROM employees
where department_id <>90 AND department_id <>30 AND department_id <>20;

SELECT  employee_id, first_name, department_id
FROM employees
where department_id NOT IN(90, 30, 20);

--직무테이블
SELECT *FROM jobs;
--manager로 끝나는 직무명을 출력하시오.
SELECT *
FROM jobs
WHERE JOB_TITLE LIKE '%Manager'; 
--사원의 이름에 'e'를 포함한 사원들의 사번과 이름을 출력하시오.
SELECT  employee_id, first_name
FROM employees
WHERE first_name LIKE '%e%';
--사원의 입사일자를 출력하시오
SELECT hire_date
FROM employees;
--사원의 입사년도가 07년도인 사원의 사번과 입사일을 출력하시오.
SELECT employee_id,hire_date
FROM employees
WHERE hire_date LIKE '07%';

SELECT employee_id,hire_date
FROM employees
WHERE hire_date BETWEEN '07/01/01' AND '07/12/31';

--입사월이 11월인 사원의 사번,입사일자를 출력하시오.
SELECT employee_id,hire_date
FROM employees
WHERE hire_date LIKE '__/11/__';

-----------------------------------------------

--ORDER BY : 정렬, 오름차순,내림차순
--1차 정렬,2차정렬,....정렬가능
--컬럼의 위치사용가능, 컬럼의 별칭사용가능.
--SELECT절에 없는 것도 사용가능.

--적은 급여를 받는 사원부터 사번, 이름, 급여를 출력하시오.
SELECT  employee_id, first_name , salary
FROM employees
ORDER BY salary;

--많은 급여를 받는 사원부터 사번, 이름, 급여를 출력하시오. 단 급여가 같은 경우 이름을 사전순으로 출력하시오.
SELECT  employee_id 사번, first_name 이름, salary 급여
FROM employees
ORDER BY 급여 DESC, 이름 DESC; --별칭사용

SELECT  employee_id , first_name , salary 
FROM employees
ORDER BY salary DESC, first_name DESC; 

SELECT  employee_id , first_name , salary 
FROM employees
ORDER BY 3 DESC, first_name DESC; 

--많은 급여를 받는 사원부터 사번, 이름을 출력하시오.
SELECT  employee_id , first_name
FROM employees
ORDER BY salary DESC, first_name DESC; 

---------------------------------------------
--SELECT
--FROM
--WHERE
--GROUP BY
--HAVING
--ORDER BY

--------------------------------------------

--DISTINCT : 중복제거
--사원의 부서번호를 출력하시오.
SELECT DEPARTMENT_ID
FROM employees;

--사원이 속한 부서번호를 중복없이 출력하시오.
SELECT DISTINCT department_id, job_id
FROM employees
order by department_id,job_id;

---------------------------------------------
--NULL : 아무값도 아니다
SELECT employee_id, first_name, last_name, department_id, salary,commission_pct
FROM employees;


--부서배치 받지않는 사원의 사번,이름,부서번호를 출력하시오.
SELECT employee_id, first_name, department_id
FROM employees
WHERE department_id = null; -- null을 비교연산자로 비교하면 안됨.(x)

SELECT employee_id, first_name, department_id
FROM employees
WHERE department_id is null;

SELECT employee_id, first_name, department_id
FROM employees
WHERE department_id is not null;

--모든사원의 사번, 이름, 급여, 수당률, 실급여을 출력하시오. 단, 실급여란 (급여*수당률)+급여
SELECT employee_id,first_name,salary,commission_pct,salary+(salary*commission_pct) 실급여
FROM employees;

--null관련 함수 : nvl(표현식, 반환값) 표현식이 null이면 반환값을 반환하고, 표현식이 null이 아니면 표현식값을 반환한다.
SELECT employee_id,first_name,salary,commission_pct,salary+(salary*NVL(commission_pct,0)) 실급여
FROM employees;

--작은 부서번호를 갖는 사원부터 출력하시오.
SELECT employee_id, department_id
FROM employees
ORDER BY department_id; --오름차순하면 null이 마지막에 출력. dbms마다 다름.

-------------------------------------
--ROWNUM : 행번호값을 갖는 의사칼럼.
SELECT rownum, employee_id from employees;
--처리순서가 from select order by이므로 뒤죽박죽 됨.
SELECT rownum, employee_id, salary from employees order by salary desc;

--급여를 많이받는 순으로 5명만 출력하시오.
SELECT employee_id, salary
from EMPLOYEES
where rownum <=10
order by salary desc;


