USE [DBA_Support]
GO

/****** Object:  Table [Maintenance].[NetworkCertificateCheck]    Script Date: 8/13/2023 11:09:25 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Maintenance].[NetworkCertificateCheck](
	[ComputerName] [nvarchar](max) NULL,
	[DnsNameList] [nvarchar](max) NULL,
	[Expires] [datetime] NULL,
	[FriendlyName] [nvarchar](max) NULL,
	[Generated] [datetime] NULL,
	[InstanceName] [nvarchar](max) NULL,
	[IssuedBy] [nvarchar](max) NULL,
	[IssuedTo] [nvarchar](max) NULL,
	[ServiceAccount] [nvarchar](max) NULL,
	[SqlInstance] [nvarchar](max) NULL,
	[Thumbprint] [nvarchar](max) NULL,
	[Certificate] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
