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
insert into userinfo (id,password,tel,email,location,cash) values ('aaa','1234','01093441366','awaynee@hanmail.net','서울시 금천구',190000);
insert into userinfo (id,password,tel,email,location,cash) values ('bbb','1234','01011112222','bbbb@naver.com','서울시 구로구',90000);
insert into userinfo (id,password,tel,email,location,cash) values ('ccc','1234','01033334444','cccc@gmail.com','서울시 동작구',290000);
insert into userinfo (id,password,tel,email,location,cash) values ('ddd','1234','01055556666','dddd@hanmail.net','서울시 강남구',390000);
insert into userinfo (id,password,tel,email,location,cash) values ('eee','1234','01077778888','eeee@naver.com','서울시 강동구',490000);
insert into userinfo (id,password,tel,email,location,cash) values ('fff','1234','01088889999','ffff@gmail.com','서울시 누원구',590000);

insert into userinfo (id,password,tel,email,location,cash) values ('ggg','1234','01023234545','ggg@hanmail.net','서울시 서대문구',670000);
insert into userinfo (id,password,tel,email,location,cash) values ('hhh','1234','01012122323','hhh@naver.com','서울시 강서구',350000);
insert into userinfo (id,password,tel,email,location,cash) values ('iii','1234','01045456767','iii@gmail.com','서울시 중구',210000);
insert into userinfo (id,password,tel,email,location,cash) values ('jjj','1234','01078784343','jjj@hanmail.net','서울시 중랑구',750000);
insert into userinfo (id,password,tel,email,location,cash) values ('kkk','1234','01087879898','kkk@naver.com','서울시 서초구',640000);
insert into userinfo (id,password,tel,email,location,cash) values ('lll','1234','01013133535','lll@gmail.com','서울시 관악구',180000);



select * from  userinfo; 
  
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


drop table borderInfo;

 
insert into borderInfo (id,border_number,content,itemName,money,dayDate,category,sub_Category,itemState) values ('aaa',borderInfo_seq.nextval,'▶▶급매◀◀','갤럭시S6',1000,sysdate,'디지털/가전제품','휴대폰','구매대기중');
insert into borderInfo (id,border_number,content,itemName,money,dayDate,category,sub_Category,itemState) values ('bbb',borderInfo_seq.nextval,'▶▶당일처분급구◀◀','T-100',44000,sysdate,'스포츠','alton','구매대기중');
insert into borderInfo (id,border_number,content,itemName,money,dayDate,category,sub_Category,itemState) values ('ccc',borderInfo_seq.nextval,'▶최저가 판매◀','CalvinKlein',3300,sysdate,'의류','청바지','구매대기중');

--insert into borderInfo (id,border_number,content,itemName,money,dayDate,category,sub_Category,itemState) values ('ddd',borderInfo_seq.nextval,'▶구매자찾습니다◀','skirt',1000,sysdate,'의류','여성의류','구매대기중');
insert into borderInfo (id,border_number,content,itemName,money,dayDate,category,sub_Category,itemState) values ('eee',borderInfo_seq.nextval,'▶강동구 사시는분!◀','목도리',44000,sysdate,'악세서리','기타','구매대기중');
--insert into borderInfo (id,border_number,content,itemName,money,dayDate,category,sub_Category,itemState) values ('fff',borderInfo_seq.nextval,'▶직접찾아갑니다.◀','선글라스',3300,sysdate,'악세서리','기타','구매대기중');
--insert into borderInfo (id,border_number,content,itemName,money,dayDate,category,sub_Category,itemState) values ('ggg',borderInfo_seq.nextval,'▶▶빠른 연락◀◀','골프채',1000,sysdate,'스포츠','골프','구매대기중');
--insert into borderInfo (id,border_number,content,itemName,money,dayDate,category,sub_Category,itemState) values ('hhh',borderInfo_seq.nextval,'▶▶초저가판매◀◀','외장하드',44000,sysdate,'디지털/가전제품','컴퓨터','구매대기중');
insert into borderInfo (id,border_number,content,itemName,money,dayDate,category,sub_Category,itemState) values ('iii',borderInfo_seq.nextval,'▶택배가능합니다.◀','텀블러',3300,sysdate,'생활/가정','커피','구매대기중');
insert into borderInfo (id,border_number,content,itemName,money,dayDate,category,sub_Category,itemState) values ('aaa',borderInfo_seq.nextval,'▶▶급매◀◀','갤럭시S1',1000,sysdate,'전자제품','휴대폰','구매대기중');
insert into borderInfo (id,border_number,content,itemName,money,dayDate,category,sub_Category,itemState) values ('aaa',borderInfo_seq.nextval,'▶▶급매◀◀','갤럭시S2',1000,sysdate,'전자제품','휴대폰','구매대기중');
insert into borderInfo (id,border_number,content,itemName,money,dayDate,category,sub_Category,itemState) values ('aaa',borderInfo_seq.nextval,'▶▶급매◀◀','갤럭시S3',1000,sysdate,'전자제품','휴대폰','구매대기중');
insert into borderInfo (id,border_number,content,itemName,money,dayDate,category,sub_Category,itemState) values ('aaa',borderInfo_seq.nextval,'▶▶급매◀◀','갤럭시S4',1000,sysdate,'전자제품','휴대폰','구매대기중');
insert into borderInfo (id,border_number,content,itemName,money,dayDate,category,sub_Category,itemState) values ('aaa',borderInfo_seq.nextval,'▶▶급매◀◀','갤럭시S5',1000,sysdate,'전자제품','휴대폰','구매대기중');
insert into borderInfo (id,border_number,content,itemName,money,dayDate,category,sub_Category,itemState) values ('aaa',borderInfo_seq.nextval,'▶▶급매◀◀','갤럭시S6',1000,sysdate,'전자제품','휴대폰','구매대기중');
insert into borderInfo (id,border_number,content,itemName,money,dayDate,category,sub_Category,itemState) values ('aaa',borderInfo_seq.nextval,'▶▶급매◀◀','갤럭시S7',1000,sysdate,'전자제품','휴대폰','구매대기중');
insert into borderInfo (id,border_number,content,itemName,money,dayDate,category,sub_Category,itemState) values ('aaa',borderInfo_seq.nextval,'▶▶급매◀◀','갤럭시S8',1000,sysdate,'전자제품','휴대폰','구매대기중');
insert into borderInfo (id,border_number,content,itemName,money,dayDate,category,sub_Category,itemState) values ('aaa',borderInfo_seq.nextval,'▶▶급매◀◀','갤럭시S9',1000,sysdate,'전자제품','휴대폰','구매대기중');
insert into borderInfo (id,border_number,content,itemName,money,dayDate,category,sub_Category,itemState) values ('aaa',borderInfo_seq.nextval,'▶▶급매◀◀','갤럭시S10',1000,sysdate,'전자제품','휴대폰','구매대기중');
insert into borderInfo (id,border_number,content,itemName,money,dayDate,category,sub_Category,itemState) values ('aaa',borderInfo_seq.nextval,'▶▶급매◀◀','갤럭시S11',1000,sysdate,'전자제품','휴대폰','구매대기중');
insert into borderInfo (id,border_number,content,itemName,money,dayDate,category,sub_Category,itemState) values ('aaa',borderInfo_seq.nextval,'▶▶급매◀◀','갤럭시S12',1000,sysdate,'전자제품','휴대폰','구매대기중');
insert into borderInfo (id,border_number,content,itemName,money,dayDate,category,sub_Category,itemState) values ('aaa',borderInfo_seq.nextval,'▶▶급매◀◀','갤럭시S13',1000,sysdate,'전자제품','휴대폰','구매대기중');
insert into borderInfo (id,border_number,content,itemName,money,dayDate,category,sub_Category,itemState) values ('aaa',borderInfo_seq.nextval,'▶▶급매◀◀','갤럭시S14',1000,sysdate,'전자제품','휴대폰','구매대기중');
select * from borderInfo;


create table img_Border( 
   border_Number number(5) constraint img_Bordernumber_fk references borderinfo(border_Number) on delete cascade,   -- borderinfo 野꺜�혢혵甕걔�혱 
  img varchar2(200)  -- 
);

--drop table img_border;
  

--borderifo border_Number        
select * from borderinfo;
                                              -

insert into img_Border(border_Number,img) values (1, 'samplemacbook.jpg');
insert into img_Border(border_Number,img) values (2, 'samplemacbook2.jpg');
insert into img_Border(border_Number,img) values (3, 'samplemacbook3.jpg');
insert into img_Border(border_Number,img) values (4, 'samplemacbook4.jpg');
insert into img_Border(border_Number,img) values (5, 'samplemacbook5.jpg');
insert into img_Border(border_Number,img) values (6, 'sample6.jpg');
insert into img_Border(border_Number,img) values (7, 'sample7.jpg');
insert into img_Border(border_Number,img) values (8, 'sample8.jpg');
insert into img_Border(border_Number,img) values (9, 'sample9.jpg');
insert into img_Border(border_Number,img) values (10, 'sample10.jpg');


select * from img_Border;
-- drop  table img_Border;
--select * from img_Border;


--
create table  messenger(
  sender varchar2(20) not null constraint  sender_fk references userinfo(id) on delete cascade,  --
  receiver varchar2(20) not null constraint receiver_fk references userinfo(id) on delete cascade,  -- 
  content varchar2(30),
  dayDate date not null

);

--
  insert into messenger (sender,receiver,content,dayDate) values ('bbb','ccc','조율합시다',sysdate);
  insert into messenger (sender,receiver,content,dayDate) values ('ddd','eee','조율합시다',sysdate);
  insert into messenger (sender,receiver,content,dayDate) values ('aaa','fff','조율합시다',sysdate);

select * from messenger;

select * from trade_history;
drop table trade_history;
        										  
select * from borderInfo;    
select * from messenger;

select * from trade_history;
drop table trade_history;

--상호간 필요한 정보 
create table trade_history (
  buyer constraint  trading_Buyer_fk references userInfo(id) on delete cascade, -- 구매자 
  seller constraint trading_Seller_fk references userInfo(id) on delete cascade,  -- 판매자
  itemName varchar2(20), -- 제품이름
  cash number(7),  -- 지불액
  border_number constraint trading_bordernumber_fk references borderinfo(border_number) on delete cascade primary key, --글 게시 번호
  daydate date not null, -- 날짜 
  trade_state varchar2(40) -- 거래 진행 상황
  
);

--  border Info 검색후 border-number 숫자를 변경해 주세요                                               										  
select * from borderInfo;    
select * from trade_history;
                                                                                                                           --  ▼   
  insert into trade_history (buyer,seller,itemName,cash,border_number,daydate,trade_state) values ('fff', 'bbb','갤럭시S6',2000,1,'2016-10-24','거래완료');
  insert into trade_history (buyer,seller,itemName,cash,border_number,daydate,trade_state) values ('fff', 'bbb','T-100',3000,2,'2016-10-24','거래완료');
  insert into trade_history (buyer,seller,itemName,cash,border_number,daydate,trade_state) values ('fff', 'ccc','CalvinKlein',4400,3,'2016-10-24','거래완료');                                                                               --  ▼
                                                                                                          --  ▼
  insert into  trade_history (buyer,seller,itemName,cash,border_number,daydate,trade_state) values ('fff','eee','목도리',120000,4,sysdate,'거래완료');
  insert into  trade_history (buyer,seller,itemName,cash,border_number,daydate,trade_state) values ('fff','iii','텀블러',200000,5,sysdate,'거래완료');

--drop table borderinfo;

  select * from trade_history;


--cash_history table   id, 구매내역 -receiver 구매자 
create table cash_history (
  id varchar2(20) constraint cash_history_id_fk references userinfo  (id)  on delete cascade,  -- id 
  itemName varchar2(20),  -- 물품 이름
  mileage number(6), -- 마일리지 - 후 충전 판매 구매 
  saveDate date not null, -- 마일리지 적립일(최종구입일or상태=구매완료시점) 
  current_cash number -- 거래 당시 잔액 
  
);



  select * from trade_history;

insert into cash_history (id,itemName,mileage,saveDate,current_cash) values ('aaa','갤럭시S6',20,'2016-10-25',588000); 
insert into cash_history (id,itemName,mileage,saveDate,current_cash) values ('fff','갤럭시S6',20,'2016-10-25',588000); 
insert into cash_history (id,itemName,mileage,saveDate,current_cash) values ('bbb','T-100',30,'2016-10-25',287000); 
insert into cash_history (id,itemName,mileage,saveDate,current_cash) values ('eee','CalvinKlein',44,'2016-10-25',485600); 
insert into cash_history (id,itemName,mileage,saveDate,current_cash) values ('bbb','목도리',1200,'2016-10-25',170000);
insert into cash_history (id,itemName,mileage,saveDate,current_cash) values ('ccc','텀블러',2000,'2016-10-25',190000); 

select * from cash_history;


drop table myhistory;
drop table img_Border;
drop table messenger;
drop table borderInfo;
drop table userInfo;
drop table trade_history;
drop table cash_History;

commit;