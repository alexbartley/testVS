CREATE TABLE [dbo].[Table_1]
(
[id] [int] NOT NULL,
[asdf] [nchar] (10) NULL
)
GO
ALTER TABLE [dbo].[Table_1] ADD CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED  ([id])
GO
