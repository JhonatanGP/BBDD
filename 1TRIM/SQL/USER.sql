alter session set "_ORACLE_SCRIPT"=true;
create user casa identified by ceu
default tablespace system
quota unlimited on system;
grant connect, create session, create table TO casa;
grant create procedure to casa;

--eje
--entregas
--T4
--T6
--EXAMEN
--PROG
--casa