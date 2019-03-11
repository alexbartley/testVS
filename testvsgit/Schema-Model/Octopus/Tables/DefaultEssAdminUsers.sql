CREATE TABLE [Octopus].[DefaultEssAdminUsers]
(
[Email] [nvarchar] (256) NOT NULL,
[PasswordHash] [nvarchar] (max) NULL,
[SecurityStamp] [nvarchar] (max) NULL,
[FirstName] [nvarchar] (256) NULL,
[LastName] [nvarchar] (256) NULL
)
GO
ALTER TABLE [Octopus].[DefaultEssAdminUsers] ADD CONSTRAINT [PK_Octopus_Users] PRIMARY KEY CLUSTERED  ([Email])
GO
