USE [FusionRequest]
GO
/****** Object:  StoredProcedure [dbo].[IsBackgroundJobActive]    Script Date: 27/08/2019 12:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER proc [dbo].[IsBackgroundJobActive]
	@TestId int,
	@TimeoutInSeconds int = 7,
	@CurrentDateTime datetime
as
begin

	declare @LastActiveDateTime datetime

	select @LastActiveDateTime = LastActiveDateTime
	from Tests
	where TestId = @TestId

	if ( DATEDIFF(SECOND, @currentDateTime, @LastActiveDateTime) < @TimeoutInSeconds )
	begin
		delete from FusionRequestsTests
		where 
			TestId = @TestId and
			TestStatus = 0
		select 'FALSE' as IsBackgroundJobActive
	end
	else
		select 'TRUE' as IsBackgroundJobActive


end