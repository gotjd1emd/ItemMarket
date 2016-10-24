--사용자 정보
create table userinfo (
 id varchar2(20) not null constraint id_pk primary key,   -- 아이디
 tel varchar2(20) not null,   --전화번호(휴대폰)
 email varchar2(40), -- 이메일 주소 
 location varchar2(40) not null,  -- 거주지주소
 cash number(7)  -- 선금액 정보
 
);


--기본 데이터
insert into userinfo (id,tel,email,location,cash) values ('aaa','01003441366','awaynee@hanmail.net','서울시 금천구',190000);

insert into userinfo (id,tel,email,location,cash) values ('bbb','01011112222','bbbb@naver.com','서울시 구로구',90000);
insert into userinfo (id,tel,email,location,cash) values ('ccc','01033334444','cccc@gmail.com','서울시 동작구',290000);
insert into userinfo (id,tel,email,location,cash) values ('ddd','01055556666','dddd@hanmail.net','서울시 강남구',390000);
insert into userinfo (id,tel,email,location,cash) values ('eee','01077778888','eeee@naver.com','서울시 강동구',490000);
insert into userinfo (id,tel,email,location,cash) values ('fff','01088889999','ffff@gmail.com','서울시 누원구',590000);

select * from  userinfo; 

  
--시퀀스 준비
grant create sequence to lee;   --(생성 계정 대입 )

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
insert into borderInfo (id,border_number,content,itemName,money,dayDate,category,sub_Category,itemState) values ('aaa',borderInfo_seq.nextval,'▶▶급매◀◀','갤럭시S6',1000,sysdate,'가전제품','휴대폰','구매대기중');
insert into borderInfo (id,border_number,content,itemName,money,dayDate,category,sub_Category,itemState) values ('bbb',borderInfo_seq.nextval,'▶▶당일처분급구◀◀','T-100',44000,sysdate,'스포츠','alton','구매대기중');
insert into borderInfo (id,border_number,content,itemName,money,dayDate,category,sub_Category,itemState) values ('ccc',borderInfo_seq.nextval,'▶최저가 판매◀','CalvinKlein',3300,sysdate,'의류','청바지','구매대기중');


select * from borderInfo;


--나의 구매 내역 ,구매 정보   // itemName 추가 ,content 삭제
create table myHistory(
  dayDate date not null, -- 결제 날짜
  seller constraint seller_fk references userinfo(id), -- 판매자 
  buyer constraint buyer_fk references userinfo(id),  -- 구매자
  category varchar2(30) constraint category_fk REFERENCES borderInfo(category),    -- 카테고리 분류  
  sub_Category varchar2(30) constraint subCategory_fk REFERENCES borderInfo(sub_Category),   -- 서브 카테고리 분류 
  itemName varchar(40) constraint myhistory_itemName_fk references borderinfo(itemName),
  money number(7) not null    --구매액 

); 

drop table myhistory;
select * from myhistory;


--데이터 준비
insert into myHistory (dayDate,seller,buyer,category,sub_Category,itemName,money) values (sysdate,'aaa','bbb','가전제품','휴대폰','노트4',33000);
insert into myHistory (dayDate,seller,buyer,category,sub_Category,itemName,money) values (sysdate,'bbb','ccc','스포츠','블랙캣','alton',22000);
insert into myHistory (dayDate,seller,buyer,category,sub_Category,itemName,money) values (sysdate,'ccc','eee','의류','청바지','Diesel',44000);

select * from myhistory;

delete from myhistory;
----이미지 게시판 
--create table img_Border( 
--   border_Number number(5) constraint img_Bordernumber_fk references borderinfo(border_Number),   -- borderinfo 게시번호 
--   img varchar2(20)  -- 이미지 
--);
----데이터 준비
--insert into img_Border(border_Number,img) values (1, '이미지1.jpg');
--insert into img_Border(border_Number,img) values (2, '이미지2.jpg');

--drop  table img_Border;
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



--상호간 필요한 정보 
create table trading (

  buyer constraint  trading_Buyer_fk references userInfo(id), -- 구매자 
  seller constraint trading_Seller_fk references userInfo(id),  -- 판매자
  itemName constraint trading_itemName_fk references borderInfo(itemName),
  cash number(7),  -- 지불액
  border_number constraint trading_bordernumber_fk references borderinfo(border_number) primary key, --글 게시 번호
  daydate date not null -- 날짜 
  
); 
  insert into trading (buyer,seller,itemName,cash,border_number,daydate) values ('ddd', 'aaa','갤럭시S6''''''');
  insert into trading (buyer,seller,itemName,cash,border_number,daydate) values ('eee', 'bbb','T-100''''''');
  insert into trading (buyer,seller,itemName,cash,border_number,daydate) values ('fff', 'ccc','CalvinKlein''''''');
 
  
drop table trading;
  select * from trading;


--cash_history table   id, 구매내역 
create table cash_History (
  id varchar2(20) constraint cash_History_id_fk references userinfo  (id),  -- id 
  itemName varchar2(20) constraint cash_History_itemName_fk references borderInfo(itemName),  -- 물품 이름
  mileage number(6), -- 마일리지
  saveDate date not null -- 마일리지 적립일(최종구입일or상태=구매완료시점) 
  
);

insert into cash_history (id,itemName,mileage,saveDate) values ('aaa','CalvinKlein',100,'2016-10-25'); 
insert into cash_history (id,itemName,mileage,saveDate) values ('bbb','갤럭시S6',500,'2016-10-25'); 
insert into cash_history (id,itemName,mileage,saveDate) values ('ccc','T-100',900,'2016-10-25'); 


select * from cash_history;

drop table myhistory;
drop table img_Border;
drop table messenger;
drop table borderInfo;
drop table userInfo;
drop table trading;
drop table cash_History;

commit;