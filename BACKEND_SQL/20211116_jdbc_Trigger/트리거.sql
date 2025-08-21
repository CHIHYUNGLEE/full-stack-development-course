create table point(
    point_id varchar2(10) primary key,
    point_score number(3)
);
select * from point;
---------------------------------------------------
--���� �߰��Ǹ� ����Ʈ�� �ڵ��߰��ȴ�.
create or replace trigger trig1
after insert on customer
for each row
begin
    insert into point values (:new.id, 0);
end;

insert into customer(id,pwd) values ('test','p');
select * from customer; 
--����Ʈ �ڵ��߰��Ǿ����� Ȯ��
select * from point;
--------------------------------------------------------
--�ֹ��⺻�����߰��Ǹ� ����Ʈ�� 1�� �����Ѵ�.
create or replace trigger trig2
after insert on order_info
for each row
begin
    update point set point_score = point_score+1 where point_id = :new.order_id;
end;

insert into order_info(order_no,order_id,order_dt) values (order_seq.nextval,'test',sysdate);

select * from point;