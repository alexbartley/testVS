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
ALTER TABLE [RedGateLocal].[DeploymentMetadata] ADD CONSTRAINT [PK__Deployme__3214EC0710F559F9] PRIMARY KEY CLUSTERED  ([Id])
GO
EXEC sp_addextendedproperty N'MS_Description', N'This table records deployments with migration scripts. Learn more: http://rd.gt/230GBP3', 'SCHEMA', N'RedGateLocal', 'TABLE', N'DeploymentMetadata', NULL, NULL
GO
