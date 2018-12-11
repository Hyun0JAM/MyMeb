 ---------- **** JSP & Servlet **** -----------
 
 show user;
 -- USER이(가) "MYORAUSER"입니다.
 
 ---- 회원테이블 생성 ----ㅑㅜㄴㄷㄳ
create table jsp_member
(idx          number(10)   not null   -- 회원번호(시퀀스로 데이터가 들어온다)
,userid       varchar2(20) not null   -- 회원아이디
,name         varchar2(30) not null   -- 회원명
,pwd          varchar2(200) not null  -- 비밀번호 (SHA-256 암호화 대상)
,email        varchar2(200) not null  -- 이메일   (AES-256 암호화/복호화 대상)
,hp1          char(3)                 -- 휴대폰
,hp2          varchar2(200)           --         (AES-256 암호화/복호화 대상) 
,hp3          varchar2(200)           --         (AES-256 암호화/복호화 대상)
,post1        char(3)                 -- 우편번호
,post2        char(3) 
,addr1        varchar2(200)           -- 주소
,addr2        varchar2(200)  
,gender       char(1)                 -- 성별     남자 : 1 / 여자 : 2
,birthday     varchar2(8)             -- 생년월일 
,coin         number default 0        -- 코인액
,point        number default 0        -- 포인트 
,registerday  date default sysdate    -- 가입일자
,status       number(1) default 1     -- 회원탈퇴유무   1:사용가능(가입중) / 0:사용불능(탈퇴) 
,constraint   PK_jsp_member_idx primary key(idx)
,constraint   UQ_jsp_member_userid unique(userid)
,constraint   CK_jsp_member_gender check( gender in('1','2') ) 
,constraint   CK_jsp_member_status check( status in(0,1) ) 
);
alter table jsp_member
add constraint  CK_jsp_member_status check( status in(0,1) ) ;
desc jsp_member;

create sequence seq_jsp_member
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

--- 로그인을 위한 복합인덱스 생성 --
create index index_jsp_member_composite
on jsp_member(userid, idx, name, pwd, coin, point);

desc jsp_member;
insert into jsp_member(IDX,USERID,NAME,PWD,EMAIL,HP1,HP2,HP3,POST1,POST2,ADDR1,ADDR2,GENDER,BIRTHDAY,COIN,POINT,REGISTERDAY,STATUS) values(seq_jsp_member.nextval,?,?,?,?,?,?,?,?,?,?,?,?,?,default,default,default,default);

select IDX,USERID,NAME,PWD,EMAIL,HP1,HP2,HP3,POST1,POST2,ADDR1,ADDR2,GENDER,BIRTHDAY,COIN,POINT
      ,to_char(REGISTERDAY,'yyyy-mm-dd') as REGISTERDAY,STATUS 
from jsp_member
where status=1
order by idx desc;

create table jsp_member
as
select *
from jsp_member_temp;

delete from jsp_member;

drop table jsp_member;

commit;
-------------------------------------------------------------------
----- **** 페이징 처리를 위해서 회원을 많이 가입시켜 봅니다. ****
declare
    v_cnt number(3) := 1;
begin
    loop
        insert into jsp_member(IDX,USERID,NAME,PWD,EMAIL,HP1,HP2,HP3,POST1,POST2,ADDR1,ADDR2,GENDER,BIRTHDAY,COIN,POINT,REGISTERDAY,STATUS) 
        values(seq_jsp_member.nextval,'kimth'||v_cnt,'정유미'||v_cnt,'18006e2ca1c2129392c66d87334bd2452c572058d406b4e85f43c1f72def10f5','usQPZroRhF0QCKAiY+BbuA==','010','wdSLAW2S6TFiasJd6HMVjA==','EEsn21DeI+3crz3C5noPcQ==','150','123','서울 노원구 쌍문로 123',v_cnt||'호',2,'19951020',default,default,default,default);  
        v_cnt:=v_cnt+1;
    exit when v_cnt>80;
    end loop;
end;
--
declare
    v_cnt number(3) := 1;
begin
    loop
        insert into jsp_member(IDX,USERID,NAME,PWD,EMAIL,HP1,HP2,HP3,POST1,POST2,ADDR1,ADDR2,GENDER,BIRTHDAY,COIN,POINT,REGISTERDAY,STATUS) 
        values(seq_jsp_member.nextval,'chaew'||v_cnt,'차은우'||v_cnt,'18006e2ca1c2129392c66d87334bd2452c572058d406b4e85f43c1f72def10f5','usQPZroRhF0QCKAiY+BbuA==','010','wdSLAW2S6TFiasJd6HMVjA==','EEsn21DeI+3crz3C5noPcQ==','150','123','서울 영등포구 윤중로 123',v_cnt||'호',1,'19970920',default,default,default,default);  
        v_cnt:=v_cnt+1;
    exit when v_cnt>80;
    end loop;
end;
--
declare
    v_cnt number(3) := 1;
begin
    loop
        insert into jsp_member(IDX,USERID,NAME,PWD,EMAIL,HP1,HP2,HP3,POST1,POST2,ADDR1,ADDR2,GENDER,BIRTHDAY,COIN,POINT,REGISTERDAY,STATUS) 
        values(seq_jsp_member.nextval,'kimkh'||v_cnt,'김국하'||v_cnt,'18006e2ca1c2129392c66d87334bd2452c572058d406b4e85f43c1f72def10f5','usQPZroRhF0QCKAiY+BbuA==','010','wdSLAW2S6TFiasJd6HMVjA==','EEsn21DeI+3crz3C5noPcQ==','150','123','경기 수원시 인계로 123',v_cnt||'호',1,'19980505',default,default,default,default);  
        v_cnt:=v_cnt+1;
    exit when v_cnt>80;
    end loop;
end;

commit;
show user;


select *
from jsp_member
order by idx desc;


select IDX,USERID,NAME,PWD,EMAIL,HP1,HP2,HP3,POST1,POST2,ADDR1,ADDR2,GENDER,BIRTHDAY,COIN,POINT
      ,to_char(REGISTERDAY,'yyyy-mm-dd') as REGISTERDAY,STATUS 
from jsp_member
where status=1
order by idx desc;

select *
from user_tab_columns
where table_name = 'JSP_MEMBER';

alter table jsp_member
modify coin default 0;

alter table jsp_member
modify point default 0;

alter table jsp_member
modify registerday default sysdate;

alter table jsp_member
modify status default 1;

update jsp_member set coin = default, point = default, registerday = default, status = default;

commit;

String sql = "select RNO,IDX,USERID,NAME,PWD,EMAIL,HP1,HP2,HP3,POST1,POST2,ADDR1,ADDR2,GENDER,BIRTHDAY,COIN,POINT,REGISTERDAY,STATUS \n"+
"from(\n"+
"    select rownum as RNO,IDX,USERID,NAME,PWD,EMAIL,HP1,HP2,HP3,POST1,POST2,ADDR1,ADDR2,GENDER,BIRTHDAY,COIN,POINT,REGISTERDAY,STATUS \n"+
"    from(\n"+
"        select IDX,USERID,NAME,PWD,EMAIL,HP1,HP2,HP3,POST1,POST2,ADDR1,ADDR2,GENDER,BIRTHDAY,COIN,POINT\n"+
"              ,to_char(REGISTERDAY,'yyyy-mm-dd') as REGISTERDAY,STATUS \n"+
"        from jsp_member\n"+
"        where status=1\n"+
"        order by idx desc\n"+
"    )V\n"+
")T\n"+
"where T.rno between 1 and 10";;-- 1페이지당 10개를 보여줄때 1page에 해당하는 내용물

select count(*)
from jsp_member
where status=1;

--1 페이지당 10개를 보여줄때 페이지바에 나타날 페이지 갯수는?
select count(*)/10 -- 24.3
      ,ceil(count(*)/10) as "페이지수" -- 무조건 올려주는 함수
from jsp_member
where status = 1;
--1 페이지당 5개를 보여줄때 페이지바
select count(*)/5 -- 48.6
      ,ceil(count(*)/5) as "페이지수"
from jsp_member
where status = 1;
--1 페이지당 3개를 보여줄때 페이지바
String sql = "select count(*)/3 -- 81\n"+
"      ,ceil(count(*)/3) as "페이지수"\n"+
"from jsp_member\n"+
"where status = 1;";

update jsp_member set registerday = sysdate
where idx=83;

update jsp_member set registerday=sysdate
where idx between 204 and 243;

update jsp_member set registerday = add_months(registerday,-2)
where idx between 1 and 50;

update jsp_member set registerday = add_months(registerday,-1)
where idx between 51 and 100;

update jsp_member set registerday = registerday-20
where idx between 101 and 150;

update jsp_member set registerday = registerday-10
where idx between 151 and 180;

commit;

update jsp_member set email='HFSyg9aQos5fincDkbTROg=='
where idx between 236 and 240;

-------------------------------------------------------------
-- 1. 전체회원 갯수
select count(*)
from jsp_member
where status=1;
-- 2. 최근 3일이내 가입한 회원갯수
select count(*)
from jsp_member
where status=1 and registerday>sysdate-2;
-- 3. 최근 10일이내 가입한 회원갯수
select count(*)
from jsp_member
where status=1 and registerday>sysdate-10;
-- 4. 최근 30일이내 가입한 회원갯수
select count(*)
from jsp_member
where status=1 and registerday>add_months(sysdate,-1);
-- 5. 최근 60일이내 가입한 회원갯수
select count(*)
from jsp_member
where status=1 and registerday>add_months(sysdate,-2);
--
String sql = "select count(*)\n"+
"from jsp_member\n"+
"where to_date(to_char(sysdate, 'yyyy-mm-dd'), 'yyyy-mm-dd') - to_date(to_char(registerday, 'yyyy-mm-dd'), 'yyyy-mm-dd') <=10;";

-- 최근 3일이내 가입한 회원중에 이름이 '국하'인 회원의 갯수
select*
from jsp_member
where email= 'HFSyg9aQos5fincDkbTROg==';
      
-- 최근 3일이내 가입한 회원중에 이메일이 'naver.com'인 회원의 갯수
select*
from jsp_member
where to_date(to_char(sysdate, 'yyyy-mm-dd'), 'yyyy-mm-dd') - to_date(to_char(registerday, 'yyyy-mm-dd'), 'yyyy-mm-dd') <=3
      and name like '%국하%';
      
commit;

String sql = "select IDX,USERID,NAME,PWD,EMAIL,HP1,HP2,HP3,POST1,POST2,ADDR1,ADDR2,GENDER,BIRTHDAY\n"+
"from jsp_member\n"+
"where idx=10;\n";

String sql = "update jsp_member set status = 0\n"+
"where idx = ? ";