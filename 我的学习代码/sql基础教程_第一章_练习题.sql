-- 练习1

CREATE TABLE Addressbook (   # 表名不区分大小写
	regist_no INTEGER NOT NULL,
	NAME VARCHAR ( 128 ) NOT NULL,  # 字段名区分大小写
	address VARCHAR ( 128 ) NOT NULL,
	tel_no CHAR ( 10 ),
	MAIL_address CHAR ( 20 ),
	PRIMARY KEY ( regist_no ) 
);

DROP table addressbook;

/*
答案
CREATE TABLE Addressbook
 (
   regist_no    INTEGER      NOT NULL,
   name        VARCHAR(128) NOT NULL,
   address       VARCHAR(256) NOT NULL,
   tel_no       CHAR(10)     ,
   mail_address CHAR(20)     ,
   PRIMARY KEY (regist_no));
*/

-- 练习2

ALTER table addressbook add COLUMN postal_code char(8) not null;
SELECT * from addressbook;