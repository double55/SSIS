IF OBJECT_ID('Student', 'U') IS NOT NULL
Drop table Student
Create table Student(Name varchar(100),DOB Varchar(100),Age int)
go

select * from [dbo].[Student];