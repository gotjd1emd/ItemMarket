--사용자 정보
create table userinfo (
 id varchar2(20) not null constraint id_pk primary key,   -- 아이디
 tel varchar2(20) not null,   --전화번호(휴대폰)
 email varchar2(40), -- 이메일 주소 
 location varchar2(40) not null,  -- 거주지주소
 cash number(7)  -- 선금액 정보
)


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


--전체 게시판
create table borderinfo(

id varchar2(20) not null constraint border_id_fk references userinfo(id), -- userinfo 참조
border_number number(5) constraint bordernumber_pk primary key,  -- borderinfo 참조
content varchar2(30), -- 글 
trade varchar2(20) not null,   -- 판매자 또는 구매자 
money number(7),  --금액 제시 
daydate date not null,  -- 올린 날짜 
category varchar2(30) not null CONSTRAINT borderinfo_category_unique unique,    --카테고리 분류 
sub_category varchar2(30) not null CONSTRAINT borderinfo_sub_category_unique unique  -- 서브 카테고리 분류 

)


--데이터 준비
insert into borderinfo (id,border_number,content,trade,money,daydate,category,sub_category) values ('aaa',borderinfo_seq.nextval,'▶▶급매◀◀','판매자',1000,sysdate,'가전제품','휴대폰');
insert into borderinfo (id,border_number,content,trade,money,daydate,category,sub_category) values ('bbb',borderinfo_seq.nextval,'▶▶당일처분급구◀◀','판매자',44000,sysdate,'스포츠','Cello');
insert into borderinfo (id,border_number,content,trade,money,daydate,category,sub_category) values ('ccc',borderinfo_seq.nextval,'▶최저가 판매◀','판매자',3300,sysdate,'의류','청바지');


select * from borderInfo;


--나의 구매 내역 ,구매 정보 
create table myhistory(
  money number(7) not null,    --구매액 
  daydate date not null,  -- 결제 날짜  
  buyer constraint buyer_fk references userinfo(id),  -- 구매자
  seller constraint seller_fk references userinfo(id), -- 판매자 
  content varchar2(30),   --글 
  category varchar2(30) constraint category_fk REFERENCES borderinfo(category),    -- 카테고리 분류  
  sub_category varchar2(30) constraint subcategory_fk REFERENCES borderinfo(sub_category)   -- 서브 카테고리 분류 

) 


--데이터 준비
insert into myhistory (money,daydate,buyer,seller,content,category,sub_category) values ('1100',sysdate,'bbb','aaa','구매목록입니다','가전제품','휴대폰');
insert into myhistory (money,daydate,buyer,seller,content,category,sub_category) values ('3300',sysdate,'fff','eee','구매목록입니다','의류','청바지');

select * from myhistory;


--이미지 게시판 
create table img_border( 
   border_number number(5) constraint img_bordernumber references borderinfo(border_number),   -- borderinfo 게시번호 
   img varchar2(20)  -- 이미지 이름 
)
--데이터 준비
insert into img_border(border_number,img) values (1, '이미지1.jpg');
insert into img_border(border_number,img) values (2, '이미지2.jpg');

select * from img_border;


-- 메신저 에 필요한 테이블 
create table  messenger(
  sendercounterparty varchar2(20) not null constraint  sendercounterpart_fk references userinfo(id),  --메시지 보내는 사람 의 상대측
  receivercounterparty varchar2(20) not null constraint receivercounterpart_fk references userinfo(id),  -- 받는 사람의 상대측 
  content varchar2(30),
  daydate date not null

);

-- 데이터 준비 
  insert into messenger (sendercounterparty,receivercounterparty,content,daydate) values ('bbb','ccc','조율합시다',sysdate);
  insert into messenger (sendercounterparty,receivercounterparty,content,daydate) values ('ddd','eee','조율합시다',sysdate);
  insert into messenger (sendercounterparty,receivercounterparty,content,daydate) values ('aaa','fff','조율합시다',sysdate);

select * from messenger;



--상호간 필요한 정보 
create table trading (

  buyer constraint  trading_buyer_fk references userinfo(id), -- 구매자 
  seller constraint trading_seller_fk references userinfo(id),  -- 판매자 
  cash number(7),  -- 지불액
  border_number constraint bordernumber_fk references borderinfo(border_number) primary key, --글 게시 번호
  daydate date not null -- 날짜 
  
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
