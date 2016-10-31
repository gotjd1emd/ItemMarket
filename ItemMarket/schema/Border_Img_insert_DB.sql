--insert 문장 만들기 --insert 문장 만들기 
select * from img_border;
--select * from borderinfo bo_info join img_border img_bo using(border_number) where bo_info.border_number = ? ;

--1 borderinfo - insert 하기 
select * from borderinfo ;
select id from userinfo;

insert into border_info (id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)
values () 
-- 물건  컴퓨터 - 가전 - 멈티 미디어 - 휴대폰 - 프린터 - 
--aaa- 아이디 알파벳 순 
select * from borderinfo;
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
delete from borderinfo; 


insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('aaa',borderInfo_seq.nextval,'중고컴퓨터','주연컴퓨터',250000,'2016/10/24','전자제품','컴퓨터','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('bbb',borderInfo_seq.nextval,'급매물입니다','딤채',300000,'2016-10-25','전자제품','가전제품','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('ccc',borderInfo_seq.nextval,'서울경기환영','대우TV',150000,'2016-10-16','전자제품','멀티미디어','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('ddd',borderInfo_seq.nextval,'휴대폰중고팝니다','애니콜',50000,'2016-10-27','전자제품','휴대폰','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('eee',borderInfo_seq.nextval,'중고가전급매','삼성프린터',90000,'2016-10-28','전자제품','프린터','판매대기중') ;

insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('fff',borderInfo_seq.nextval,'원피스 팝니다','체크원피스',15000,'2016-10-18','의류','여성의류','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('ggg',borderInfo_seq.nextval,'남성카키자켓팜','남성자켓',50000,'2016-10-19','의류','남성의류','매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('hhh',borderInfo_seq.nextval,'유아 옷','여아복',25000,'2016-10-20','의류','영유아','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('iii',borderInfo_seq.nextval,'신발 팝니다','아디다스런닝화',55000,'2016-10-21','의류','신발','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('fff',borderInfo_seq.nextval,'악세서리팝니다.','팔찌',9900,'2016-10-22','의류','악세서리','판매대기중') ;

insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('ggg',borderInfo_seq.nextval,'악세서리 팝니다','꽃다발',5000,'2016-10-23','가구','인테리어','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('hhh',borderInfo_seq.nextval,'텀블러팝니다','텀블러',4000,'2016-10-24','생활','부엌용품','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('iii',borderInfo_seq.nextval,'드라이버세트팝니다','드라이버셋트',12000,'2016-10-25','생활','공구용품','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('jjj',borderInfo_seq.nextval,'앤틱옷장 팝니다','앤틱옷장',700000,'2016-10-26','생활','침실용품','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('kkk',borderInfo_seq.nextval,'여성상의 팝니다','니트-하늘',12500,'2016-10-27','의류','여성의류','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('lll',borderInfo_seq.nextval,'후드 티 팝니다','남성 후드-초록',20000,'2016-10-28','의류','남성의류','판매대기중') ;



---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('bbb',borderInfo_seq.nextval,'컴+모니터팔아요','hp컴퓨터',300000,'2016-10-24','전자제품','컴퓨터','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('ccc',borderInfo_seq.nextval,'밥솥팝니다','밥솥',67000,'2016-10-25','전자제품','가전제품','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('ddd',borderInfo_seq.nextval,'엘지티피팔아요','엘지티비',190000,'2016-10-16','전자제품','멀티미디어','판매대기중');
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('eee',borderInfo_seq.nextval,'노트4중고판매.','노트4',150000,'2016-10-27','전자제품','휴대폰','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('fff',borderInfo_seq.nextval,'삼성검정프린터팜','삼성프린터',65000,'2016-10-28','전자제품','프린터','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('ggg',borderInfo_seq.nextval,'여성검정후드','여성후드티',18000,'2016-10-18','의류','여성의류','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('hhh',borderInfo_seq.nextval,'남성카고자켓','남성자켓',40000,'2016-10-19','의류','남성의류','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('iii',borderInfo_seq.nextval,'아가옷 팔아요~','여아복',17000,'2016-10-20','의류','영유아','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('jjj',borderInfo_seq.nextval,'신발 중고 팔아요','운동화',43000,'2016-10-21','의류','신발','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('kkk',borderInfo_seq.nextval,'여성악세사리팝니다.','목걸이',24000,'2016-10-22','의류','악세서리','판매대기중') ;

insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('lll',borderInfo_seq.nextval,'중고화분팔아요~','화분',66000,'2016-10-23','생활','인테리어','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('aaa',borderInfo_seq.nextval,'중고 커피포트기','커피포트',13000,'2016-10-24','생활','부엌용품','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('bbb',borderInfo_seq.nextval,'스팀해빙기중고요','해빙기',12000,'2016-10-25','생활','공구용품','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('ccc',borderInfo_seq.nextval,'침대커버팔아요','침대커버',700000,'2016-10-26','생활','침실용품','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('ddd',borderInfo_seq.nextval,'여성코트팝니다','가을코트',125000,'2016-10-27','의류','여성의류','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('eee',borderInfo_seq.nextval,'청바지팔아요','옅청바지',33000,'2016-10-28','의류','남성의류','판매대기중') ;



---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('ccc',borderInfo_seq.nextval,'hp컴 중고에요','hp컴',380000,'2016-10-24','전자제품','컴퓨터','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('ddd',borderInfo_seq.nextval,'에어컨팝니다','에어컨',700000,'2016-10-25','전자제품','가전제품','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('eee',borderInfo_seq.nextval,'레노버팔아요','레노버노트북',90000,'2016-10-16','전자제품','멀티미디어','판매대기중');
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('fff',borderInfo_seq.nextval,'아이폰6판매','아이폰6_16g',120000,'2016-10-27','전자제품','휴대폰','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('ggg',borderInfo_seq.nextval,'캐논복합기','캐논잉크프린터',78000,'2016-10-28','전자제품','프린터','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('hhh',borderInfo_seq.nextval,'연카키코트팔아요','여성코트',88000,'2016-10-18','의류','여성의류','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('iii',borderInfo_seq.nextval,'남성진청점퍼','남성점퍼',60000,'2016-10-19','의류','남성의류','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('jjj',borderInfo_seq.nextval,'남아 겉옷 지퍼조끼','남아복',30000,'2016-10-20','의류','영유아','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('kkk',borderInfo_seq.nextval,'신발 팝니다','남성구두',89000,'2016-10-21','의류','신발','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('lll',borderInfo_seq.nextval,'악세서리팝니다.','반지',14000,'2016-10-22','의류','악세서리','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('aaa',borderInfo_seq.nextval,'잡화중고올립니다','장식품',2000,'2016-10-23','생활','인테리어','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('bbb',borderInfo_seq.nextval,'스댕접시팝니다','접시',30000,'2016-10-24','생활','부엌용품','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('ccc',borderInfo_seq.nextval,'공구셋트팔아요','공구세트',8000,'2016-10-25','생활','공구용품','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('ddd',borderInfo_seq.nextval,'책꽂이중고팜','책장',43000,'2016-10-26','생활','침실용품','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('eee',borderInfo_seq.nextval,'니트형 겉옷팔아요','여성스웨터',35000,'2016-10-27','의류','여성의류','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('fff',borderInfo_seq.nextval,'스트라이프 긴팔팔아요','남성 상의',15000,'2016-10-28','의류','남성의류','판매대기중') ;


select * from borderinfo;
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('ddd',borderInfo_seq.nextval,'컴퓨터팔아요','xeon컴퓨터',490000,'2016-10-24','전자제품','컴퓨터','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('eee',borderInfo_seq.nextval,'에어프라이기중고','에어프라이기',18000,'2016-10-25','전자제품','가전제품','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('fff',borderInfo_seq.nextval,'캠코더팝니다.','캠코더',245000,'2016-10-16','전자제품','멀티미디어','판매대기중');
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('ggg',borderInfo_seq.nextval,'갤노트2팔아요','갤노트2',89000,'2016-10-27','전자제품','휴대폰','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('hhh',borderInfo_seq.nextval,'엡손프린터팔아요','엡손프린터',60000,'2016-10-28','전자제품','프린터','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('iii',borderInfo_seq.nextval,'여성롱셔츠팜','여성롱셔츠',50000,'2016-10-18','의류','여성의류','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('ggg',borderInfo_seq.nextval,'남성점퍼팔아요','남성점퍼',50000,'2016-10-19','의류','남성의류','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('hhh',borderInfo_seq.nextval,'남아 셔츠팜','남아복',29000,'2016-10-20','의류','영유아','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('iii',borderInfo_seq.nextval,'신발 팝니다','운동화',70000,'2016-10-21','의류','신발','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('jjj',borderInfo_seq.nextval,'귀걸이팔아요.','귀걸이',19900,'2016-10-22','의류','악세서리','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('kkk',borderInfo_seq.nextval,'악세서리 팝니다','꽃다발',5000,'2016-10-23','생활','인테리어','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('lll',borderInfo_seq.nextval,'냄비팔아요','냄비',16000,'2016-10-24','생활','부엌용품','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('aaa',borderInfo_seq.nextval,'공구세트팜','공구세트',9000,'2016-10-25','생활','공구용품','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('bbb',borderInfo_seq.nextval,'화장대','화장대',700000,'2016-10-26','생활','침실용품','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('ccc',borderInfo_seq.nextval,'레깅스팝니다','레깅스',18000,'2016-10-27','의류','여성의류','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('ddd',borderInfo_seq.nextval,'나이키집업상의','남성코트',100000,'2016-10-28','의류','남성의류','판매대기중') ;


---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('eee',borderInfo_seq.nextval,'dell팝니다','dell컴퓨터',540000,'2016-10-24','전자제품','컴퓨터','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('fff',borderInfo_seq.nextval,'전기온풍기팔아요','온풍기',110000,'2016-10-25','전자제품','가전제품','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('ggg',borderInfo_seq.nextval,'소니캠코더팔아요','캠코더팝니다',150000,'2016-10-16','전자제품','멀티미디어','판매대기중');
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('hhh',borderInfo_seq.nextval,'갤노트3팝니다','갤노트3',99000,'2016-10-27','전자제품','휴대폰','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('iii',borderInfo_seq.nextval,'epson팔아요','엡손프린터',90000,'2016-10-28','전자제품','프린터','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('jjj',borderInfo_seq.nextval,'스커트팝니다','여성치마',29000,'2016-10-18','의류','여성의류','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('kkk',borderInfo_seq.nextval,'점퍼팝니다','남성점퍼',80000,'2016-10-19','의류','남성의류','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('lll',borderInfo_seq.nextval,'남아 셔츠팝니다','남아복',30000,'2016-10-20','의류','영유아','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('aaa',borderInfo_seq.nextval,'신발 팝니다','남성슈즈',52000,'2016-10-21','의류','신발','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('bbb',borderInfo_seq.nextval,'악세서리팝니다.','반지',13000,'2016-10-22','의류','악세서리','판매대기중') ;

insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('ccc',borderInfo_seq.nextval,'현관문','현관문인테리어',430000,'2016-10-23','생활','인테리어','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('ddd',borderInfo_seq.nextval,'보온컵','보온컵',7000,'2016-10-24','생활','부엌용품','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('eee',borderInfo_seq.nextval,'멀티공구셋트','공구셋트',60000,'2016-10-25','생활','공구용품','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('fff',borderInfo_seq.nextval,'화장대팔아요','화장대',220000,'2016-10-26','생활','침실용품','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('ggg',borderInfo_seq.nextval,'여성팬츠팔아요','그레이팬츠',42500,'2016-10-27','의류','여성의류','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('hhh',borderInfo_seq.nextval,'남성패딩팝니다','남성상의',150000,'2016-10-28','의류','남성의류','판매대기중') ;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('fff',borderInfo_seq.nextval,'중고컴퓨터','맥에어',150000,'2016-10-24','전자제품','컴퓨터','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('ggg',borderInfo_seq.nextval,'정수기 중고팜','정수기',240000,'2016-10-25','전자제품','가전제품','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('hhh',borderInfo_seq.nextval,'삼성노트북팔아요','삼성노트북',150000,'2016-10-16','전자제품','멀티미디어','판매대기중');
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('iii',borderInfo_seq.nextval,'갤노트5팔아여','갤노트5',550000,'2016-10-27','전자제품','휴대폰','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('jjj',borderInfo_seq.nextval,'엡손팔아요','엡손프린터',90000,'2016-10-28','전자제품','프린터','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('kkk',borderInfo_seq.nextval,'여성치마팔아요~','여성치마',25000,'2016-10-18','의류','여성의류','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('lll',borderInfo_seq.nextval,'남성반팔셔츠중고요~','남성상의',34000,'2016-10-19','의류','남성의류','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('aaa',borderInfo_seq.nextval,'남아 우주복','남아복',25000,'2016-10-20','의류','영유아','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('bbb',borderInfo_seq.nextval,'신발 중고팔아요','나이키런닝화',70000,'2016-10-21','의류','신발','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('ccc',borderInfo_seq.nextval,'장미브로치.','브로치',39000,'2016-10-22','의류','악세서리','판매대기중') ;

insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('ddd',borderInfo_seq.nextval,'벽걸이팝니다','벽걸이',15000,'2016-10-23','생활','인테리어','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('eee',borderInfo_seq.nextval,'양은주전자팔아요','주전자',7000,'2016-10-24','생활','부엌용품','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('fff',borderInfo_seq.nextval,'공구세트팔아요','공구연장셋트',12000,'2016-10-25','생활','공구용품','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('ggg',borderInfo_seq.nextval,'침대팔아요','침대',440000,'2016-10-26','생활','침실용품','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('hhh',borderInfo_seq.nextval,'여성핫팬츠팔아요','여성하의',13500,'2016-10-27','의류','여성의류','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('iii',borderInfo_seq.nextval,'패딩팝니다','남성패딩',130000,'2016-10-28','의류','남성의류','판매대기중') ;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('ggg',borderInfo_seq.nextval,'중고컴팝니다','중고조립컴',430000,'2016-10-24','전자제품','컴퓨터','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('hhh',borderInfo_seq.nextval,'중고조립컴퓨터','중고조립컴',337000,'2016-10-25','전자제품','가전제품','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('iii',borderInfo_seq.nextval,'미니캠코더팔아요','미니캠코더',150000,'2016-10-16','전자제품','멀티미디어','판매대기중');
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('jjj',borderInfo_seq.nextval,'아이폰5S팔아요','아이폰5S',80000,'2016-10-27','전자제품','휴대폰','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('kkk',borderInfo_seq.nextval,'EPSON팝니다','EPSON프린터',90000,'2016-10-28','전자제품','프린터','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('lll',borderInfo_seq.nextval,'여성핫팬츠팔아요','여성하의',20000,'2016-10-18','의류','여성의류','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('aaa',borderInfo_seq.nextval,'청바지 팔아요','남청바지',20000,'2016-10-19','의류','남성의류','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('bbb',borderInfo_seq.nextval,'유아짚업후드','유아복',55000,'2016-10-20','의류','영유아','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('ccc',borderInfo_seq.nextval,'중고신발','남성신발',75000,'2016-10-21','의류','신발','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('ddd',borderInfo_seq.nextval,'반지팔아요.','반지',15500,'2016-10-22','의류','악세서리','판매대기중') ;



insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('aaa',borderInfo_seq.nextval,'결제판팝니다~','결제판',1500,'2016-10-22','사무용품','문구','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('bbb',borderInfo_seq.nextval,'문구팔아요','문구류',5500,'2016-10-23','사무용품','문구','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('ccc',borderInfo_seq.nextval,'문구제품중고','문구류',4500,'2016-10-24','사무용품','문구','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('ddd',borderInfo_seq.nextval,'문구품','문구류',6500,'2016-10-25','사무용품','문구','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('eee',borderInfo_seq.nextval,'보드마카 팝니다','문구류',7500,'2016-10-26','사무용품','문구','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('fff',borderInfo_seq.nextval,'바인더팔아요','바인더',2500,'2016-10-27','사무용품','문구','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('ggg',borderInfo_seq.nextval,'바인더세트','바인더',8500,'2016-10-28','사무용품','문구','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('hhh',borderInfo_seq.nextval,'바인더중고','바인더',1500,'2016-10-29','사무용품','문구','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('iii',borderInfo_seq.nextval,'연필꽂이 팜','연필꽂이',3500,'2016-10-30','사무용품','문구','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('jjj',borderInfo_seq.nextval,'클립팔아요~','더블클립',2500,'2016-10-22','사무용품','문구','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('kkk',borderInfo_seq.nextval,'파일팝니다','파일',1500,'2016-10-23','사무용품','문구','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('lll',borderInfo_seq.nextval,'파일집팜','파일집',1500,'2016-10-24','사무용품','문구','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('aaa',borderInfo_seq.nextval,'펜 중고 ','펜',12000,'2016-10-25','사무용품','문구','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('bbb',borderInfo_seq.nextval,'펜 중고팔아요','펜',11500,'2016-10-26','사무용품','문구','판매대기중') ;



insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('aaa',borderInfo_seq.nextval,'감열지팔아요','감열지',11500,'2016-10-22','사무용품','종이','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('bbb',borderInfo_seq.nextval,'라벨지팝니다','라벨지',19000,'2016-10-23','사무용품','종이','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('ccc',borderInfo_seq.nextval,'라벨지급매','라벨지',17000,'2016-10-24','사무용품','종이','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('ddd',borderInfo_seq.nextval,'라벨지필요하신분','라벨지',20000,'2016-10-25','사무용품','종이','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('eee',borderInfo_seq.nextval,'라벨지중고팜','라벨지',21000,'2016-10-26','사무용품','종이','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('fff',borderInfo_seq.nextval,'라벨지 팔아요~','라벨지',16900,'2016-10-27','사무용품','종이','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('ggg',borderInfo_seq.nextval,'라벨피 중고판매','라벨지',21000,'2016-10-28','사무용품','종이','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('hhh',borderInfo_seq.nextval,'복사지판매','복사용지박스',2000,'2016-10-29','사무용품','종이','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('iii',borderInfo_seq.nextval,'복사지중고','복사용지박스',2000,'2016-10-30','사무용품','종이','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('jjj',borderInfo_seq.nextval,'복사지 팔아요~','복사용지박스',2000,'2016-10-22','사무용품','종이','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('kkk',borderInfo_seq.nextval,'칼라용지중고판매','칼라용지',2000,'2016-10-23','사무용품','종이','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('lll',borderInfo_seq.nextval,'컬러색지판매합니다','컬러색지',2000,'2016-10-24','사무용품','종이','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('aaa',borderInfo_seq.nextval,'색지팝니다.','컬러색지',2000,'2016-10-25','사무용품','종이','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('bbb',borderInfo_seq.nextval,'포토용지중고','포토용지',3500,'2016-10-26','사무용품','종이','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('ccc',borderInfo_seq.nextval,'포토용지팔요하신분','포토용지',3000,'2016-10-27','사무용품','종이','판매대기중') ;




insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('aaa',borderInfo_seq.nextval,'사무용품들 중고','잡물품',3000,'2016-10-22','사무용품','기타','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('bbb',borderInfo_seq.nextval,'소파의자중고','소파의자',3000,'2016-10-23','사무용품','기타','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('ccc',borderInfo_seq.nextval,'와이어바인더팝니다','와이어바인더',3000,'2016-10-24','사무용품','기타','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('ddd',borderInfo_seq.nextval,'의자테이블중고','의자테이블',3000,'2016-10-25','사무용품','기타','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('eee',borderInfo_seq.nextval,'사무용의자중고','의자',9000,'2016-10-26','사무용품','기타','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('fff',borderInfo_seq.nextval,'사무용의자','의자',8000,'2016-10-27','사무용품','기타','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('ggg',borderInfo_seq.nextval,'접의식의자 중고','의자',10000,'2016-10-28','사무용품','기타','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('hhh',borderInfo_seq.nextval,'장갑팔아요','장갑',3000,'2016-10-29','사무용품','기타','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('iii',borderInfo_seq.nextval,'종이컵홀더','종이컵홀더',4000,'2016-10-30','사무용품','기타','판매대기중') ;



insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('aaa',borderInfo_seq.nextval,'tongueDepressor중고','TD',6000,'2016-10-22','의학용품','진찰기','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('bbb',borderInfo_seq.nextval,'램프팝니다','램프',12000,'2016-10-23','의학용품','진찰기','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('ccc',borderInfo_seq.nextval,'청진기중고','청진기',30000,'2016-10-24','의학용품','진찰기','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('ddd',borderInfo_seq.nextval,'체온계중고','체온계',14000,'2016-10-25','의학용품','진찰기','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('eee',borderInfo_seq.nextval,'체온계팜','체온계',7000,'2016-10-26','의학용품','진찰기','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('fff',borderInfo_seq.nextval,'체온계팝니다','체온계',4000,'2016-10-27','의학용품','진찰기','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('ggg',borderInfo_seq.nextval,'청진기 팔아요','청진기',60000,'2016-10-28','의학용품','진찰기','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('hhh',borderInfo_seq.nextval,'체중계중고','체중계',16000,'2016-10-29','의학용품','진찰기','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('iii',borderInfo_seq.nextval,'체중계팜','체중계',20000,'2016-10-30','의학용품','진찰기','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('jjj',borderInfo_seq.nextval,'체중계팔아요','체중계',18000,'2016-10-22','의학용품','진찰기','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('kkk',borderInfo_seq.nextval,'체지방측정기팔아요','체지방측정기',30000,'2016-10-23','의학용품','진찰기','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('lll',borderInfo_seq.nextval,'혈압계팜','혈압계',20000,'2016-10-24','의학용품','진찰기','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('aaa',borderInfo_seq.nextval,'혈압계팝니다','혈압계',24000,'2016-10-25','의학용품','진찰기','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('bbb',borderInfo_seq.nextval,'혈압계팔아요','혈압계',34000,'2016-10-26','의학용품','진찰기','판매대기중') ;




insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('aaa',borderInfo_seq.nextval,'등허리보호대중고팜','등허리보호대',19000,'2016-10-22','의학용품','보호대','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('bbb',borderInfo_seq.nextval,'등허리보호대중고판매','등허리보호대',19000,'2016-10-24','의학용품','보호대','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('ccc',borderInfo_seq.nextval,'등허리보호대','등허리보호대',19000,'2016-10-24','의학용품','보호대','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('ddd',borderInfo_seq.nextval,'등허리보호대팔아요','등허리보호대',19000,'2016-10-25','의학용품','보호대','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('eee',borderInfo_seq.nextval,'허리보호대팜니다요','등허리보호대',19000,'2016-10-26','의학용품','보호대','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('fff',borderInfo_seq.nextval,'등허리보호대','등허리보호대',19000,'2016-10-27','의학용품','보호대','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('ggg',borderInfo_seq.nextval,'발목보호대팜','발목보호대',32000,'2016-10-28','의학용품','보호대','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('hhh',borderInfo_seq.nextval,'손목보호대 팝니다','손목보호대',24000,'2016-10-29','의학용품','보호대','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('iii',borderInfo_seq.nextval,'손목보호대팜','손목보호대',16000,'2016-10-30','의학용품','보호대','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('jjj',borderInfo_seq.nextval,'손목보호대중고','손목보호대',15000,'2016-10-22','의학용품','보호대','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('kkk',borderInfo_seq.nextval,'손목보호대팔아요~','손목보호대',13000,'2016-10-23','의학용품','보호대','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('kkk',borderInfo_seq.nextval,'손목보호대구매하실분','손목보호대',12500,'2016-10-24','의학용품','보호대','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('lll',borderInfo_seq.nextval,'임산부자세교정팜','임산부보호대',22000,'2016-10-25','의학용품','보호대','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('aaa',borderInfo_seq.nextval,'무릎보호대팔아요','무릎보호대',14000,'2016-10-26','의학용품','보호대','판매대기중') ;




insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('aaa',borderInfo_seq.nextval,'걸음보조기팜','걸음보조기',44000,'2016-10-22','의학용품','걸음보조기','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('bbb',borderInfo_seq.nextval,'걸음보조기팔아요','걸음보조기',43000,'2016-10-23','의학용품','걸음보조기','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('ccc',borderInfo_seq.nextval,'걸음보조기사실분','걸음보조기',38000,'2016-10-24','의학용품','걸음보조기','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('ddd',borderInfo_seq.nextval,'걸음보조기팝니다요','걸음보조기',29000,'2016-10-25','의학용품','걸음보조기','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('eee',borderInfo_seq.nextval,'걸음보조기팝니다','걸음보조기',28000,'2016-10-26','의학용품','걸음보조기','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('fff',borderInfo_seq.nextval,'걸음보조기팝니다~','걸음보조기',55000,'2016-10-27','의학용품','걸음보조기','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('ggg',borderInfo_seq.nextval,'걸음보조기팔아요~','걸음보조기',65000,'2016-10-28','의학용품','걸음보조기','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('hhh',borderInfo_seq.nextval,'걸음보조기중고팜','걸음보조기',63000,'2016-10-29','의학용품','걸음보조기','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('iii',borderInfo_seq.nextval,'지팡이 중고판매','지팡이',20000,'2016-10-30','의학용품','걸음보조기','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('jjj',borderInfo_seq.nextval,'지팡이 중고팝니다.','지팡이',18000,'2016-10-22','의학용품','걸음보조기','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('kkk',borderInfo_seq.nextval,'지팡이 팜','지팡이',17000,'2016-10-23','의학용품','걸음보조기','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('lll',borderInfo_seq.nextval,'지팡이 팝니다요~','지팡이',16000,'2016-10-24','의학용품','걸음보조기','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('aaa',borderInfo_seq.nextval,'지팡이 사실분','지팡이',13000,'2016-10-25','의학용품','걸음보조기','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('bbb',borderInfo_seq.nextval,'지팡이 중고판매','지팡이',19000,'2016-10-26','의학용품','걸음보조기','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('ccc',borderInfo_seq.nextval,'지팡이 팔아요~~','지팡이',21000,'2016-10-27','의학용품','걸음보조기','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('ddd',borderInfo_seq.nextval,'지팡이 중고팜','지팡이',22000,'2016-10-26','의학용품','걸음보조기','판매대기중') ;





insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('aaa',borderInfo_seq.nextval,'거즈 팜','거즈',3000,'2016-10-22','의학용품','상처케어','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('bbb',borderInfo_seq.nextval,'거즈 중고','거즈',4000,'2016-10-23','의학용품','상처케어','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('ccc',borderInfo_seq.nextval,'거즈중고판매','거즈',5000,'2016-10-24','의학용품','상처케어','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('ddd',borderInfo_seq.nextval,'거즈판매합니다','거즈',6000,'2016-10-25','의학용품','상처케어','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('eee',borderInfo_seq.nextval,'거즈사실분','거즈',7000,'2016-10-26','의학용품','상처케어','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('fff',borderInfo_seq.nextval,'붕대팔아요','붕대',13000,'2016-10-27','의학용품','상처케어','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('ggg',borderInfo_seq.nextval,'붕대사주세요','붕대',7000,'2016-10-28','의학용품','상처케어','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('hhh',borderInfo_seq.nextval,'붕대중고파매','붕대',8000,'2016-10-29','의학용품','상처케어','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('iii',borderInfo_seq.nextval,'붕대팔아요~~','붕대',6000,'2016-10-30','의학용품','상처케어','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('jjj',borderInfo_seq.nextval,'붕대중고팔아요','붕대',5000,'2016-10-22','의학용품','상처케어','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('kkk',borderInfo_seq.nextval,'붕대팜요','붕대',5500,'2016-10-23','의학용품','상처케어','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('lll',borderInfo_seq.nextval,'붕대사실분~','붕대',6500,'2016-10-24','의학용품','상처케어','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('aaa',borderInfo_seq.nextval,'밴드 중고 판매','일회용밴드',2000,'2016-10-25','의학용품','상처케어','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('bbb',borderInfo_seq.nextval,'밴드팔아요~','일회용밴드',2500,'2016-10-26','의학용품','상처케어','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('ccc',borderInfo_seq.nextval,'밴드사시분~ ','일회용밴드',3000,'2016-10-27','의학용품','상처케어','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('ddd',borderInfo_seq.nextval,'일회용밴드판매','일회용밴드',9000,'2016-10-28','의학용품','상처케어','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('eee',borderInfo_seq.nextval,'밴드 중고팔아요','일회용밴드',3500,'2016-10-29','의학용품','상처케어','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('fff',borderInfo_seq.nextval,'밴드팝니다.','일회용밴드',3200,'2016-10-30','의학용품','상처케어','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('ggg',borderInfo_seq.nextval,'밴드중고','일회용밴드',2800,'2016-10-22','의학용품','상처케어','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('hhh',borderInfo_seq.nextval,'호흡기튜브팔아요~','호흡기튜브',43000,'2016-10-23','의학용품','상처케어','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('iii',borderInfo_seq.nextval,'호흡기튜브중고','호흡기튜브',33000,'2016-10-24','의학용품','상처케어','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('jjj',borderInfo_seq.nextval,'호흡기튜브필요하신분','호흡기튜브',63000,'2016-10-25','의학용품','상처케어','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('kkk',borderInfo_seq.nextval,'호흡기튜브중고판매','호흡기튜브',73000,'2016-10-26','의학용품','상처케어','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('lll',borderInfo_seq.nextval,'화상치료제팔아요','화상치료제품',13000,'2016-10-27','의학용품','상처케어','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('aaa',borderInfo_seq.nextval,'화상치료에 좋아요','화상치료제품',12000,'2016-10-28','의학용품','상처케어','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('bbb',borderInfo_seq.nextval,'화상치료제 중고판매','화상치료제품',11000,'2016-10-29','의학용품','상처케어','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('ccc',borderInfo_seq.nextval,'화상치료제팜','화상치료제품',20000,'2016-10-30','의학용품','상처케어','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('ddd',borderInfo_seq.nextval,'화상치료제팔아요','화상치료제품',19000,'2016-10-22','의학용품','상처케어','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('eee',borderInfo_seq.nextval,'화상치료제 팜~','화상치료제품',22000,'2016-10-23','의학용품','상처케어','판매대기중') ;



insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('aaa',borderInfo_seq.nextval,'침대팔아요~~','침대',160000,'2016-10-22','가구','침구','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('bbb',borderInfo_seq.nextval,'침대중고요~~','침대',170000,'2016-10-23','가구','침구','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('ccc',borderInfo_seq.nextval,'침대중고판매','침대',130000,'2016-10-24','가구','침구','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('ddd',borderInfo_seq.nextval,'침대판매','침대',150000,'2016-10-25','가구','침구','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('eee',borderInfo_seq.nextval,'침대중고~','침대',190000,'2016-10-26','가구','침구','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('fff',borderInfo_seq.nextval,'침대팝니다~~','침대',210000,'2016-10-27','가구','침구','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('ggg',borderInfo_seq.nextval,'침대팔아요~~','침대',220000,'2016-10-28','가구','침구','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('hhh',borderInfo_seq.nextval,'침대팔아요~~','침대',230000,'2016-10-29','가구','침구','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('iii',borderInfo_seq.nextval,'침대팔아요~~','침대',240000,'2016-10-30','가구','침구','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('jjj',borderInfo_seq.nextval,'침대팔아요~~~','침대',100000,'2016-10-22','가구','침구','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('kkk',borderInfo_seq.nextval,'침대팔아요~~','침대',250000,'2016-10-23','가구','침구','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('lll',borderInfo_seq.nextval,'침대팔아요~~~','침대',290000,'2016-10-24','가구','침구','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('aaa',borderInfo_seq.nextval,'침대팔아요~~~','침대',230000,'2016-10-25','가구','침구','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('bbb',borderInfo_seq.nextval,'침대팔아요~~~','침대',230000,'2016-10-26','가구','침구','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('ccc',borderInfo_seq.nextval,'침대팔아요~~~','침대',230000,'2016-10-27','가구','침구','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('ddd',borderInfo_seq.nextval,'침대팔아요~~~','침대',230000,'2016-10-28','가구','침구','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('eee',borderInfo_seq.nextval,'침대팔아요~~~','침대',230000,'2016-10-29','가구','침구','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('eee',borderInfo_seq.nextval,'침대팔아요~~','침대',230000,'2016-10-30','가구','침구','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('fff',borderInfo_seq.nextval,'침대팔아요~~','침대',230000,'2016-10-22','가구','침구','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('ggg',borderInfo_seq.nextval,'침대팔아요~~','침대',230000,'2016-10-23','가구','침구','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('hhh',borderInfo_seq.nextval,'침대팔아요~~~','침대',230000,'2016-10-24','가구','침구','판매대기중') ;



insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('aaa',borderInfo_seq.nextval,'수납장중고요','수납장',150000,'2016-10-22','가구','벽장','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('bbb',borderInfo_seq.nextval,'수납장팔아요','수납장',90000,'2016-10-23','가구','벽장','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('ccc',borderInfo_seq.nextval,'옷장팝니다','옷장',540000,'2016-10-24','가구','벽장','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('ddd',borderInfo_seq.nextval,'옷장팝니다','옷장',430000,'2016-10-25','가구','벽장','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('eee',borderInfo_seq.nextval,'옷장팝니다','옷장',470000,'2016-10-26','가구','벽장','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('fff',borderInfo_seq.nextval,'옷장팝니다','옷장',480000,'2016-10-27','가구','벽장','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('ggg',borderInfo_seq.nextval,'옷장팝니다','옷장',580000,'2016-10-28','가구','벽장','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('hhh',borderInfo_seq.nextval,'옷장팝니다','옷장',590000,'2016-10-29','가구','벽장','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('iii',borderInfo_seq.nextval,'옷장팝니다','옷장',570000,'2016-10-30','가구','벽장','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('jjj',borderInfo_seq.nextval,'옷장팝니다','옷장',490000,'2016-10-22','가구','벽장','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('kkk',borderInfo_seq.nextval,'옷장팝니다','옷장',480000,'2016-10-23','가구','벽장','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('lll',borderInfo_seq.nextval,'옷장팝니다~~~','옷장',470000,'2016-10-24','가구','벽장','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('aaa',borderInfo_seq.nextval,'옷장팝니다~~~','옷장',450000,'2016-10-25','가구','벽장','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('bbb',borderInfo_seq.nextval,'옷장팝니다~~~','옷장',430000,'2016-10-26','가구','벽장','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('ccc',borderInfo_seq.nextval,'옷장팝니다~~~','옷장',420000,'2016-10-27','가구','벽장','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('ddd',borderInfo_seq.nextval,'옷장팝니다~~~','옷장',560000,'2016-10-28','가구','벽장','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('eee',borderInfo_seq.nextval,'옷장팝니다~~~','옷장',670000,'2016-10-29','가구','벽장','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('fff',borderInfo_seq.nextval,'옷장팝니다~~~','옷장',650000,'2016-10-30','가구','벽장','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('hhh',borderInfo_seq.nextval,'옷장팝니다~~~','옷장',640000,'2016-10-22','가구','벽장','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('iii',borderInfo_seq.nextval,'옷장팝니다~~~','옷장',380000,'2016-10-23','가구','벽장','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('iii',borderInfo_seq.nextval,'옷장팝니다~~~','옷장',350000,'2016-10-24','가구','탁자','판매대기중') ;


insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('aaa',borderInfo_seq.nextval,'테이블팝니다~~~','테이블',110000,'2016-10-22','가구','탁자','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('bbb',borderInfo_seq.nextval,'테이블팝니다~~~','테이블',120000,'2016-10-23','가구','탁자','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('ccc',borderInfo_seq.nextval,'테이블팝니다~~~','테이블',130000,'2016-10-24','가구','탁자','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('ddd',borderInfo_seq.nextval,'테이블팝니다~~~','테이블',140000,'2016-10-25','가구','탁자','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('eee',borderInfo_seq.nextval,'테이블팝니다~~~','테이블',150000,'2016-10-26','가구','탁자','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('fff',borderInfo_seq.nextval,'테이블팝니다~~~','테이블',160000,'2016-10-27','가구','탁자','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('ggg',borderInfo_seq.nextval,'테이블팝니다~~~','테이블',170000,'2016-10-28','가구','탁자','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('hhh',borderInfo_seq.nextval,'테이블팝니다~~~','테이블',180000,'2016-10-29','가구','탁자','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('iii',borderInfo_seq.nextval,'테이블팝니다~~~','테이블',190000,'2016-10-30','가구','탁자','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('jjj',borderInfo_seq.nextval,'테이블팝니다~~~','테이블',200000,'2016-10-22','가구','탁자','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('kkk',borderInfo_seq.nextval,'테이블팝니다~~~','테이블',210000,'2016-10-23','가구','탁자','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('lll',borderInfo_seq.nextval,'테이블팝니다~~~','테이블',220000,'2016-10-24','가구','탁자','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('aaa',borderInfo_seq.nextval,'테이블팝니다~~~','테이블',230000,'2016-10-25','가구','탁자','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('bbb',borderInfo_seq.nextval,'테이블팝니다~~~','테이블',240000,'2016-10-26','가구','탁자','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('ccc',borderInfo_seq.nextval,'테이블팝니다~~~','테이블',250000,'2016-10-27','가구','탁자','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('ddd',borderInfo_seq.nextval,'테이블팝니다~~~','테이블',260000,'2016-10-28','가구','탁자','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('eee',borderInfo_seq.nextval,'테이블팝니다~~~','테이블',270000,'2016-10-29','가구','탁자','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('fff',borderInfo_seq.nextval,'테이블팝니다~~~','테이블',280000,'2016-10-30','가구','탁자','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('ggg',borderInfo_seq.nextval,'테이블팝니다~~~','테이블',290000,'2016-10-22','가구','탁자','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('hhh',borderInfo_seq.nextval,'테이블팝니다~~~','테이블',300000,'2016-10-23','가구','탁자','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('iii',borderInfo_seq.nextval,'테이블팝니다~~~','테이블',310000,'2016-10-24','가구','탁자','판매대기중') ;



insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('aaa',borderInfo_seq.nextval,'소파팝니다~','소파',310000,'2016-10-24','가구','소파','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('bbb',borderInfo_seq.nextval,'소파팝니다~','소파',310000,'2016-10-24','가구','소파','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('ccc',borderInfo_seq.nextval,'소파팝니다~','소파',310000,'2016-10-24','가구','소파','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('ddd',borderInfo_seq.nextval,'소파팝니다~','소파',310000,'2016-10-24','가구','소파','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('eee',borderInfo_seq.nextval,'소파팝니다~','소파',310000,'2016-10-24','가구','소파','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('fff',borderInfo_seq.nextval,'소파팝니다~','소파',310000,'2016-10-24','가구','소파','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('ggg',borderInfo_seq.nextval,'소파팝니다~','소파',310000,'2016-10-24','가구','소파','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('hhh',borderInfo_seq.nextval,'소파팝니다~','소파',310000,'2016-10-24','가구','소파','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('iii',borderInfo_seq.nextval,'소파팝니다~','소파',310000,'2016-10-24','가구','소파','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('jjj',borderInfo_seq.nextval,'소파팝니다~','소파',310000,'2016-10-24','가구','소파','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('kkk',borderInfo_seq.nextval,'소파팝니다~','소파',310000,'2016-10-24','가구','소파','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('lll',borderInfo_seq.nextval,'소파팝니다~','소파',310000,'2016-10-24','가구','소파','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('aaa',borderInfo_seq.nextval,'소파팝니다~','소파',310000,'2016-10-24','가구','소파','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('bbb',borderInfo_seq.nextval,'소파팝니다~','소파',310000,'2016-10-24','가구','소파','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('ccc',borderInfo_seq.nextval,'소파팝니다~','소파',310000,'2016-10-24','가구','소파','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('ddd',borderInfo_seq.nextval,'소파팝니다~','소파',310000,'2016-10-24','가구','소파','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('eee',borderInfo_seq.nextval,'소파팝니다~','소파',310000,'2016-10-24','가구','소파','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('fff',borderInfo_seq.nextval,'소파팝니다~','소파',310000,'2016-10-24','가구','소파','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('ggg',borderInfo_seq.nextval,'소파팝니다~','소파',310000,'2016-10-24','가구','소파','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('hhh',borderInfo_seq.nextval,'소파팝니다~','소파',310000,'2016-10-24','가구','소파','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('iii',borderInfo_seq.nextval,'소파팝니다~','소파',310000,'2016-10-24','가구','소파','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('jjj',borderInfo_seq.nextval,'소파팝니다~','소파',310000,'2016-10-24','가구','소파','판매대기중') ;
insert into borderinfo(id,border_number,content,itemname,money,daydate,category,sub_category,itemstate)  values ('kkk',borderInfo_seq.nextval,'소파팝니다~','소파',310000,'2016-10-24','가구','소파','판매대기중') ;



select border_number,sub_category,category from borderinfo order by sub_category; 

select * from borderinfo;