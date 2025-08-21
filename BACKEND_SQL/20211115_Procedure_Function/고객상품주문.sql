--각 테이블에 정보넣기
insert into customer values ('id1','p1','이치형','서울시');
insert into customer values ('id2','p2','삼치형','');
insert into customer values ('id3','p3','사치형','경기도');
select * from customer;


insert into product values ('c0001','아메리카노','1000');
insert into product values ('c0002','ICE아메리카노','1000');
insert into product values ('c0003','라떼','1500');
insert into product values ('c0004','ICE라떼','1500');
select * from product;

insert into order_info values (1,'id2','21/11/10');
insert into order_info values (2,'id3','21/11/10');
insert into order_info values (3,'id2','21/11/10');
select * from order_info;

insert into order_line values (1,'c0002',2);
insert into order_line values (1,'c0003',1);
insert into order_line values (2,'c0002',1);
insert into order_line values (3,'c0001',1);
insert into order_line values (3,'c0002',1);
select * from order_line;

--주문번호, 주문일자,주문상품번호,주문상품명, 상품 가격, 주문수량을 출력하시오.
select l.order_no, i.order_dt,l.order_prod_no,p.prod_name,p.prod_price,l.order_quantity
from order_line l
join product p on p.prod_no = l.order_prod_no
join order_info i on l.order_no = i.order_no
order by order_no desc, prod_name ; 

--주문번호, 주문일자,주문상품번호,주문상품명, 상품 가격, 주문수량을 출력하시오.
--'id2' 주문정보를 출력하기
select l.order_no, i.order_dt,l.order_prod_no,p.prod_name,p.prod_price,l.order_quantity
from order_line l
join product p on p.prod_no = l.order_prod_no
join order_info i on l.order_no = i.order_no
where order_id='id2'
order by order_no desc, prod_name; 
------------------------------------------------------------------------------------------------
--뷰 생성
create or replace view order_view
as
select l.order_no, i.order_id ,i.order_dt,l.order_prod_no,p.prod_name,p.prod_price,l.order_quantity
from order_line l
join product p on p.prod_no = l.order_prod_no
join order_info i on l.order_no = i.order_no
order by order_no desc, prod_name ;

--user_view에 뷰정보가 저장된다.
select * from user_tables;
select * from user_views;

--주문번호, 주문일자,주문상품번호,주문상품명, 상품 가격, 주문수량을 출력하시오.
--'id2' 주문정보를 출력하기
select * 
from order_view
where order_id = 'id2';

------------------------------------------------------------
--시퀀스
create sequence order_seq;
drop sequence order_seq;

create sequence order_seq
start with 4
increment by 2
maxvalue 10
cycle 
cache 3;

select order_seq.nextval from dual;--4
select order_seq.nextval from dual;--6
select order_seq.nextval from dual;--8
select order_seq.nextval from dual;--10
select order_seq.nextval from dual;--ㅡmin값 1
select order_seq.nextval from dual;--3
select order_seq.currval from dual;--3

create sequence order_seq
start with 4
increment by 2
maxvalue 10
cycle 
cache 3;
insert into order_info(order_no,order_id,order_dt) values (order_seq.nextval,'id2',sysdate);
insert into order_line(order_no,order_prod_no,order_quantity) values (order_seq.currval,'c0001',1);
select * from order_view;

drop sequence order_seq;
create sequence order_seq
start with 5;