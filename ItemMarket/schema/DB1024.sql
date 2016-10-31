	-- //  password varchar2 
create table userinfo (
 id varchar2(20) not null constraint id_pk primary key,-- 
 password varchar2(20) not null,
 tel varchar2(20) not null,   --
 email varchar2(40), -- 
 location varchar2(40) not null,  -- 
 cash number(7)  -- 
 
);

select * from userinfo;
drop table userinfo;

--
insert into userinfo (id,password,tel,email,location,cash) values ('aaa','1234','01093441366','awaynee@hanmail.net','�꽌�슱�떆 湲덉쿇援�',190000);
insert into userinfo (id,password,tel,email,location,cash) values ('bbb','1234','01011112222','bbbb@naver.com','�꽌�슱�떆 援щ줈援�',90000);
insert into userinfo (id,password,tel,email,location,cash) values ('ccc','1234','01033334444','cccc@gmail.com','�꽌�슱�떆 �룞�옉援�',290000);
insert into userinfo (id,password,tel,email,location,cash) values ('ddd','1234','01055556666','dddd@hanmail.net','�꽌�슱�떆 媛뺣궓援�',390000);
insert into userinfo (id,password,tel,email,location,cash) values ('eee','1234','01077778888','eeee@naver.com','�꽌�슱�떆 媛뺣룞援�',490000);
insert into userinfo (id,password,tel,email,location,cash) values ('fff','1234','01088889999','ffff@gmail.com','�꽌�슱�떆 �늻�썝援�',590000);

insert into userinfo (id,password,tel,email,location,cash) values ('ggg','1234','01023234545','ggg@hanmail.net','�꽌�슱�떆 �꽌��臾멸뎄',670000);
insert into userinfo (id,password,tel,email,location,cash) values ('hhh','1234','01012122323','hhh@naver.com','�꽌�슱�떆 媛뺤꽌援�',350000);
insert into userinfo (id,password,tel,email,location,cash) values ('iii','1234','01045456767','iii@gmail.com','�꽌�슱�떆 以묎뎄',210000);
insert into userinfo (id,password,tel,email,location,cash) values ('jjj','1234','01078784343','jjj@hanmail.net','�꽌�슱�떆 以묐옉援�',750000);
insert into userinfo (id,password,tel,email,location,cash) values ('kkk','1234','01087879898','kkk@naver.com','�꽌�슱�떆 �꽌珥덇뎄',640000);
insert into userinfo (id,password,tel,email,location,cash) values ('lll','1234','01013133535','lll@gmail.com','�꽌�슱�떆 愿��븙援�',180000);
insert into userinfo (id,password,tel,email,location,cash) values ('admin','admin','02123123','admin@gmail.com','�꽌�슱�떆 愿��븙援�',0);
 
update trade_history set trade_state = '嫄곕옒以�' where buyer='bbb' or seller='bbb'

select * from  userinfo; 
  update userinfo set cash=(select cash from userinfo where id='bbb')-15000 where id='bbb'
--
grant create sequence to admin;   --


create sequence borderInfo_seq;  --

--borderinfo_seq.nextval 




create table borderinfo(

id varchar2(20) not null constraint border_id_fk references userinfo(id) on delete cascade, -- userinfo 
border_number number(5) constraint bordernumber_pk primary key,  -- borderinfo
content varchar2(500), -- 

itemName varchar(40) ,
money number(7),  --
dayDate date not null,  --
category varchar2(30) not null ,    --
sub_category varchar2(30) not null ,-- 
itemState varchar2(30) 

);
alter table borderInfo modify (content varchar2(500)); 
drop table borderInfo;

 
insert into borderInfo (id,border_number,content,itemName,money,dayDate,category,sub_Category,itemState) values ('aaa',borderInfo_seq.nextval,'�뼳�뼳湲됰ℓ����','媛ㅻ윮�떆S6',1000,sysdate,'�뵒吏��꽭/媛��쟾�젣�뭹','�쑕���룿','援щℓ��湲곗쨷');
insert into borderInfo (id,border_number,content,itemName,money,dayDate,category,sub_Category,itemState) values ('bbb',borderInfo_seq.nextval,'�뼳�뼳�떦�씪泥섎텇湲됯뎄����','T-100',44000,sysdate,'�뒪�룷痢�','alton','援щℓ��湲곗쨷');
insert into borderInfo (id,border_number,content,itemName,money,dayDate,category,sub_Category,itemState) values ('ccc',borderInfo_seq.nextval,'�뼳理쒖�媛� �뙋留ㅲ�','CalvinKlein',3300,sysdate,'�쓽瑜�','泥�諛붿�','援щℓ��湲곗쨷');

--insert into borderInfo (id,border_number,content,itemName,money,dayDate,category,sub_Category,itemState) values ('ddd',borderInfo_seq.nextval,'�뼳援щℓ�옄李얠뒿�땲�떎��','skirt',1000,sysdate,'�쓽瑜�','�뿬�꽦�쓽瑜�','援щℓ��湲곗쨷');
insert into borderInfo (id,border_number,content,itemName,money,dayDate,category,sub_Category,itemState) values ('eee',borderInfo_seq.nextval,'�뼳媛뺣룞援� �궗�떆�뒗遺�!��','紐⑸룄由�',44000,sysdate,'�븙�꽭�꽌由�','湲고�','援щℓ��湲곗쨷');
--insert into borderInfo (id,border_number,content,itemName,money,dayDate,category,sub_Category,itemState) values ('fff',borderInfo_seq.nextval,'�뼳吏곸젒李얠븘媛묐땲�떎.��','�꽑湲��씪�뒪',3300,sysdate,'�븙�꽭�꽌由�','湲고�','援щℓ��湲곗쨷');
--insert into borderInfo (id,border_number,content,itemName,money,dayDate,category,sub_Category,itemState) values ('ggg',borderInfo_seq.nextval,'�뼳�뼳鍮좊Ⅸ �뿰�씫����','怨⑦봽梨�',1000,sysdate,'�뒪�룷痢�','怨⑦봽','援щℓ��湲곗쨷');
--insert into borderInfo (id,border_number,content,itemName,money,dayDate,category,sub_Category,itemState) values ('hhh',borderInfo_seq.nextval,'�뼳�뼳珥덉�媛��뙋留ㅲ���','�쇅�옣�븯�뱶',44000,sysdate,'�뵒吏��꽭/媛��쟾�젣�뭹','而댄벂�꽣','援щℓ��湲곗쨷');
insert into borderInfo (id,border_number,content,itemName,money,dayDate,category,sub_Category,itemState) values ('iii',borderInfo_seq.nextval,'�뼳�깮諛곌��뒫�빀�땲�떎.��','��釉붾윭',3300,sysdate,'�깮�솢/媛��젙','而ㅽ뵾','援щℓ��湲곗쨷');
insert into borderInfo (id,border_number,content,itemName,money,dayDate,category,sub_Category,itemState) values ('aaa',borderInfo_seq.nextval,'�뼳�뼳湲됰ℓ����','媛ㅻ윮�떆S1',1000,sysdate,'�쟾�옄�젣�뭹','�쑕���룿','援щℓ��湲곗쨷');
insert into borderInfo (id,border_number,content,itemName,money,dayDate,category,sub_Category,itemState) values ('aaa',borderInfo_seq.nextval,'�뼳�뼳湲됰ℓ����','媛ㅻ윮�떆S2',1000,sysdate,'�쟾�옄�젣�뭹','�쑕���룿','援щℓ��湲곗쨷');
insert into borderInfo (id,border_number,content,itemName,money,dayDate,category,sub_Category,itemState) values ('aaa',borderInfo_seq.nextval,'�뼳�뼳湲됰ℓ����','媛ㅻ윮�떆S3',1000,sysdate,'�쟾�옄�젣�뭹','�쑕���룿','援щℓ��湲곗쨷');
insert into borderInfo (id,border_number,content,itemName,money,dayDate,category,sub_Category,itemState) values ('aaa',borderInfo_seq.nextval,'�뼳�뼳湲됰ℓ����','媛ㅻ윮�떆S4',1000,sysdate,'�쟾�옄�젣�뭹','�쑕���룿','援щℓ��湲곗쨷');
insert into borderInfo (id,border_number,content,itemName,money,dayDate,category,sub_Category,itemState) values ('aaa',borderInfo_seq.nextval,'�뼳�뼳湲됰ℓ����','媛ㅻ윮�떆S5',1000,sysdate,'�쟾�옄�젣�뭹','�쑕���룿','援щℓ��湲곗쨷');
insert into borderInfo (id,border_number,content,itemName,money,dayDate,category,sub_Category,itemState) values ('aaa',borderInfo_seq.nextval,'�뼳�뼳湲됰ℓ����','媛ㅻ윮�떆S6',1000,sysdate,'�쟾�옄�젣�뭹','�쑕���룿','援щℓ��湲곗쨷');
insert into borderInfo (id,border_number,content,itemName,money,dayDate,category,sub_Category,itemState) values ('aaa',borderInfo_seq.nextval,'�뼳�뼳湲됰ℓ����','媛ㅻ윮�떆S7',1000,sysdate,'�쟾�옄�젣�뭹','�쑕���룿','援щℓ��湲곗쨷');
insert into borderInfo (id,border_number,content,itemName,money,dayDate,category,sub_Category,itemState) values ('aaa',borderInfo_seq.nextval,'�뼳�뼳湲됰ℓ����','媛ㅻ윮�떆S8',1000,sysdate,'�쟾�옄�젣�뭹','�쑕���룿','援щℓ��湲곗쨷');
insert into borderInfo (id,border_number,content,itemName,money,dayDate,category,sub_Category,itemState) values ('aaa',borderInfo_seq.nextval,'�뼳�뼳湲됰ℓ����','媛ㅻ윮�떆S9',1000,sysdate,'�쟾�옄�젣�뭹','�쑕���룿','援щℓ��湲곗쨷');
insert into borderInfo (id,border_number,content,itemName,money,dayDate,category,sub_Category,itemState) values ('aaa',borderInfo_seq.nextval,'�뼳�뼳湲됰ℓ����','媛ㅻ윮�떆S10',1000,sysdate,'�쟾�옄�젣�뭹','�쑕���룿','援щℓ��湲곗쨷');
insert into borderInfo (id,border_number,content,itemName,money,dayDate,category,sub_Category,itemState) values ('aaa',borderInfo_seq.nextval,'�뼳�뼳湲됰ℓ����','媛ㅻ윮�떆S11',1000,sysdate,'�쟾�옄�젣�뭹','�쑕���룿','援щℓ��湲곗쨷');
insert into borderInfo (id,border_number,content,itemName,money,dayDate,category,sub_Category,itemState) values ('aaa',borderInfo_seq.nextval,'�뼳�뼳湲됰ℓ����','媛ㅻ윮�떆S12',1000,sysdate,'�쟾�옄�젣�뭹','�쑕���룿','援щℓ��湲곗쨷');
insert into borderInfo (id,border_number,content,itemName,money,dayDate,category,sub_Category,itemState) values ('aaa',borderInfo_seq.nextval,'�뼳�뼳湲됰ℓ����','媛ㅻ윮�떆S13',1000,sysdate,'�쟾�옄�젣�뭹','�쑕���룿','援щℓ��湲곗쨷');
insert into borderInfo (id,border_number,content,itemName,money,dayDate,category,sub_Category,itemState) values ('aaa',borderInfo_seq.nextval,'�뼳�뼳湲됰ℓ����','媛ㅻ윮�떆S14',1000,sysdate,'�쟾�옄�젣�뭹','�쑕���룿','援щℓ��湲곗쨷');
select * from borderInfo;


create table img_Border( 
   border_Number number(5) constraint img_Bordernumber_fk references borderinfo(border_Number) on delete cascade,   -- borderinfo �뇦爰쒙옙�삟�샃�뵓嫄뷂옙�삺 
  img varchar2(200)  -- 
);

--drop table img_border;
  

--borderifo border_Number        
select * from borderinfo;
                                              -

insert into img_Border(border_Number,img) values (21, 'inte1.jpg');
insert into img_Border(border_Number,img) values (22, 'inte2.jpg');
insert into img_Border(border_Number,img) values (23, 'inte3.jpg');
insert into img_Border(border_Number,img) values (24, 'inte4.jpg');
insert into img_Border(border_Number,img) values (25, 'inte5.jpg');
insert into img_Border(border_Number,img) values (26, 'inte6.jpg');
insert into img_Border(border_Number,img) values (27, 'inte7.jpg');
insert into img_Border(border_Number,img) values (29, 'inte8.jpg');
insert into img_Border(border_Number,img) values (30, 'inte9.jpg');
insert into img_Border(border_Number,img) values (32, 'inte10.jpg');


insert into img_Border(border_Number,img) values (2, 'inte11.jpg');
insert into img_Border(border_Number,img) values (3, 'inte12.jpg');
insert into img_Border(border_Number,img) values (4, 'inte13.jpg');
insert into img_Border(border_Number,img) values (5, 'inte14.jpg');
insert into img_Border(border_Number,img) values (6, 'inte15.jpg');
insert into img_Border(border_Number,img) values (7, 'inte16.jpg');
insert into img_Border(border_Number,img) values (8, 'inte17.jpg');
insert into img_Border(border_Number,img) values (9, 'inte9.jpg');
insert into img_Border(border_Number,img) values (10, 'inte10.jpg');

select * from img_Border;
-- drop  table img_Border;
--select * from img_Border;

select ROWNUM num, id, border_number, content,itemName, money, dayDate, category, sub_Category, itemState from borderinfo
where category = '媛�援�' and sub_category = '移④뎄' and itemName like '%�븞�씫%' order by daydate desc;


select * from (select ROWNUM num, id, border_number, content, itemName, money, dayDate, category, sub_Category, itemState from borderinfo
where category = '媛�援�' and sub_category = '移④뎄' and itemName like '%�븞�씫%' order by daydate desc

create table  messenger(
  sender varchar2(20) not null constraint  sender_fk references userinfo(id) on delete cascade,  --
  receiver varchar2(20) not null constraint receiver_fk references userinfo(id) on delete cascade,  -- 
  content varchar2(30),
  dayDate date not null

);

--
  insert into messenger (sender,receiver,content,dayDate) values ('bbb','ccc','議곗쑉�빀�떆�떎',sysdate);
  insert into messenger (sender,receiver,content,dayDate) values ('ddd','eee','議곗쑉�빀�떆�떎',sysdate);
  insert into messenger (sender,receiver,content,dayDate) values ('aaa','fff','議곗쑉�빀�떆�떎',sysdate);

select * from messenger;

select * from trade_history;
drop table trade_history;
        										  
select * from borderInfo;    
select * from messenger;

select * from trade_history;
drop table trade_history;

--�긽�샇媛� �븘�슂�븳 �젙蹂� 
create table trade_history (
  buyer constraint  trading_Buyer_fk references userInfo(id) on delete cascade, -- 援щℓ�옄 
  seller constraint trading_Seller_fk references userInfo(id) on delete cascade,  -- �뙋留ㅼ옄
  itemName varchar2(20), -- �젣�뭹�씠由�
  cash number(7),  -- 吏�遺덉븸
  border_number constraint trading_bordernumber_fk references borderinfo(border_number) on delete cascade primary key, --湲� 寃뚯떆 踰덊샇
  daydate date not null, -- �궇吏� 
  trade_state varchar2(40) -- 嫄곕옒 吏꾪뻾 �긽�솴
  
);

insert into trade_history values ('aaa','bbb','媛ㅻ윮�떆S10',4000,29,sysdate,'援щℓ��湲곗쨷')

--  border Info 寃��깋�썑 border-number �닽�옄瑜� 蹂�寃쏀빐 二쇱꽭�슂                                               										  
select * from borderInfo;    
select * from trade_history;
                                                                                                                           --  �뼹   
  insert into trade_history (buyer,seller,itemName,cash,border_number,daydate,trade_state) values ('fff', 'bbb','媛ㅻ윮�떆S6',2000,1,'2016-10-24','嫄곕옒�셿猷�');
  insert into trade_history (buyer,seller,itemName,cash,border_number,daydate,trade_state) values ('fff', 'bbb','T-100',3000,2,'2016-10-24','嫄곕옒�셿猷�');
  insert into trade_history (buyer,seller,itemName,cash,border_number,daydate,trade_state) values ('fff', 'ccc','CalvinKlein',4400,3,'2016-10-24','嫄곕옒�셿猷�');                                                                               --  �뼹
                                                                                                          --  �뼹
  insert into  trade_history (buyer,seller,itemName,cash,border_number,daydate,trade_state) values ('fff','eee','紐⑸룄由�',120000,4,sysdate,'嫄곕옒�셿猷�');
  insert into  trade_history (buyer,seller,itemName,cash,border_number,daydate,trade_state) values ('fff','iii','��釉붾윭',200000,5,sysdate,'嫄곕옒�셿猷�');

--drop table borderinfo;

  select * from trade_history;


--cash_history table   id, 援щℓ�궡�뿭 -receiver 援щℓ�옄 
create table cash_history (
  id varchar2(20) constraint cash_history_id_fk references userinfo  (id)  on delete cascade,  -- id 
  itemName varchar2(20),  -- 臾쇳뭹 �씠由�
  mileage number(6), -- 留덉씪由ъ� - �썑 異⑹쟾 �뙋留� 援щℓ 
  saveDate date not null, -- 留덉씪由ъ� �쟻由쎌씪(理쒖쥌援ъ엯�씪or�긽�깭=援щℓ�셿猷뚯떆�젏) 
  current_cash number -- 嫄곕옒 �떦�떆 �옍�븸 
  
);



  select * from trade_history;

insert into cash_history (id,itemName,mileage,saveDate,current_cash) values ('aaa','媛ㅻ윮�떆S6',20,'2016-10-25',588000); 
insert into cash_history (id,itemName,mileage,saveDate,current_cash) values ('fff','媛ㅻ윮�떆S6',20,'2016-10-25',588000); 
insert into cash_history (id,itemName,mileage,saveDate,current_cash) values ('bbb','T-100',30,'2016-10-25',287000); 
insert into cash_history (id,itemName,mileage,saveDate,current_cash) values ('eee','CalvinKlein',44,'2016-10-25',485600); 
insert into cash_history (id,itemName,mileage,saveDate,current_cash) values ('bbb','紐⑸룄由�',1200,'2016-10-25',170000);
insert into cash_history (id,itemName,mileage,saveDate,current_cash) values ('ccc','��釉붾윭',2000,'2016-10-25',190000); 

select * from cash_history;

create table request_trade(
	buyer varchar2(20) constraint request_trade_buyer_id_fk references userinfo  (id)  on delete cascade,	
	seller varchar2(20) constraint request_trade_seller_id_fk references userinfo  (id)  on delete cascade,
	cash number(7),
	border_number number(5) constraint request_trade_border_number_fk references borderinfo(border_number) on delete cascade,
	state varchar2(10) --buy or sell
);

select * from request_trade
drop table myhistory;
drop table img_Border;
drop table messenger;
drop table borderInfo;
drop table userInfo;
drop table trade_history;
drop table cash_History;
drop table request_trade;

commit;