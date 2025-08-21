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

--2. 실급여(급여+(급여*수당률)가 10000보다 많은 실급여를 받는 사원들의 사번, 급여, 수당률, 실급여를 출력하시오
--단, 실급여는 소숫점이하2자리에서 반올림하고 실급여를 많이 받는 사람들부터 출력한다




--날짜형함수
--형변환함수
--NULL관련함수