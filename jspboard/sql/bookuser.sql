-- 1. bookuser 테이블에 회원정보 저장하기
-- 방법1) sql 수업때 사용한 테이블을 복사해서 새로운 테이블 만들기

select * from j_custom;
create table bookuser
as
select * from j_custom;


alter table bookuser 
rename column custom_id to id;

-- 또는 방법2) j_custom 테이블이 없으면 직접 생성하기
CREATE TABLE bookuser (
	id VARCHAR2(20) primary key, 
	name NVARCHAR2(20) NOT NULL , 
	email VARCHAR2(20) unique, 
	age NUMBER(3,0), 
	reg_date DATE default sysdate, 
	password VARCHAR2(64)
   );
INSERT INTO BOOKUSER VALUES ('twice','박모모','momo@daum.net',39,TIMESTAMP'2022-02-05 00:00:00.0','1234');
INSERT INTO BOOKUSER VALUES ('mina012','김미나','kimm@gmail.com',20,TIMESTAMP'2022-02-07 15:03:06.0','1234');
INSERT INTO BOOKUSER VALUES ('hongGD','홍길동','giluug@naver.com',30,TIMESTAMP'2022-02-07 00:00:00.0','1234');
INSERT INTO BOOKUSER VALUES ('wonder','이나나','nana@korea.kr',22,TIMESTAMP'2022-02-05 00:00:00.0','1234');
INSERT INTO BOOKUSER VALUES ('sana','이사나','yu@naver.com',22,TIMESTAMP'2022-08-04 14:42:05.0','1234');
   

select * from BOOKUSER;
   
-- 2. community 테이블 writer 컬럼값 변경을 위해 데이터 모두 삭제하고 다시 insert
-- 1) 데이터 삭제
TRUNCATE TABLE community ;

-- 2) 확인 : 데이터 없어야 함.
select * from community;

-- 3) writer 컬럼값은 bookuser 테이블에 있는 id 로 해서 insert.
INSERT INTO community (idx,writer,title,content)
VALUES (community_idx_seq.nextval, 'hongGD','알립니다.','오늘 모임 변경안내입니다.');
INSERT INTO community (idx,writer,title,content)
VALUES (community_idx_seq.nextval, 'twice','공지','공지공지');
INSERT INTO community (idx,writer,title,content)
VALUES (community_idx_seq.nextval, 'wonder','하이','하이하이!!');
INSERT INTO community (idx,writer,title,content)
VALUES (community_idx_seq.nextval, 'sana','이벤트','이벤트 안내입니다.');
INSERT INTO community (idx,writer,title,content)
VALUES (community_idx_seq.nextval, 'mina012','재공지','재공지재공지');
INSERT INTO community (idx,writer,title,content)
VALUES (community_idx_seq.nextval, 'wonder','정회원 공지','정회원 안내입니다.');
INSERT INTO community (idx,writer,title,content)
VALUES (community_idx_seq.nextval, 'twice','정회원 공55지','정회원 안내입니다.');
INSERT INTO community (idx,writer,title,content)
VALUES (community_idx_seq.nextval, 'hongGD','정회원 공66지','정회원 안내입니다.');
INSERT INTO community (idx,writer,title,content)
VALUES (community_idx_seq.nextval, 'hongGD','정회원 공77지','정회원 안내입니다.');
INSERT INTO community (idx,writer,title,content)
VALUES (community_idx_seq.nextval, 'sana','정회원 공88지','정회원 안내입니다.');
SELECT * FROM COMMUNITY c ;