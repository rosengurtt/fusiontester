ALTER proc [dbo].[UpdateTestBatchAsFinished]
	@TestId int
as
begin
	declare @RecordsProcessed int, @NumberOfErrors int


	select @RecordsProcessed = count(*)
	from FusionRequestsTests
	where TestId = @TestId
	
	select @NumberOfErrors = count(*)
	from FusionRequestsTests
	where TestId = @TestId and TestResult <> 'OK'

	update Tests
	set 
		EndDateTime = GetDate(),
		RecordsProcessed = @RecordsProcessed,
		NumberOfErrors = @NumberOfErrors,
		TestIsRunning = 0
	where TestId = @TestId
end