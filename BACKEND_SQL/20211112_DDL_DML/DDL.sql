--Data Definition Language
--��ü ���� create,���� alter, ����drop
--���̺���� ���ڷ� �����ϸ� �ȵ�, ����� ��뵵 �ȵ�.(date, number,order)

--��ü ����
create table t1(
    a char(5),
    b varchar(5),
    c number(5),
    d number(5,2), 
    e date
);

--���̺���Ȯ��
desc t1; 

--��ü ��������
alter table t1
add f varchar2(2); --�÷� �߰�

--�÷� ����
alter table t1
drop column f;

desc t1;

--�÷� �ڷ���/�ڸ��� ����
alter table t1
modify d number(7,2); 

--�÷� �� �ٲٱ�
alter table t1
rename column d to dd; 

desc t1;

--���̺� �̸� �ٲٱ�
rename t1 to tt;
desc tt;

--���̺� ����
drop table tt;
-----------------------------------------------

--�����̺� ���� : customer
--���̵�Į�� : id varchar2(10)
--��й�ȣĮ�� : pwd varchar2(10)
--�̸�Į�� : name varchar(12)
--�ּ�Į�� : address varchar(30)
-------------------------------------------------
create table customer(
    id varchar2(10),
    pwd varchar2(10),
    name varchar(12),
    address varchar(30)
);
-----------------------------------------------
--���Ἲ �������� integrity constraint
--not null, unique,primary key, foreign key, check
--not null : �ΰ� ���Ծȵ�.
--unique : �ߺ���� ����.
--primary key : not null+ unique
--foreign key : ���̺��� pk�� ����.
--check : �� ����

--�������� ���� ���
--�÷� ���� ��������
create table t2(
    a char(5) constraint t2_a_Nn not null,
    b varchar2(5) constraint t2_b_uq Unique,
    c number(5) constraint t2_c_pk primary key
);
--���̺��� �������� ���� -> not null���������� ���� ����.
create table t3(
    a varchar2(2),
    b number(5),
    constraint t3_a_pk primary key(a),
    constraint t3_b_ck check (b > 0)
);
create table t4(
    a varchar2(2) constraint t4_a_pk primary key,
    b number(5), --constraint t4_b_fk references t2(c)
    constraint t4_b_fk foreign key(b) references t2(c)
);
------------------------------------------------------
desc customer;
--���̺� �������� �ϸ鼭 �������� �ο�����
alter table customer
    add constraint customer_id_pk primary key(id);

alter table customer
    modify pwd constraint customer_pwd_nn not null;
--------------------------------------------------------
create table product(
    prod_no varchar2(5) constraint product_prod_no_pk primary key,
    prod_name varchar(20) not null,
    prod_price number(7) not null constraint product_prod_price_ck check (prod_price>0)
);

create table order_info(
    order_no number constraint order_info_order_no_pk primary key,
    order_id varchar2(10) not null,
    order_dt date not null,
    constraint order_info_order_id_fk foreign key(order_id) references customer(id)
);

create table order_line(
    order_no number constraint order_line_order_no_fk references order_info(order_no),
    order_prod_no varchar2(5) 
    constraint order_line_order_prod_no_fk references product(prod_no),
    order_quantity number(2) not null
    constraint order_line_order_quantity_ck check (order_quantity>0),
    constraint order_line_order_no_prod_pk primary key (order_no,order_prod_no) 
);
-------------------------------------------------
--��ųʸ� ���̺�����
desc user_tables;
select * from user_tables;
--��ųʸ� ������������
select * from user_constraints;
select * from user_constraints where lower(constraint_name) = 'order_line_order_no_prod_pk';

--�������� �����ϱ�
alter table order_line
drop constraint order_line_order_quantity_ck;

--�������� �߰��ϱ�
alter table order_line
add constraint order_line_order_quantity_ck check(order_quantity>0);