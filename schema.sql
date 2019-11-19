-- Create table
create table APP_USER
(
  USER_ID           NUMBER(19) not null,
  USER_NAME         VARCHAR2(36) not null,
  ENCRYTED_PASSWORD VARCHAR2(128) not null,
  ENABLED           NUMBER(1) not null 
) ;
--  
alter table APP_USER
  add constraint APP_USER_PK primary key (USER_ID);
  
alter table APP_USER
  add constraint APP_USER_UK unique (USER_NAME);
 
 
-- Create table
create table APP_ROLE
(
  ROLE_ID   NUMBER(19) not null,
  ROLE_NAME VARCHAR2(30) not null
) ;
--  
alter table APP_ROLE
  add constraint APP_ROLE_PK primary key (ROLE_ID);
  
alter table APP_ROLE
  add constraint APP_ROLE_UK unique (ROLE_NAME);
 
 
-- Create table
create table USER_ROLE
(
  ID      NUMBER(19) not null,
  USER_ID NUMBER(19) not null,
  ROLE_ID NUMBER(19) not null
);
--  
alter table USER_ROLE
  add constraint USER_ROLE_PK primary key (ID);
  
alter table USER_ROLE
  add constraint USER_ROLE_UK unique (USER_ID, ROLE_ID);
  
alter table USER_ROLE
  add constraint USER_ROLE_FK1 foreign key (USER_ID)
  references APP_USER (USER_ID);
  
alter table USER_ROLE
  add constraint USER_ROLE_FK2 foreign key (ROLE_ID)
  references APP_ROLE (ROLE_ID);
 
-- Used by Spring Remember Me API.  
CREATE TABLE Persistent_Logins (
 
    username varchar2(64) not null,
    series varchar2(64) not null,
    token varchar2(64) not null,
    last_used Date not null,
    PRIMARY KEY (series)
     
);
--------------------------------------
 
insert into App_User (USER_ID, USER_NAME, ENCRYTED_PASSWORD, ENABLED)
values (2, 'dbuser1', '$2a$10$PrI5Gk9L.tSZiW9FXhTS8O8Mz9E97k2FZbFvGFFaSsiTUIl.TCrFu', 1);
 
insert into App_User (USER_ID, USER_NAME, ENCRYTED_PASSWORD, ENABLED)
values (1, 'dbadmin1', '$2a$10$PrI5Gk9L.tSZiW9FXhTS8O8Mz9E97k2FZbFvGFFaSsiTUIl.TCrFu', 1);
 
---
 
insert into app_role (ROLE_ID, ROLE_NAME)
values (1, 'ROLE_ADMIN');
 
insert into app_role (ROLE_ID, ROLE_NAME)
values (2, 'ROLE_USER');
 
---
 
insert into user_role (ID, USER_ID, ROLE_ID)
values (1, 1, 1);
 
insert into user_role (ID, USER_ID, ROLE_ID)
values (2, 1, 2);
 
insert into user_role (ID, USER_ID, ROLE_ID)
values (3, 2, 2);
---
Commit;
