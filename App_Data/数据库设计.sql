CREATE TABLE [dbo].[teacher](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tid] [nchar](7) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[name] [nvarchar](5) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[job] [nvarchar](10) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[location] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[college] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[email] [nvarchar](15) COLLATE Chinese_PRC_CI_AS NOT NULL,
 CONSTRAINT [PK_teacher] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_teacher] UNIQUE NONCLUSTERED 
(
	[tid] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]