--���������۾� : insert/update/delete
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
set  name='��ġ��'
where id='id3';

select * from customer;

update customer
set address='��⵵',name = '��ġ��'
where id='id2';

select * from customer;

update customer
set address=null;

select * from customer;
-----------------------------------------------------------------
--delete: ����� 
delete from customer
where name = '��ġ��';

select * from customer;
-------------------------------------------------------------
--�������� Ȯ��
insert into t2 values (null,'a1','b2'); --null�� �� �����Ƿ� ����.
--unique �������� ����
insert into t2 values ('a1','b1',2);
insert into t2 values ('a1','b1',3); --�ߺ��� ��� �ȵǹǷ� ����.
--primary key �������� ����
select * from t2;
insert into t2 values ('a2','b2',2); --pk�̹Ƿ� �ߺ� �ȵ�
insert into t2 values ('a2','b2',null); --pk�̹Ƿ� null�ȵ�.
--check ����
insert into t3 values ('a',0); --check�� ����ǹǷ� ����.
--fk �������� ����
insert into t4 values ('a1',10); --fk ����
------------------------------------------------------------------
delete from customer;
insert into customer values('id1','p2','n3','a4');
insert into customer values('id1','p2','n3','a4');--�ߺ��̹Ƿ� �߰��ȵ�.