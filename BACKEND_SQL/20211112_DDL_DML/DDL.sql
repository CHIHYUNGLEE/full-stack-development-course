--Data Definition Language
--객체 생성 create,변경 alter, 삭제drop
--테이블명은 숫자로 시작하면 안됨, 예약어 사용도 안됨.(date, number,order)

--객체 생성
create table t1(
    a char(5),
    b varchar(5),
    c number(5),
    d number(5,2), 
    e date
);

--테이블구조확인
desc t1; 

--객체 구조변경
alter table t1
add f varchar2(2); --컬럼 추가

--컬럼 제거
alter table t1
drop column f;

desc t1;

--컬럼 자료형/자릿수 변경
alter table t1
modify d number(7,2); 

--컬럼 명 바꾸기
alter table t1
rename column d to dd; 

desc t1;

--테이블 이름 바꾸기
rename t1 to tt;
desc tt;

--테이블 제거
drop table tt;
-----------------------------------------------

--고객테이블 생성 : customer
--아이디칼럼 : id varchar2(10)
--비밀번호칼럼 : pwd varchar2(10)
--이름칼럼 : name varchar(12)
--주소칼럼 : address varchar(30)
-------------------------------------------------
create table customer(
    id varchar2(10),
    pwd varchar2(10),
    name varchar(12),
    address varchar(30)
);
-----------------------------------------------
--무결성 제약조건 integrity constraint
--not null, unique,primary key, foreign key, check
--not null : 널값 포함안됨.
--unique : 중복허용 안함.
--primary key : not null+ unique
--foreign key : 테이블의 pk를 참조.
--check : 값 범위

--제약조건 설정 방법
--컬럼 레벨 제약조건
create table t2(
    a char(5) constraint t2_a_Nn not null,
    b varchar2(5) constraint t2_b_uq Unique,
    c number(5) constraint t2_c_pk primary key
);
--테이블레벨 제약조건 설정 -> not null제약조건은 설정 못함.
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
--테이블 구조변경 하면서 제약조건 부여가능
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
--딕셔너리 테이블정보
desc user_tables;
select * from user_tables;
--딕셔너리 제약조건정보
select * from user_constraints;
select * from user_constraints where lower(constraint_name) = 'order_line_order_no_prod_pk';

--제약조건 삭제하기
alter table order_line
drop constraint order_line_order_quantity_ck;

--제약조건 추가하기
alter table order_line
add constraint order_line_order_quantity_ck check(order_quantity>0);