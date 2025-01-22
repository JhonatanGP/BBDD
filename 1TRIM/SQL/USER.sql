alter session set "_ORACLE_SCRIPT"=true;
create user entregas identified by ceu
default tablespace system
quota unlimited on system;
grant connect, create session, create table TO entregas;
--eje
--entregas