--문자형함수
--길이:LENGTH()
SELECT LENGTH('오라클'), LENGTHB('오라클') FROM dual;
SELECT employee_id, first_name, LENGTH(first_name)
FROM employees;
--이름이 8자리이상인 사원들의 사번, 이름을 출력하시오
SELECT employee_id, first_name
FROM employees
WHERE LENGTH(first_name)>=8;

--대문자로 변환: UPPER(), 소문자로 변환: LOWER(), 첫글자만 대문자로 변환: INITCAP()
SELECT UPPER('heLLo'), LOWER('heLLo'), INITCAP('heLLo')
FROM dual;

--특정문자의 위치반환 : INSTR()
SELECT INSTR('hellojava', 'a') --7
      ,INSTR('hellojava', 'a', 8) --9
      ,INSTR('hellojava', 'b') --0
      ,INSTR('hellojava', 'a', -1)  --9
      ,INSTR('hellojava', 'a', -1, 2) --7
FROM dual;

--부분문자열 반환 : SUBSTR()
SELECT SUBSTR('hellojava', 2, 6) --elloja
    , SUBSTR('hellojava', 2) --ellojava
FROM dual;

--문자열 제거 : TRIM()
SELECT TRIM( LEADING 'a' FROM 'aABCaDEFaHa') --왼쪽 문자 'a'제거
      ,TRIM( TRAILING 'a' FROM 'aABCaDEFaHa') --오른쪽 문자 'a'제거
      ,TRIM( BOTH 'a' FROM 'aABCaDEFaHa') --왼쪽오른쪽 문자 'a'제거
      ,TRIM( BOTH 'a' FROM 'aaaABCaaDEFaaa')
FROM dual;

--문자열 늘이기 : LPAD, RPAD
SELECT LPAD('abc', 5, '*')
      ,RPAD('abc', 5, '*')
      ,RPAD(LPAD('abc', 5, '*'), 7, '*')
FROM dual;

--문자열 치환함수 : REPLACE(), TRANSLATE()
SELECT REPLACE('JACK and JUE', 'J', 'BL') --J를 BL로 변환
      ,TRANSLATE('JACK and JUE', 'J', 'BL') --J는 B로  변환
      ,REPLACE('BCCARD', 'BC', 'KB')
      ,TRANSLATE('BCCARD', 'BC', 'KB')
FROM dual;
-----------------------------------------------------------------
--숫자형함수
--나머지값 반환 : MOD()
SELECT 3+4, 3-4, 3*4, 3/4, MOD(3, 4)  --7	-1	12	0.75	3
FROM dual;
--반올림된 값 반환 : ROUND()
SELECT ROUND(45.923) --46
      ,ROUND(45.923, 0) --46 :일의 자릿수까지 표현
      ,ROUND(45.923, 2) --45.92 : 소수점이하2자리까지 표현 
      ,ROUND(45.923, -1) --50 : 십의 자릿수까지 표현
FROM dual;

--버림된 값 반환 : TRUNC()
SELECT TRUNC(45.923) -- 45
      ,TRUNC(45.923, 0) -- :45 일의 자릿수까지 표현
      ,TRUNC(45.923, 2) -- : 45.92 소수점이하2자리까지 표현 
      ,TRUNC(45.923, -1) -- : 40 십의 자릿수까지 표현
FROM dual;

--1. 이름에 대소문자구분없이 'e'를 포함한 사원들의 사번, 이름을 출력하시오. (OR연산자 사용안함)
select employee_id,first_name
from employees
where lower(first_name) like '%e%';

select employee_id,first_name
from employees
where instr(lower(first_name),'e') <> 0;

--2. 실급여(급여+(급여*수당률)가 10000보다 많은 실급여를 받는 사원들의 사번, 급여, 수당률, 실급여를 출력하시오
--단, 실급여는 일의 자리에서 반올림하고 실급여를 많이 받는 사람들부터 출력한다
SELECT employee_id 사번, salary 급여, commission_pct 수당율, round(salary+(salary*NVL(commission_pct, 0)),-1) 실급여
FROM employees
where salary+(salary*NVL(commission_pct, 0))>10000
order by 실급여 desc;
---------------------------------------------
--날짜형함수
--현재시간값 반환 : sysdate 함수(년월일)
select sysdate
from dual;
--날짜 + 숫자
--sysdate + 1는 내일날짜를 반환
--sysdate + 2는 모레날짜를 반환
--sysdate - 1는 어제날짜를 반환
select sysdate + 1
      ,sysdate + 2
      ,sysdate - 1 
from dual;
--날짜-날짜는 일수를 반환
select (sysdate+3)-sysdate
from dual;
--개월을 더한다 add_months()
select sysdate, add_months(sysdate ,5),add_months(sysdate,-2)
from dual;

--개월수를 반환한다 : months_between()
select sysdate ,months_between('22/03/04',sysdate)
               ,months_between('20220304',sysdate) --권장안함.    
from dual;
--3.사원의 사번, 입사일자, 근무일수, 근무 개월수, 근무년수를 출력하시오
select employee_id 사번 ,hire_date 
      ,sysdate-hire_date 근무일수 
      ,trunc(months_between(sysdate,hire_date),0) 근무개월수
      ,round(months_between(sysdate,hire_date)/12,1) 근무냔스
from employees
order by 근무일수 desc;
--일자기준으로 다음요일에 해당날짜를 반환한다 : nextday()
--현재일자 기준으로 다음토요일에 해당하는 날짜를 출력하시오
select sysdate, next_day(sysdate, '토') from dual;

--22년 1월1일 기준으로 다음월요일에 해당하는 날짜를 출력하시오
select next_day('22/01/01','월') from dual;
--------------------------------------------------------------------------
--형변환함수
--문자형을 숫자형으로 to_number()
--문자형을 날짜형으로 to_date()
--숫자형을 문자형으로 to_char()
--날짜형을 문자형으로 to_char()
--숫자형을 날짜형으로 바꿀수가 없으므로 숫자-문자-날짜형으로 바꾼다.

--자동형변환
select '1'||2 from dual; --문자 '12'
select '1'+2 from dual; --숫자 3
select '21/12/25', months_between('21/12/25',sysdate) from dual; --'12/12/25'문자형이 날짜형으로 자동형변환됨.
select employee_id, hire_date
from employees
where hire_date >= '08/01/01'; -- 날짜형>=문자형 -> 문자형이 날짜형으로 자동형변환됨.
select '입사일자 - '||hire_date from employees; -- 대신 날짜형이 문자형으로 자동형변환됨.

--강제형변환
select '1'|| to_char(2) from dual; --문자 '12'
select to_number('1')+2 from dual; --숫자 3
select '21/12/25', months_between('21/12/25',sysdate) from dual; --'12/12/25'문자형이 날짜형으로 자동형변환됨.
select employee_id, hire_date
from employees
where hire_date >= '08/01/01'; -- 날짜형>=문자형 -> 문자형이 날짜형으로 자동형변환됨.
select '입사일자 - '||hire_date from employees; -- 대신 날짜형이 문자형으로 자동형변환됨.
select '입사일자 - '||hire_date, '입사일자 - '||to_char(hire_date) from employees;

--숫자->문자 : to_char()  형식 : 9 0 , . L
select 24000, to_char(24000,'9,999,999') , to_char(24000,'9,999')
            , to_char(24000,'00000000.00'), to_char(24000,'L9,999,999')
from dual;
--사원의 사번,급여를 출력하시오.
select employee_id, to_char(salary,'9,999,999') 급여
from employees;

--날짜->문자 : to_char() 형식 - Y M D HH MI SS DAY
select sysdate, to_char(sysdate,'YYYYMMDD HH:MI:SS')
              , to_char(sysdate,'YYYYMMDD HH24:MI:SS')
              , to_char(sysdate,'YYYYMMDD HH24:MI:SS DAY')
from dual;
--문자 -> 숫자 : to_number()
select 12345,'1,234.5',to_number('1,234.5','9,999.0')+1
from dual;
--문자 -> 날짜 :to_date()
select '21/11/12',to_date('21/11/12')+1,sysdate - to_date('21-10-06 오전 09:00','YY-MM-DD am HH:MI') 수업일수
from dual;
--날짜형 주의점 : 시분초정보 포함
select hire_date
from employees
--where hire_date>'08/01/01'; --2008년 1월 1일보다 큰 날짜가 아닌 2008년 1월 1일 0시 0분 0초 이후 다 포함.
where to_date(hire_date,'yy/mm/dd')>to_date('08/01/01','yy/mm/dd');

--------------------------------------------------------------------------------------------
--NULL관련함수
--nvl()
--nvl2( , , )
--사원들중에 관리자가 없는 사원을 출력하시오.
select *
from employees
where manager_id is null;
--관리자가 없는 사원은 0, 잇는 사원은 그대로 출력하시오.
select employee_id,nvl(manager_id,0)
from employees;
--관리자가 없는 사원은 '관리자 없음', 잇는 사원은 그대로 출력하시오.
select employee_id,nvl(to_char(manager_id),'관리자 없음') 관리자
from employees;
--관리자가 없는 사원은 '관리자 없음', 잇는 사원은 '관리자 있음'으로 출력하시오.
select employee_id,nvl2(manager_id,'관리자 있음','관리자 없음') 관리자
from employees;
--nullif: 인자1과 인자2로 사용한 값이 같은경우 null반환, 다르면 인자1값을 반환
select employee_id,nullif(salary,24000)
from employees;
----------------------------------------------------------------------------
--sql은 변수언언,조건문처리,반복문처리 못함.
--조건 함수 : decode()
--관리자가 없는 사원은 '관리자 없음', 잇는 사원은 '관리자 있음'으로 출력하시오.
select employee_id, decode(manager_id,null,'관리자없음','관리자있음')--if(manager_id==null){관리자없음 출력} else{관리자있음 출력}
from employees;

--부서번호가 80이면 '영업부', 60이면 'IT부', 그외의값이면 '그외의 부서' 출력하시오.
select decode(department_id,80,'영업부',60,'IT부','그외의부서')
from employees;
--조건절 : case
--case when then
--     when then
--     else 
--end  
select employee_id, case when manager_id is null then '관리자없음'
                         else'관리자있음'
                    end
from employees;

select employee_id, case department_id when 80 then '영업부'
                                      when 60 then 'IT부'
                                      else'그외의부서'
                                      end
from employees;
--사원의 사번,급여,급여등급을 출력하시오
--등급은 급여가 10000이상인 경우 'A',5000이상인 경우 'B',5000미만이면 'C'등급이다.
select employee_id,salary, case when salary>=10000 then 'A'
                                when salary>=5000 then 'B'
                                else 'C'
                                end as 급여등급
from employees;