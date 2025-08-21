--데이터조작어 : insert/update/delete
-------------------------------------------------------------------------
--insert
insert into customer values('id1','p1','n1','a1');
insert into customer(id,pwd) values ('id2','p2'); --id2 p2 null null
insert into customer values ('id3','p3','n3',null); --id3 p3 n3 null
insert into customer values ('id4','p4','n4','');--id4 p4 n4 null
select * from customer;
------------------------------------------------------------------------
--update
update customer 
set  name='이치형'
where id='id3';

select * from customer;

update customer
set address='경기도',name = '이치형'
where id='id2';

select * from customer;

update customer
set address=null;

select * from customer;
-----------------------------------------------------------------
--delete: 행삭제 
delete from customer
where name = '이치형';

select * from customer;
-------------------------------------------------------------
--제약조건 확인
insert into t2 values (null,'a1','b2'); --null을 못 넣으므로 오류.
--unique 제약조건 위배
insert into t2 values ('a1','b1',2);
insert into t2 values ('a1','b1',3); --중복이 허용 안되므로 오류.
--primary key 제약조건 위배
select * from t2;
insert into t2 values ('a2','b2',2); --pk이므로 중복 안됨
insert into t2 values ('a2','b2',null); --pk이므로 null안됨.
--check 위배
insert into t3 values ('a',0); --check에 위배되므로 오류.
--fk 제약조건 위배
insert into t4 values ('a1',10); --fk 위배
------------------------------------------------------------------
delete from customer;
insert into customer values('id1','p2','n3','a4');
insert into customer values('id1','p2','n3','a4');--중복이므로 추가안됨.