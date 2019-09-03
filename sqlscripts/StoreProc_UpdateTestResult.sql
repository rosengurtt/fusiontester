ALTER procedure [dbo].[UpdateTestResult]
	@TestId integer,
	@FusionRequestId varchar(50),
	@TestResult nvarchar(max),
	@ExpectedResponse nvarchar(max)='',
	@ActualResponse nvarchar(max)='',
	@ActualDCScalls nvarchar(max)='',
	@NumberOfDifferences integer,
	@DCScallsMatch bit

as
begin
	declare @sql nvarchar(max)

	update FusionRequestsTests
	set 
		TestResult = replace(@TestResult, '''', ''''''),
		TestStatus = 1,
		ExpectedResponse = replace(@ExpectedResponse, '''', ''''''),
		ActualResponse = replace(@ActualResponse, '''', ''''''),
		ActualDCScalls = replace(@ActualDCScalls, '''', ''''''),
		NumberOfDifferences = @NumberOfDifferences,
		DCScallsMatch = @DCScallsMatch
	where 
		FusionRequestId = @FusionRequestId	and
		TestId = @TestId

	update 
		Tests
	set
		LastActiveDateTime = GetDate()
	where
		TestId = @TestId


end
