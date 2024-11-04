alter session set "_ORACLE_SCRIPT"=true;
create user ej identified by ceu
default tablespace system
quota unlimited on system;
grant connect, create session, create table TO ej;