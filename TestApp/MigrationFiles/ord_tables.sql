

--------------------------------------------------------------------------------
------------- Typy zamówienia
--------------------------------------------------------------------------------
if exists(select 1 from sysobjects where xtype='U' and name='sakrut_test_ord_orderType')
	drop table sakrut_test_ord_orderType
go
create table sakrut_test_ord_orderType
(
	id int identity constraint sakrut_test_ord_orderType_index1 primary key,
	name nvarchar(255),	
	isActive bit not null
)
go
--grant select,insert,update,delete on sakrut_test_ord_orderType to sakrut_test_role
go

--------------------------------------------------------------------------------
------------- Status zamowienia
--------------------------------------------------------------------------------
if exists(select 1 from sysobjects where xtype='U' and name='sakrut_test_ord_orderStatus')
	drop table sakrut_test_ord_orderStatus
go
create table sakrut_test_ord_orderStatus
(
	id int constraint sakrut_test_ord_orderStatus_index1 primary key,
	name nvarchar(255),	
	isActive bit not null
)
go
--grant select,insert,update,delete on sakrut_test_ord_orderStatus to sakrut_test_role
go


--------------------------------------------------------------------------------
------------- Order zamówienie
--------------------------------------------------------------------------------
if exists(select 1 from sysobjects where xtype='U' and name='sakrut_test_ord_order')
	drop table sakrut_test_ord_order
go
CREATE TABLE [dbo].[sakrut_test_ord_order](
	[id] [int] identity constraint sakrut_test_ord_order_index1 primary key,
	[offerId] [int] NOT NULL,
	[statusId] [int]  NOT NULL,
	[typeId] [int]  NOT NULL,
	[orderNo] [nvarchar](50) NOT NULL,
	[submitter] [nvarchar](100) NOT NULL,
	[description] nvarchar(max),
	createDate datetime,
	createUserId int,
	modifyDate datetime,
	modifyUserId int	
 )

GO
go
--grant select,insert,update,delete on sakrut_test_ord_order to sakrut_test_role
go

--------------------------------------------------------------------------------
------------- Order Załaczniki oferty
--------------------------------------------------------------------------------
if exists(select 1 from sysobjects where xtype='U' and name='sakrut_test_ord_orderAttachment')
	drop table sakrut_test_ord_orderAttachment
go
CREATE TABLE [dbo].[sakrut_test_ord_orderAttachment](
	[id] [int] identity constraint sakrut_test_ord_orderAttachment_index1 primary key,
	[orderId] [int] NOT NULL,
	fileName nvarchar(255),
	fileType nvarchar(100),
	fileSize int,
	[description] [nvarchar](max) NULL,
	
 )

GO
go
--grant select,insert,update,delete on sakrut_test_ord_orderAttachment to sakrut_test_role
go



--------------------------------------------------------------------------------
------------- Order Załaczniki oferty
--------------------------------------------------------------------------------
if exists(select 1 from sysobjects where xtype='U' and name='sakrut_test_ord_orderAttachmentContent')
	drop table sakrut_test_ord_orderAttachmentContent
go
CREATE TABLE [dbo].[sakrut_test_ord_orderAttachmentContent](
	[OrderAttachmentId] [int] Primary key,
	[Content] [varbinary](max) NOT NULL,
 )

GO
go
--grant select,insert,update,delete on sakrut_test_ord_orderAttachmentContent to sakrut_test_role
go
