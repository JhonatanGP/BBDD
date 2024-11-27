alter session set "_ORACLE_SCRIPT"=true;
create user eje identified by ceu
default tablespace system
quota unlimited on system;
grant connect, create session, create table TO eje;