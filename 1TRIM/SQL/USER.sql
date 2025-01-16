alter session set "_ORACLE_SCRIPT"=true;
create user T6 identified by ceu
default tablespace system
quota unlimited on system;
grant connect, create session, create table TO T6;
--eje