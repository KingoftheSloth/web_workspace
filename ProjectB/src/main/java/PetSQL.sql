CREATE TABLE Animal (
    desertionNo VARCHAR2(100) PRIMARY KEY,
    filename VARCHAR2(255),
    happenDt VARCHAR2(255),
    kind VARCHAR2(255),
    breed VARCHAR2(255),
    colorCd VARCHAR2(255),
    age VARCHAR2(255),
    weight VARCHAR2(255),
    processState VARCHAR2(255),
    sexCd VARCHAR2(255),
    neuterYn VARCHAR2(255),
    specialMark VARCHAR2(255),
    careNm VARCHAR2(255)
);

CREATE TABLE Shelter (
   careidx number primary key,
   careTel VARCHAR2(20),
   careAddr VARCHAR2(255),
careNm VARCHAR2(255)
    );
    
    create sequence careidx; 

drop table Animal;
drop table Shelter;
Select * from Shelter;
Select * from Animal;

CREATE TABLE ADOPT (
	ADOPTIDX NUMBER PRIMARY KEY,
	ANIID VARCHAR2(255),
	USERID VARCHAR2(255),
 	ADOPTDATE VARCHAR2(255),
 	FileName VARCHAR2(255)
 );

CREATE SEQUENCE ADOPT_IDX;
DROP SEQUENCE APOPTIDX;

SELECT * FROM ADOPT;
drop table adopt;




CREATE TABLE USERS
(
   USERID varchar2(30) NOT NULL,
   USERCATE varchar2(15) NOT NULL,
   USERPASS varchar2(40) NOT NULL,
   USERNAME varchar2(20) NOT NULL,
   USERNICK varchar2(40) NOT NULL UNIQUE,
   USERAGE number NOT NULL,
   USERCITY varchar2(30) NOT NULL,
   USEREMAIL varchar2(50) NOT NULL,
   USERPHONE varchar2(15) NOT NULL,
   USERDATE date NOT NULL,
   PRIMARY KEY (USERID)
);

select * from USERS
drop table users;
INSERT INTO USERS VALUES ('test','사용자','jj','박종화','test',22,'경기도','sdcfd@naver.com','010-6487-3611',sysdate);

create TABLE message
(   userid varchar2(30) NOT NULL,
	aniid varchar2(50) NOT NULL,
	message varchar2(255) NOT NULL
);

select * from MESSAGE
