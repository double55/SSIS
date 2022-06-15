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
GO
IF OBJECT_ID('Number', 'U') IS NOT NULL
Drop table Number
CREATE TABLE Number (
    [CustomerID] varchar(50),
    [PersonID] varchar(50),
    [StoreID] varchar(50),
    [TerritoryID] varchar(50),
    [rowguid] varchar(50),
    [ModifiedDate] varchar(50)
)
GO
IF OBJECT_ID('Date', 'U') IS NOT NULL
Drop table Date
CREATE TABLE Date (
    [CustomerID] varchar(50),
    [PersonID] varchar(50),
    [StoreID] varchar(50),
    [TerritoryID] varchar(50),
    [AccountNumber] varchar(50),
    [rowguid] varchar(50),
)
GO

CREATE TABLE TableSheetMapping
(
    DirName NVARCHAR(50)
)

INSERT INTO TableSheetMapping VALUES
('A'),
('B'),
('C');
select DirName From [dbo].[TableSheetMapping];
TRuncate table [dbo].[Date];
TRuncate table [dbo].[Customer];
TRuncate table [dbo].[Number];

select * from [dbo].[Customer];

select * from [dbo].[Date];

select * from [dbo].[Number];