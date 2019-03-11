-- <Migration ID="3085de48-5c24-41ee-bf5b-46a70d375ba8" />
GO

PRINT N'Creating schemas'
GO
CREATE SCHEMA [Octopus]
AUTHORIZATION [dbo]
GO
CREATE SCHEMA [RedGateLocal]
AUTHORIZATION [dbo]
GO
PRINT N'Creating [Octopus].[DefaultEssAdminUsers]'
GO
CREATE TABLE [Octopus].[DefaultEssAdminUsers]
(
[Email] [nvarchar] (256) NOT NULL,
[PasswordHash] [nvarchar] (max) NULL,
[SecurityStamp] [nvarchar] (max) NULL,
[FirstName] [nvarchar] (256) NULL,
[LastName] [nvarchar] (256) NULL
)
GO
PRINT N'Creating primary key [PK_Octopus_Users] on [Octopus].[DefaultEssAdminUsers]'
GO
ALTER TABLE [Octopus].[DefaultEssAdminUsers] ADD CONSTRAINT [PK_Octopus_Users] PRIMARY KEY CLUSTERED  ([Email])
GO
PRINT N'Creating [RedGateLocal].[DeploymentMetadata]'
GO
CREATE TABLE [RedGateLocal].[DeploymentMetadata]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[Name] [nvarchar] (max) NOT NULL,
[Type] [varchar] (50) NOT NULL,
[Action] [varchar] (50) NOT NULL,
[By] [nvarchar] (128) NOT NULL CONSTRAINT [DF__DeploymentMe__By__5FB337D6] DEFAULT (original_login()),
[As] [nvarchar] (128) NOT NULL CONSTRAINT [DF__DeploymentMe__As__60A75C0F] DEFAULT (suser_sname()),
[CompletedDate] [datetime] NOT NULL CONSTRAINT [DF__Deploymen__Compl__619B8048] DEFAULT (getdate()),
[With] [nvarchar] (128) NOT NULL CONSTRAINT [DF__Deployment__With__628FA481] DEFAULT (app_name()),
[BlockId] [varchar] (50) NOT NULL,
[InsertedSerial] [binary] (8) NOT NULL CONSTRAINT [DF__Deploymen__Inser__6383C8BA] DEFAULT (@@dbts+(1)),
[UpdatedSerial] [timestamp] NOT NULL,
[MetadataVersion] [varchar] (50) NOT NULL,
[Hash] [nvarchar] (max) NULL
)
GO
PRINT N'Creating primary key [PK__Deployme__3214EC0710F559F9] on [RedGateLocal].[DeploymentMetadata]'
GO
ALTER TABLE [RedGateLocal].[DeploymentMetadata] ADD CONSTRAINT [PK__Deployme__3214EC0710F559F9] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Creating [dbo].[Table_1]'
GO
CREATE TABLE [dbo].[Table_1]
(
[id] [int] NOT NULL,
[asdf] [nchar] (10) NULL
)
GO
PRINT N'Creating primary key [PK_Table_1] on [dbo].[Table_1]'
GO
ALTER TABLE [dbo].[Table_1] ADD CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED  ([id])
GO
PRINT N'Creating [dbo].[Table_2]'
GO
CREATE TABLE [dbo].[Table_2]
(
[id] [int] NOT NULL,
[asdfg] [nchar] (10) NULL
)
GO
PRINT N'Creating primary key [PK_Table_2] on [dbo].[Table_2]'
GO
ALTER TABLE [dbo].[Table_2] ADD CONSTRAINT [PK_Table_2] PRIMARY KEY CLUSTERED  ([id])
GO
PRINT N'Creating extended properties'
GO
EXEC sp_addextendedproperty N'MS_Description', N'This table records deployments with migration scripts. Learn more: http://rd.gt/230GBP3', 'SCHEMA', N'RedGateLocal', 'TABLE', N'DeploymentMetadata', NULL, NULL
GO
