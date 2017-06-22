use master

if not exists (select 1 from sys.databases where name = 'PS_B2B')	
	create database PS_B2B
go

-- once per server
-------------------

--exec sp_droplogin 'ps_b2b_login'
if not exists (select 1 from sys.sql_logins where name = 'ps_b2b_login')
  exec sp_addlogin 'ps_b2b_login', 'ps_b2b_Pa$$wd!'
go

-- once per server db
----------------------
use PS_B2B
go

--exec sp_droprolemember 'ps_b2b_role', 'ps_b2b_login'
--exec sp_droprole 'ps_b2b_role'
--exec sp_revokedbaccess 'ps_b2b_login'
exec sp_grantdbaccess 'ps_b2b_login'

exec sp_addrole 'ps_b2b_role'

exec sp_addrolemember 'ps_b2b_role', 'ps_b2b_login'

grant create table, create proc, create view to ps_b2b_role