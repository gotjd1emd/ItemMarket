--����� ���� //  password varchar2 �߰� 
create table userinfo (
 id varchar2(20) not null constraint id_pk primary key,-- ���̵�
 password varchar2(20) not null,
 tel varchar2(20) not null,   --��ȭ��ȣ(�޴���)
 email varchar2(40), -- �̸��� �ּ� 
 location varchar2(40) not null,  -- �������ּ�
 cash number(7)  -- ���ݾ� ����
 
);


--�⺻ ������
insert into userinfo (id,tel,email,location,cash) values ('aaa','01093441366','awaynee@hanmail.net','����� ��õ��',190000);
insert into userinfo (id,tel,email,location,cash) values ('bbb','01011112222','bbbb@naver.com','����� ���α�',90000);
insert into userinfo (id,tel,email,location,cash) values ('ccc','01033334444','cccc@gmail.com','����� ���۱�',290000);
insert into userinfo (id,tel,email,location,cash) values ('ddd','01055556666','dddd@hanmail.net','����� ������',390000);
insert into userinfo (id,tel,email,location,cash) values ('eee','01077778888','eeee@naver.com','����� ������',490000);
insert into userinfo (id,tel,email,location,cash) values ('fff','01088889999','ffff@gmail.com','����� ������',590000);

insert into userinfo (id,tel,email,location,cash) values ('ggg','01023234545','ggg@hanmail.net','����� ���빮��',670000);
insert into userinfo (id,tel,email,location,cash) values ('hhh','01012122323','hhh@naver.com','����� ������',350000);
insert into userinfo (id,tel,email,location,cash) values ('iii','01045456767','iii@gmail.com','����� �߱�',210000);
insert into userinfo (id,tel,email,location,cash) values ('jjj','01078784343','jjj@hanmail.net','����� �߶���',750000);
insert into userinfo (id,tel,email,location,cash) values ('kkk','01087879898','kkk@naver.com','����� ���ʱ�',640000);
insert into userinfo (id,tel,email,location,cash) values ('lll','01013133535','lll@gmail.com','����� ���Ǳ�',180000);


select * from  userinfo; 
  
--������ �غ�
grant create sequence to lee;   --(���� ���� ���� )

--����������
create sequence borderinfo_seq;  --(���̺�_seq)

--borderinfo_seq.nextval �����÷��� ����--


--��ü �Խ���  // trade ���� ��ſ� itemName �߰� , itemState ��ǰ ���º��� �߰� 
create table borderinfo(

id varchar2(20) not null constraint border_id_fk references userinfo(id), -- userinfo ����
border_number number(5) constraint bordernumber_pk primary key,  -- borderinfo ����
content varchar2(30), -- �� 

itemName varchar(40) constraint borderinfo_unique unique,
money number(7),  --�ݾ� ���� 
dayDate date not null,  -- �ø� ��¥ 
category varchar2(30) not null CONSTRAINT borderinfo_category_unique unique,    --ī�װ� �з� 
sub_category varchar2(30) not null CONSTRAINT borderinfo_sub_category_unique unique,-- ���� ī�װ� �з�
itemState varchar2(20) 

);

--drop table borderInfo;

--������ �غ�
insert into borderInfo (id,border_number,content,itemName,money,dayDate,category,sub_Category,itemState) values ('aaa',borderInfo_seq.nextval,'�����޸Ţ���','������S6',1000,sysdate,'������/������ǰ','�޴���','���Ŵ����');
insert into borderInfo (id,border_number,content,itemName,money,dayDate,category,sub_Category,itemState) values ('bbb',borderInfo_seq.nextval,'��������ó�бޱ�����','T-100',44000,sysdate,'������','alton','���Ŵ����');
insert into borderInfo (id,border_number,content,itemName,money,dayDate,category,sub_Category,itemState) values ('ccc',borderInfo_seq.nextval,'�������� �ǸŢ�','CalvinKlein',3300,sysdate,'�Ƿ�','û����','���Ŵ����');

--insert into borderInfo (id,border_number,content,itemName,money,dayDate,category,sub_Category,itemState) values ('ddd',borderInfo_seq.nextval,'��������ã���ϴ٢�','skirt',1000,sysdate,'�Ƿ�','�����Ƿ�','���Ŵ����');
insert into borderInfo (id,border_number,content,itemName,money,dayDate,category,sub_Category,itemState) values ('eee',borderInfo_seq.nextval,'�������� ��ôº�!��','�񵵸�',44000,sysdate,'�Ǽ�����','��Ÿ','���Ŵ����');
insert into borderInfo (id,border_number,content,itemName,money,dayDate,category,sub_Category,itemState) values ('fff',borderInfo_seq.nextval,'������ ã�ư��ϴ�.��','���۶�',3300,sysdate,'�Ǽ�����','��Ÿ','���Ŵ����');

--insert into borderInfo (id,border_number,content,itemName,money,dayDate,category,sub_Category,itemState) values ('ggg',borderInfo_seq.nextval,'�������� ��������','����ä',1000,sysdate,'������','����','���Ŵ����');
insert into borderInfo (id,border_number,content,itemName,money,dayDate,category,sub_Category,itemState) values ('hhh',borderInfo_seq.nextval,'���������� �ǸŢ���','�����ϵ�',44000,sysdate,'������/������ǰ','��ǻ��','���Ŵ����');
insert into borderInfo (id,border_number,content,itemName,money,dayDate,category,sub_Category,itemState) values ('iii',borderInfo_seq.nextval,'���ù谡���մϴ�.��','�Һ�',3300,sysdate,'��Ȱ/����','Ŀ��','���Ŵ����');


select * from borderInfo;

--�̹��� �Խ��� 
create table img_Border( 
   border_Number number(5) constraint img_Bordernumber_fk references borderinfo(border_Number),   -- borderinfo �Խù�ȣ 
  img varchar2(20)  -- �̹��� 
);


--������ �غ�     

--borderifo �˻��� border_Number �����ּ���~          
select * from borderinfo;
                                              --  �� 
insert into img_Border(border_Number,img) values (21, '�̹���1.jpg');
insert into img_Border(border_Number,img) values (22, '�̹���2.jpg');
insert into img_Border(border_Number,img) values (23, '�̹���3.jpg');
insert into img_Border(border_Number,img) values (42, '�̹���4.jpg');
insert into img_Border(border_Number,img) values (45, '�̹���5.jpg');
insert into img_Border(border_Number,img) values (46, '�̹���6.jpg');

select * from img_Border;
--drop  table img_Border;
--select * from img_Border;


-- �޽��� �� �ʿ��� ���̺� 
create table  messenger(
  sender varchar2(20) not null constraint  sender_fk references userinfo(id),  --�޽��� ������ ��� 
  receiver varchar2(20) not null constraint receiver_fk references userinfo(id),  -- �޴� ���
  content varchar2(30),
  dayDate date not null

);

-- ������ �غ� 
  insert into messenger (sender,receiver,content,dayDate) values ('bbb','ccc','�����սô�',sysdate);
  insert into messenger (sender,receiver,content,dayDate) values ('ddd','eee','�����սô�',sysdate);
  insert into messenger (sender,receiver,content,dayDate) values ('aaa','fff','�����սô�',sysdate);

select * from messenger;



--��ȣ�� �ʿ��� ���� 
create table trade_history (

  buyer constraint  trading_Buyer_fk references userInfo(id), -- ������ 
  seller constraint trading_Seller_fk references userInfo(id),  -- �Ǹ���
  itemName constraint trading_itemName_fk references borderInfo(itemName),
  cash number(7),  -- ���Ҿ�
  border_number constraint trading_bordernumber_fk references borderinfo(border_number) primary key, --�� �Խ� ��ȣ
  daydate date not null, -- ��¥ 
  trade_state varcher2
  
);

--  insert into trade_history (buyer,seller,itemName,cash,border_number,daydate) values ('fff', 'aaa','������S6',2000,1,'2016-10-24');
--  insert into trade_history (buyer,seller,itemName,cash,border_number,daydate) values ('ddd', 'bbb','T-100',3000,2,'2016-10-24');
--  insert into trade_history (buyer,seller,itemName,cash,border_number,daydate) values ('eee', 'ccc','CalvinKlein',4400,3,'2016-10-24');  
--  drop table trade_history;




--  border Info �˻��� border-number ���ڸ� ������ �ּ���                                               										  --  ��
select * from borderInfo;                                                                                 --  ��
                                                                                                          --  ��
insert into  trade_history (buyer,seller,itemName,cash,border_number,daydate) values ('aaa','ddd','������S6',120000,21,sysdate);
insert into  trade_history (buyer,seller,itemName,cash,border_number,daydate) values ('bbb','fff','T-100',200000,22,sysdate);
insert into  trade_history (buyer,seller,itemName,cash,border_number,daydate) values ('ccc','ggg','CalvinKlein',30000,23,sysdate);
insert into  trade_history (buyer,seller,itemName,cash,border_number,daydate) values ('eee','hhh','�񵵸�',4000,42,sysdate);



  select * from trade_history;


--cash_history table   id, ���ų��� 
create table cash_History (
  id varchar2(20) constraint cash_History_id_fk references userinfo  (id),  -- id 
  itemName varchar2(20) constraint cash_History_itemName_fk references borderInfo(itemName),  -- ��ǰ �̸�
  mileage number(6), -- ���ϸ���
  saveDate date not null, -- ���ϸ��� ������(����������or����=���ſϷ����) 
  current_cash number
  
);

insert into cash_history (id,itemName,mileage,saveDate) values ('aaa','CalvinKlein',100,'2016-10-25'); 
insert into cash_history (id,itemName,mileage,saveDate) values ('bbb','������S6',500,'2016-10-25'); 
insert into cash_history (id,itemName,mileage,saveDate) values ('ccc','T-100',900,'2016-10-25'); 


select * from cash_History;


drop table myhistory;
drop table img_Border;
drop table messenger;
drop table borderInfo;
drop table userInfo;
drop table trade_history;
drop table cash_History;

commit;