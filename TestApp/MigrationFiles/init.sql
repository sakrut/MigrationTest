use master

if not exists (select 1 from sys.databases where name = 'sakrut_test')	
	create database sakrut_test
go

-- once per server
-------------------

--exec sp_droplogin 'sakrut_test_login'
if not exists (select 1 from sys.sql_logins where name = 'sakrut_test_login')
  exec sp_addlogin 'sakrut_test_login', 'sakrut_test_Pa$$wd!'
go

-- once per server db
----------------------
use sakrut_test
go

--exec sp_droprolemember 'sakrut_test_role', 'sakrut_test_login'
--exec sp_droprole 'sakrut_test_role'
--exec sp_revokedbaccess 'sakrut_test_login'
exec sp_grantdbaccess 'sakrut_test_login'

exec sp_addrole 'sakrut_test_role'

exec sp_addrolemember 'sakrut_test_role', 'sakrut_test_login'

grant create table, create proc, create view to sakrut_test_role