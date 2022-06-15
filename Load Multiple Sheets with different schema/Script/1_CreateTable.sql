IF OBJECT_ID('tblEmployee', 'U') IS NOT NULL 
drop table tblEmployee
CREATE TABLE [dbo].[tblEmployee](
	[Id] [int] NULL,
	[first_name] [nvarchar](255) NULL,
	[last_name] [nvarchar](255) NULL,
	[email] [nvarchar](255) NULL,
	[gender] [nvarchar](255) NULL,
	[phone_number] [nvarchar](255) NULL
) ON [PRIMARY]
GO
IF OBJECT_ID('tblCity', 'U') IS NOT NULL 
drop table tblCity
CREATE TABLE [dbo].[tblCity](
	[Id] [int] NULL,
	[City] [nvarchar](255) NULL,
	[State] [nvarchar](255) NULL,
	[Zip] [nvarchar](255) NULL,
	[Country] [nvarchar](255) NULL
) ON [PRIMARY]

IF OBJECT_ID('Customer', 'U') IS NOT NULL
Drop table Customer
CREATE TABLE Customer (
    [CustomerID] varchar(50),
    [PersonID] varchar(50),
    [StoreID] varchar(50),
    [TerritoryID] varchar(50),
    [AccountNumber] varchar(50),
    [rowguid] varchar(50),
    [ModifiedDate] varchar(50)
)

IF OBJECT_ID('EmCi', 'U') IS NOT NULL 
drop table EmCi
CREATE TABLE [dbo].[EmCi](
	[Id] [int] NULL,
	[first_name] [nvarchar](255) NULL,
	[last_name] [nvarchar](255) NULL,
	[email] [nvarchar](255) NULL,
	[gender] [nvarchar](255) NULL,
	[phone_number] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[State] [nvarchar](255) NULL,
	[Zip] [nvarchar](255) NULL,
	[Country] [nvarchar](255) NULL
) ON [PRIMARY]

IF OBJECT_ID('TableSheetMapping') IS NOT NULL
DROP TABLE TableSheetMapping 
GO

CREATE TABLE TableSheetMapping
(
    ID INT IDENTITY(1,1) PRIMARY KEY,
    DestTableName NVARCHAR(50),
    SheetName NVARCHAR(50)
)

INSERT INTO TableSheetMapping VALUES
('[dbo].[EmCi]','EmCi$'),
('[dbo].[tblEmployee]','Employee$'),
('[dbo].[tblEmployee]','Employee_01$'),
('[dbo].[tblCity]','City$')

select DestTableName from [dbo].[TableSheetMapping] where SheetName = 'Employee$';


select * from [dbo].[EmCi];

select * from [dbo].[tblCity];

select * from [dbo].[tblEmployee];

truncate table [dbo].[EmCi];
truncate table [dbo].[tblCity];
truncate table [dbo].[tblEmployee];

			   