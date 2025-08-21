--�������Լ�
--����:LENGTH()
SELECT LENGTH('����Ŭ'), LENGTHB('����Ŭ') FROM dual;
SELECT employee_id, first_name, LENGTH(first_name)
FROM employees;
--�̸��� 8�ڸ��̻��� ������� ���, �̸��� ����Ͻÿ�
SELECT employee_id, first_name
FROM employees
WHERE LENGTH(first_name)>=8;

--�빮�ڷ� ��ȯ: UPPER(), �ҹ��ڷ� ��ȯ: LOWER(), ù���ڸ� �빮�ڷ� ��ȯ: INITCAP()
SELECT UPPER('heLLo'), LOWER('heLLo'), INITCAP('heLLo')
FROM dual;

--Ư�������� ��ġ��ȯ : INSTR()
SELECT INSTR('hellojava', 'a') --7
      ,INSTR('hellojava', 'a', 8) --9
      ,INSTR('hellojava', 'b') --0
      ,INSTR('hellojava', 'a', -1)  --9
      ,INSTR('hellojava', 'a', -1, 2) --7
FROM dual;

--�κй��ڿ� ��ȯ : SUBSTR()
SELECT SUBSTR('hellojava', 2, 6) --elloja
    , SUBSTR('hellojava', 2) --ellojava
FROM dual;

--���ڿ� ���� : TRIM()
SELECT TRIM( LEADING 'a' FROM 'aABCaDEFaHa') --���� ���� 'a'����
      ,TRIM( TRAILING 'a' FROM 'aABCaDEFaHa') --������ ���� 'a'����
      ,TRIM( BOTH 'a' FROM 'aABCaDEFaHa') --���ʿ����� ���� 'a'����
      ,TRIM( BOTH 'a' FROM 'aaaABCaaDEFaaa')
FROM dual;

--���ڿ� ���̱� : LPAD, RPAD
SELECT LPAD('abc', 5, '*')
      ,RPAD('abc', 5, '*')
      ,RPAD(LPAD('abc', 5, '*'), 7, '*')
FROM dual;

--���ڿ� ġȯ�Լ� : REPLACE(), TRANSLATE()
SELECT REPLACE('JACK and JUE', 'J', 'BL') --J�� BL�� ��ȯ
      ,TRANSLATE('JACK and JUE', 'J', 'BL') --J�� B��  ��ȯ
      ,REPLACE('BCCARD', 'BC', 'KB')
      ,TRANSLATE('BCCARD', 'BC', 'KB')
FROM dual;
-----------------------------------------------------------------
--�������Լ�
--�������� ��ȯ : MOD()
SELECT 3+4, 3-4, 3*4, 3/4, MOD(3, 4)  --7	-1	12	0.75	3
FROM dual;
--�ݿø��� �� ��ȯ : ROUND()
SELECT ROUND(45.923) --46
      ,ROUND(45.923, 0) --46 :���� �ڸ������� ǥ��
      ,ROUND(45.923, 2) --45.92 : �Ҽ�������2�ڸ����� ǥ�� 
      ,ROUND(45.923, -1) --50 : ���� �ڸ������� ǥ��
FROM dual;

--������ �� ��ȯ : TRUNC()
SELECT TRUNC(45.923) -- 45
      ,TRUNC(45.923, 0) -- :45 ���� �ڸ������� ǥ��
      ,TRUNC(45.923, 2) -- : 45.92 �Ҽ�������2�ڸ����� ǥ�� 
      ,TRUNC(45.923, -1) -- : 40 ���� �ڸ������� ǥ��
FROM dual;

--1. �̸��� ��ҹ��ڱ��о��� 'e'�� ������ ������� ���, �̸��� ����Ͻÿ�. (OR������ ������)

--2. �Ǳ޿�(�޿�+(�޿�*�����)�� 10000���� ���� �Ǳ޿��� �޴� ������� ���, �޿�, �����, �Ǳ޿��� ����Ͻÿ�
--��, �Ǳ޿��� �Ҽ�������2�ڸ����� �ݿø��ϰ� �Ǳ޿��� ���� �޴� �������� ����Ѵ�




--��¥���Լ�
--����ȯ�Լ�
--NULL�����Լ�