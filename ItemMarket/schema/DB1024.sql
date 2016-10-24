--����� ����
create table userinfo (
 id varchar2(20) not null constraint id_pk primary key,   -- ���̵�
 tel varchar2(20) not null,   --��ȭ��ȣ(�޴���)
 email varchar2(40), -- �̸��� �ּ� 
 location varchar2(40) not null,  -- �������ּ�
 cash number(7)  -- ���ݾ� ����
)


--�⺻ ������
insert into userinfo (id,tel,email,location,cash) values ('aaa','01003441366','awaynee@hanmail.net','����� ��õ��',190000);

insert into userinfo (id,tel,email,location,cash) values ('bbb','01011112222','bbbb@naver.com','����� ���α�',90000);
insert into userinfo (id,tel,email,location,cash) values ('ccc','01033334444','cccc@gmail.com','����� ���۱�',290000);
insert into userinfo (id,tel,email,location,cash) values ('ddd','01055556666','dddd@hanmail.net','����� ������',390000);
insert into userinfo (id,tel,email,location,cash) values ('eee','01077778888','eeee@naver.com','����� ������',490000);
insert into userinfo (id,tel,email,location,cash) values ('fff','01088889999','ffff@gmail.com','����� ������',590000);

select * from  userinfo; 


--������ �غ�
grant create sequence to lee;   --(���� ���� ���� )

--����������
create sequence borderinfo_seq;  --(���̺�_seq)

--borderinfo_seq.nextval �����÷��� ����--


--��ü �Խ���
create table borderinfo(

id varchar2(20) not null constraint border_id_fk references userinfo(id), -- userinfo ����
border_number number(5) constraint bordernumber_pk primary key,  -- borderinfo ����
content varchar2(30), -- �� 
trade varchar2(20) not null,   -- �Ǹ��� �Ǵ� ������ 
money number(7),  --�ݾ� ���� 
daydate date not null,  -- �ø� ��¥ 
category varchar2(30) not null CONSTRAINT borderinfo_category_unique unique,    --ī�װ� �з� 
sub_category varchar2(30) not null CONSTRAINT borderinfo_sub_category_unique unique  -- ���� ī�װ� �з� 

)


--������ �غ�
insert into borderinfo (id,border_number,content,trade,money,daydate,category,sub_category) values ('aaa',borderinfo_seq.nextval,'�����޸Ţ���','�Ǹ���',1000,sysdate,'������ǰ','�޴���');
insert into borderinfo (id,border_number,content,trade,money,daydate,category,sub_category) values ('bbb',borderinfo_seq.nextval,'��������ó�бޱ�����','�Ǹ���',44000,sysdate,'������','Cello');
insert into borderinfo (id,border_number,content,trade,money,daydate,category,sub_category) values ('ccc',borderinfo_seq.nextval,'�������� �ǸŢ�','�Ǹ���',3300,sysdate,'�Ƿ�','û����');


select * from borderInfo;


--���� ���� ���� ,���� ���� 
create table myhistory(
  money number(7) not null,    --���ž� 
  daydate date not null,  -- ���� ��¥  
  buyer constraint buyer_fk references userinfo(id),  -- ������
  seller constraint seller_fk references userinfo(id), -- �Ǹ��� 
  content varchar2(30),   --�� 
  category varchar2(30) constraint category_fk REFERENCES borderinfo(category),    -- ī�װ� �з�  
  sub_category varchar2(30) constraint subcategory_fk REFERENCES borderinfo(sub_category)   -- ���� ī�װ� �з� 

) 


--������ �غ�
insert into myhistory (money,daydate,buyer,seller,content,category,sub_category) values ('1100',sysdate,'bbb','aaa','���Ÿ���Դϴ�','������ǰ','�޴���');
insert into myhistory (money,daydate,buyer,seller,content,category,sub_category) values ('3300',sysdate,'fff','eee','���Ÿ���Դϴ�','�Ƿ�','û����');

select * from myhistory;


--�̹��� �Խ��� 
create table img_border( 
   border_number number(5) constraint img_bordernumber references borderinfo(border_number),   -- borderinfo �Խù�ȣ 
   img varchar2(20)  -- �̹��� �̸� 
)
--������ �غ�
insert into img_border(border_number,img) values (1, '�̹���1.jpg');
insert into img_border(border_number,img) values (2, '�̹���2.jpg');

select * from img_border;


-- �޽��� �� �ʿ��� ���̺� 
create table  messenger(
  sendercounterparty varchar2(20) not null constraint  sendercounterpart_fk references userinfo(id),  --�޽��� ������ ��� �� �����
  receivercounterparty varchar2(20) not null constraint receivercounterpart_fk references userinfo(id),  -- �޴� ����� ����� 
  content varchar2(30),
  daydate date not null

);

-- ������ �غ� 
  insert into messenger (sendercounterparty,receivercounterparty,content,daydate) values ('bbb','ccc','�����սô�',sysdate);
  insert into messenger (sendercounterparty,receivercounterparty,content,daydate) values ('ddd','eee','�����սô�',sysdate);
  insert into messenger (sendercounterparty,receivercounterparty,content,daydate) values ('aaa','fff','�����սô�',sysdate);

select * from messenger;



--��ȣ�� �ʿ��� ���� 
create table trading (

  buyer constraint  trading_buyer_fk references userinfo(id), -- ������ 
  seller constraint trading_seller_fk references userinfo(id),  -- �Ǹ��� 
  cash number(7),  -- ���Ҿ�
  border_number constraint bordernumber_fk references borderinfo(border_number) primary key, --�� �Խ� ��ȣ
  daydate date not null -- ��¥ 
  
) 
 insert into trading (buyer,seller,cash,border_number,daydate) values ('ddd','aaa',22000,1,sysdate);
 insert into trading (buyer,seller,cash,border_number,daydate) values ('eee','bbb',33000,2,sysdate);
 insert into trading (buyer,seller,cash,border_number,daydate) values ('fff','ccc',11000,3,sysdate);
select * from trading;

drop table myhistory;
drop table img_border;
drop table messenger;
drop table borderinfo;
drop table userinfo;
drop table trading;
