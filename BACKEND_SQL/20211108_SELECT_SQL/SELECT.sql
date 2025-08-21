--from where groupby having select order by
SELECT * FROM employees;

SELECT employee_id,first_name,salary,hire_date
FROM employees;


--�÷� ��Ī�ֱ� : heading�� ��Ī���� ��Ÿ��,���� �̸� �ٲ�.heading�� �⺻ �빮�ڷ� ��µ�.
SELECT employee_id ���, first_name "��� �̸�",salary , hire_date "hiredate"
FROM employees;

--���ڿ� ��ȣ ''
--���ڿ� ���տ����� ||

SELECT employee_id, first_name,last_name, first_name || last_name, first_name ||'-'|| last_name "��� ����"
from employees;
-----------------------------------------------
--�ڷ���
--������  CHAR,VARCHAR2
--������  NUMBER 
--��¥��  DATE, TIMESTAMP

--������
--��������� : +, -, *, /
--�񱳿����� : >, <, >=, <=, =, <>
--���Կ����� : ����
--�������� : AND , OR , NOT
--����������,���׿����� : ����.
--��ȣ������ : ()   ���� �켱 ������ ���̴µ� ���.
--between������ : <= and >=�� ����.
--IN������ : OR�� ����.

--LIKE���ڿ� ó���� �������� ���� -> % : 0���̻��� ���� , _ : 1���� ����

-----------------------------------------------
--Ư�� �� �����ϱ� : WHERE
--�޿��� 5000�̻��� ������� ���,�̸�,�޿��� ����Ͻÿ�.

SELECT employee_id, first_name, salary
From employees
WHERE salary>=5000;

--�޿��� 12�� ���Ѱ��� 100000�̻��� ������� ���,�̸�,�޿�,12��ġ �޿��� ����Ͻÿ�.

SELECT employee_id, first_name, salary, salary*12
From employees
WHERE salary * 12>=100000;

--�޿��� 5000�̻� 10000������ ������� ���, �̸�, �޿��� ����Ͻÿ�

SELECT  employee_id, first_name, salary
FROM employees
WHERE salary>=5000 AND salary<=10000;

SELECT  employee_id, first_name, salary
FROM employees
WHERE salary BETWEEN 5000 AND 10000;

--������� ���,�μ���ȣ
SELECT employee_id,department_id
FROM employees;

--�μ���ȣ�� 90�̰ų�, 30�̰ų� 20�� ������� ���,�μ���ȣ�� ����Ͻÿ�.

SELECT employee_id,department_id
FROM employees
WHERE department_id = 90 OR department_id=30 OR department_id=20;

SELECT employee_id,department_id
FROM employees
WHERE department_id IN(90,30,20);

--�μ���ȣ�� 90�̰ų�, 30�̰ų� 20�̰� �޿��� 5000�̻� 10000������ ������� ���, �̸�, �޿�,�μ���ȣ�� ����Ͻÿ�
SELECT  employee_id, first_name, salary, department_id
FROM employees
WHERE (department_id = 90 or department_id=30 or department_id=20) and (salary>=5000 and salary<=10000);

SELECT  employee_id, first_name, salary, department_id
FROM employees
WHERE department_id IN(90,30,20) AND salary BETWEEN 5000 AND 10000;

--�μ���ȣ�� 90�ƴϰ� 30�ƴϰ� 20�ƴ� �μ��� ��� �̸� �μ���ȣ�� ����Ͻÿ�.
SELECT  employee_id, first_name, department_id
FROM employees
where department_id <>90 AND department_id <>30 AND department_id <>20;

SELECT  employee_id, first_name, department_id
FROM employees
where department_id NOT IN(90, 30, 20);

--�������̺�
SELECT *FROM jobs;
--manager�� ������ �������� ����Ͻÿ�.
SELECT *
FROM jobs
WHERE JOB_TITLE LIKE '%Manager'; 
--����� �̸��� 'e'�� ������ ������� ����� �̸��� ����Ͻÿ�.
SELECT  employee_id, first_name
FROM employees
WHERE first_name LIKE '%e%';
--����� �Ի����ڸ� ����Ͻÿ�
SELECT hire_date
FROM employees;
--����� �Ի�⵵�� 07�⵵�� ����� ����� �Ի����� ����Ͻÿ�.
SELECT employee_id,hire_date
FROM employees
WHERE hire_date LIKE '07%';

SELECT employee_id,hire_date
FROM employees
WHERE hire_date BETWEEN '07/01/01' AND '07/12/31';

--�Ի���� 11���� ����� ���,�Ի����ڸ� ����Ͻÿ�.
SELECT employee_id,hire_date
FROM employees
WHERE hire_date LIKE '__/11/__';

-----------------------------------------------

--ORDER BY : ����, ��������,��������
--1�� ����,2������,....���İ���
--�÷��� ��ġ��밡��, �÷��� ��Ī��밡��.
--SELECT���� ���� �͵� ��밡��.

--���� �޿��� �޴� ������� ���, �̸�, �޿��� ����Ͻÿ�.
SELECT  employee_id, first_name , salary
FROM employees
ORDER BY salary;

--���� �޿��� �޴� ������� ���, �̸�, �޿��� ����Ͻÿ�. �� �޿��� ���� ��� �̸��� ���������� ����Ͻÿ�.
SELECT  employee_id ���, first_name �̸�, salary �޿�
FROM employees
ORDER BY �޿� DESC, �̸� DESC; --��Ī���

SELECT  employee_id , first_name , salary 
FROM employees
ORDER BY salary DESC, first_name DESC; 

SELECT  employee_id , first_name , salary 
FROM employees
ORDER BY 3 DESC, first_name DESC; 

--���� �޿��� �޴� ������� ���, �̸��� ����Ͻÿ�.
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

--DISTINCT : �ߺ�����
--����� �μ���ȣ�� ����Ͻÿ�.
SELECT DEPARTMENT_ID
FROM employees;

--����� ���� �μ���ȣ�� �ߺ����� ����Ͻÿ�.
SELECT DISTINCT department_id, job_id
FROM employees
order by department_id,job_id;

---------------------------------------------
--NULL : �ƹ����� �ƴϴ�
SELECT employee_id, first_name, last_name, department_id, salary,commission_pct
FROM employees;


--�μ���ġ �����ʴ� ����� ���,�̸�,�μ���ȣ�� ����Ͻÿ�.
SELECT employee_id, first_name, department_id
FROM employees
WHERE department_id = null; -- null�� �񱳿����ڷ� ���ϸ� �ȵ�.(x)

SELECT employee_id, first_name, department_id
FROM employees
WHERE department_id is null;

SELECT employee_id, first_name, department_id
FROM employees
WHERE department_id is not null;

--������� ���, �̸�, �޿�, �����, �Ǳ޿��� ����Ͻÿ�. ��, �Ǳ޿��� (�޿�*�����)+�޿�
SELECT employee_id,first_name,salary,commission_pct,salary+(salary*commission_pct) �Ǳ޿�
FROM employees;

--null���� �Լ� : nvl(ǥ����, ��ȯ��) ǥ������ null�̸� ��ȯ���� ��ȯ�ϰ�, ǥ������ null�� �ƴϸ� ǥ���İ��� ��ȯ�Ѵ�.
SELECT employee_id,first_name,salary,commission_pct,salary+(salary*NVL(commission_pct,0)) �Ǳ޿�
FROM employees;

--���� �μ���ȣ�� ���� ������� ����Ͻÿ�.
SELECT employee_id, department_id
FROM employees
ORDER BY department_id; --���������ϸ� null�� �������� ���. dbms���� �ٸ�.

-------------------------------------
--ROWNUM : ���ȣ���� ���� �ǻ�Į��.
SELECT rownum, employee_id from employees;
--ó�������� from select order by�̹Ƿ� ���׹��� ��.
SELECT rownum, employee_id, salary from employees order by salary desc;

--�޿��� ���̹޴� ������ 5�� ����Ͻÿ�.
SELECT employee_id, salary
from EMPLOYEES
where rownum <=10
order by salary desc;


