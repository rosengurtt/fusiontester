ALTER procedure [dbo].[UpdateTestResult]
	@TestId integer,
	@FusionRequestId varchar(50),
	@TestResult nvarchar(max),
	@ExpectedResponse nvarchar(max)='',
	@ActualResponse nvarchar(max)='',
	@ActualDCScalls nvarchar(max)='',
	@ExpectedDCScalls nvarchar(max)='',
	@NumberOfDifferences integer,
	@DCScallsMatch bit

as
begin
	declare @recordsProcessed int, @numberOfErrors int
	update TestResults
	set 
		TestResult = replace(@TestResult, '''', ''''''),
		TestStatus = 1,
		ExpectedResponse = replace(@ExpectedResponse, '''', ''''''),
		ActualResponse = replace(@ActualResponse, '''', ''''''),
		ActualDCScalls = replace(@ActualDCScalls, '''', ''''''),
		ExpectedDCScalls = replace(@ExpectedDCScalls, '''', ''''''),
		NumberOfDifferences = @NumberOfDifferences,
		DCScallsMatch = @DCScallsMatch
	where 
		FusionRequestId = @FusionRequestId	and
		TestId = @TestId

	select @recordsProcessed = count(*)
	from TestResults
	where TestId = @TestId

	select @numberOfErrors = count(*)
	from TestResults
	where 
		TestId = @TestId and
		TestResult <> 'OK'

	update 
		Tests
	set
		LastActiveDateTime = GetDate(),
		RecordsProcessed = @recordsProcessed,
		numberOfErrors = @numberOfErrors
	where
		TestId = @TestId


end
