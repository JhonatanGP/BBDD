alter session set "_ORACLE_SCRIPT"=true;
create user PROG identified by ceu
default tablespace system
quota unlimited on system;
grant connect, create session, create table TO PROG;
grant create procedure to T6;

--eje
--entregas
--T4
--T6
--EXAMEN
--PROG