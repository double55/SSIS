
IF OBJECT_ID('Excel255', 'U') IS NOT NULL 
drop table Excel255
create TABLE [dbo].[Excel255](
	[Id] [int] NULL,
	[City] [nvarchar](255) NULL,
	[State] [nvarchar](255) NULL,
	[Zip] [nvarchar](255) NULL,
	[Country] [text] NULL
) ON [PRIMARY]

IF OBJECT_ID('Excel255_01', 'U') IS NOT NULL 
drop table Excel255_01
create TABLE [dbo].[Excel255_01](
	[Id] [int] NULL,
	[City] [nvarchar](255) NULL,
	[State] [nvarchar](255) NULL,
	[Zip] [nvarchar](255) NULL,
	[Country] ntext NULL
) ON [PRIMARY]

select * from [dbo].[Excel255];

select * from [dbo].[Excel255_01];
