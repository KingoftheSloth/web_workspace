CREATE TABLE Animal (
    desertionNo VARCHAR2(20) PRIMARY KEY,
    kind VARCHAR2(255),
    breed VARCHAR2(255),
    neuterYn VARCHAR(1),
    processState VARCHAR2(255),
    happenDt VARCHAR2(8),
    weight VARCHAR2(255),
    filename VARCHAR2(255),
    age varchar2(255)
);

select * from Animal

drop table Animal;