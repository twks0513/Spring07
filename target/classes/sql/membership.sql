create table membership(
id VARCHAR(20) PRIMARY key,
pw VARCHAR(100),
addr VARCHAR(300)
);

alter table membership add 
   login_cookie varchar2(100) default 'nan' not null;