IF OBJECT_ID('transactions', 'U') IS NOT NULL 
drop table transactions
create TABLE [dbo].[transactions](
	[authorized_flag] [nvarchar](255) NULL,
	[card_id] [nvarchar](255) NULL,
	[city_id] [nvarchar](255) NULL,
	[category_1] [nvarchar](255) NULL,
	[installments] [nvarchar](255) NULL,
	[category_3] [nvarchar](255) NULL,
	[category_2] [nvarchar](255) NULL,
	[merchant_category_id] [nvarchar](255) NULL,
	[merchant_id] [nvarchar](255) NULL,
	[month_lag] [nvarchar](255) NULL,
	[purchase_date] [nvarchar](255) NULL,
	[state_id] [nvarchar](255) NULL,
	[subsector_id] [nvarchar](255) NULL,
	[purchase_amount] [nvarchar](255) NULL
) ON [PRIMARY]

IF OBJECT_ID('transactions_01', 'U') IS NOT NULL 
drop table transactions_01
create TABLE [dbo].[transactions_01](
	[authorized_flag] [nvarchar](255) NULL,
	[card_id] [nvarchar](255) NULL,
	[city_id] [nvarchar](255) NULL,
	[category_1] [nvarchar](255) NULL,
	[installments] [nvarchar](255) NULL,
	[category_3] [nvarchar](255) NULL,
	[category_2] [nvarchar](255) NULL,
	[merchant_category_id] [nvarchar](255) NULL,
	[merchant_id] [nvarchar](255) NULL,
	[month_lag] [nvarchar](255) NULL,
	[purchase_date] [nvarchar](255) NULL,
	[state_id] [nvarchar](255) NULL,
	[subsector_id] [nvarchar](255) NULL,
	[purchase_amount] [nvarchar](255) NULL
) ON [PRIMARY]






select * from [dbo].[transactions];

select * from [dbo].[transactions_01];

truncate table [dbo].[transactions_01]

truncate table [dbo].[transactions]

