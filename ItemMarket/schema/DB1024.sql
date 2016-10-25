--사용자 정보 //  password varchar2 추가 
create table userinfo (
 id varchar2(20) not null constraint id_pk primary key,-- 아이디
 password varchar2(20) not null,
 tel varchar2(20) not null,   --전화번호(휴대폰)
 email varchar2(40), -- 이메일 주소 
 location varchar2(40) not null,  -- 거주지주소
 cash number(7)  -- 선금액 정보
 
);

select * from userinfo;
drop table userinfo;

--기본 데이터
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
  
--시퀀스 준비
grant create sequence to root;   --(생성 계정 대입 )

--시퀀스생성
create sequence borderinfo_seq;  --(테이블_seq)

--borderinfo_seq.nextval 적용컬럼에 대입--


--전체 게시판  // trade 변수 대신에 itemName 추가 , itemState 물품 상태변수 추가 
create table borderinfo(

id varchar2(20) not null constraint border_id_fk references userinfo(id), -- userinfo 참조
border_number number(5) constraint bordernumber_pk primary key,  -- borderinfo 참조
content varchar2(30), -- 글 

itemName varchar(40) constraint borderinfo_unique unique,
money number(7),  --금액 제시 
dayDate date not null,  -- 올린 날짜 
category varchar2(30) not null CONSTRAINT borderinfo_category_unique unique,    --카테고리 분류 
sub_category varchar2(30) not null CONSTRAINT borderinfo_sub_category_unique unique,-- 서브 카테고리 분류
itemState varchar2(20) 

);

drop table borderInfo;

--데이터 준비
insert into borderInfo (id,border_number,content,itemName,money,dayDate,category,sub_Category,itemState) values ('aaa',borderInfo_seq.nextval,'▶▶급매◀◀','갤럭시S6',1000,sysdate,'디지털/가전제품','휴대폰','구매대기중');
insert into borderInfo (id,border_number,content,itemName,money,dayDate,category,sub_Category,itemState) values ('bbb',borderInfo_seq.nextval,'▶▶당일처분급구◀◀','T-100',44000,sysdate,'스포츠','alton','구매대기중');
insert into borderInfo (id,border_number,content,itemName,money,dayDate,category,sub_Category,itemState) values ('ccc',borderInfo_seq.nextval,'▶최저가 판매◀','CalvinKlein',3300,sysdate,'의류','청바지','구매대기중');

--insert into borderInfo (id,border_number,content,itemName,money,dayDate,category,sub_Category,itemState) values ('ddd',borderInfo_seq.nextval,'▶구매자찾습니다◀','skirt',1000,sysdate,'의류','여성의류','구매대기중');
insert into borderInfo (id,border_number,content,itemName,money,dayDate,category,sub_Category,itemState) values ('eee',borderInfo_seq.nextval,'▶강동구 사시는분!◀','목도리',44000,sysdate,'악세서리','기타','구매대기중');
--insert into borderInfo (id,border_number,content,itemName,money,dayDate,category,sub_Category,itemState) values ('fff',borderInfo_seq.nextval,'▶직접찾아갑니다.◀','선글라스',3300,sysdate,'악세서리','기타','구매대기중');
--insert into borderInfo (id,border_number,content,itemName,money,dayDate,category,sub_Category,itemState) values ('ggg',borderInfo_seq.nextval,'▶▶빠른 연락◀◀','골프채',1000,sysdate,'스포츠','골프','구매대기중');
--insert into borderInfo (id,border_number,content,itemName,money,dayDate,category,sub_Category,itemState) values ('hhh',borderInfo_seq.nextval,'▶▶초저가판매◀◀','외장하드',44000,sysdate,'디지털/가전제품','컴퓨터','구매대기중');
insert into borderInfo (id,border_number,content,itemName,money,dayDate,category,sub_Category,itemState) values ('iii',borderInfo_seq.nextval,'▶택배가능합니다.◀','텀블러',3300,sysdate,'생활/가정','커피','구매대기중');


select * from borderInfo;

--이미지 게시판 
create table img_Border( 
   border_Number number(5) constraint img_Bordernumber_fk references borderinfo(border_Number),   -- borderinfo 게시번호 
  img varchar2(20)  -- 이미지 
);

--drop table img_border;

--데이터 준비     

--borderifo 검색후 border_Number 맞춰주세요~          
select * from borderinfo;
                                              --  ▼ 
insert into img_Border(border_Number,img) values (1, '이미지1.jpg');
insert into img_Border(border_Number,img) values (2, '이미지2.jpg');
insert into img_Border(border_Number,img) values (3, '이미지3.jpg');
insert into img_Border(border_Number,img) values (4, '이미지4.jpg');
insert into img_Border(border_Number,img) values (7, '이미지5.jpg');


select * from img_Border;
-- drop  table img_Border;
--select * from img_Border;


-- 메신저 에 필요한 테이블 
create table  messenger(
  sender varchar2(20) not null constraint  sender_fk references userinfo(id),  --메시지 보내는 사람 
  receiver varchar2(20) not null constraint receiver_fk references userinfo(id),  -- 받는 사람
  content varchar2(30),
  dayDate date not null

);

-- 데이터 준비 
  insert into messenger (sender,receiver,content,dayDate) values ('bbb','ccc','조율합시다',sysdate);
  insert into messenger (sender,receiver,content,dayDate) values ('ddd','eee','조율합시다',sysdate);
  insert into messenger (sender,receiver,content,dayDate) values ('aaa','fff','조율합시다',sysdate);

select * from messenger;

select * from trade_history;
drop table trade_history;

--상호간 필요한 정보 
create table trade_history (

  buyer constraint  trading_Buyer_fk references userInfo(id), -- 구매자 
  seller constraint trading_Seller_fk references userInfo(id),  -- 판매자
  itemName constraint trading_itemName_fk references borderInfo(itemName),
  cash number(7),  -- 지불액
  border_number constraint trading_bordernumber_fk references borderinfo(border_number) primary key, --글 게시 번호
  daydate date not null, -- 날짜 
  trade_state varchar2(40)
  
);
--  border Info 검색후 border-number 숫자를 변경해 주세요                                               										  
select * from borderInfo;    
select * from trade_history;
                                                                                                                           --  ▼   
  insert into trade_history (buyer,seller,itemName,cash,border_number,daydate,trade_state) values ('fff', 'aaa','갤럭시S6',2000,1,'2016-10-24','거래완료');
  insert into trade_history (buyer,seller,itemName,cash,border_number,daydate,trade_state) values ('ddd', 'bbb','T-100',3000,2,'2016-10-24','거래완료');
  insert into trade_history (buyer,seller,itemName,cash,border_number,daydate,trade_state) values ('eee', 'ccc','CalvinKlein',4400,3,'2016-10-24','거래완료');                                                                               --  ▼
                                                                                                          --  ▼
  insert into  trade_history (buyer,seller,itemName,cash,border_number,daydate,trade_state) values ('bbb','eee','목도리',120000,4,sysdate,'거래완료');
  insert into  trade_history (buyer,seller,itemName,cash,border_number,daydate,trade_state) values ('ccc','iii','텀블러',200000,7,sysdate,'거래완료');

--drop table borderinfo;

  select * from trade_history;


--cash_history table   id, 구매내역 -receiver 구매자 
create table cash_history (
  id varchar2(20) constraint cash_history_id_fk references userinfo  (id),  -- id 
  itemName varchar2(20) constraint cash_history_itemName_fk references borderInfo(itemName),  -- 물품 이름
  mileage number(6), -- 마일리지
  saveDate date not null, -- 마일리지 적립일(최종구입일or상태=구매완료시점) 
  current_cash number
  
);



  select * from trade_history;


insert into cash_history (id,itemName,mileage,saveDate,current_cash) values ('fff','갤럭시S6',20,'2016-10-25',588000); 
insert into cash_history (id,itemName,mileage,saveDate,current_cash) values ('ddd','T-100',30,'2016-10-25',287000); 
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