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
