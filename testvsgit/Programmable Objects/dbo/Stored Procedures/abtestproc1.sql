IF OBJECT_ID('[dbo].[abtestproc1]') IS NOT NULL
	DROP PROCEDURE [dbo].[abtestproc1];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[abtestproc1]
AS
BEGIN
  SELECT 1;
END;
GO
