
create proc [dbo].[GetTestResultsStatistics]
	@TestId int
as
begin

	declare 
		@NumberRecords int,
		@NumberSuccesses int,
		@NumberFailures int


	select @NumberRecords = count(*) from TestResults where TestId = @TestId

	select @NumberSuccesses = count(*) from TestResults where TestId = @TestId and TestResult = 'OK'	

	select @NumberFailures = @NumberRecords - @NumberSuccesses

	select 
			@NumberRecords as TotalRecords,
			@NumberSuccesses as SuccessfulRecords,
			@NumberFailures as FailedRecords
end