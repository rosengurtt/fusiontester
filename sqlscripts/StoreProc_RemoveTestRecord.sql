ALTER proc [dbo].[RemoveTestRecord]
	@TestId int
as
begin
	delete from TestResults
	where 
		TestId = @Testid and 
		TestStatus = 0

	delete from DCSrequestsUnderTest
end