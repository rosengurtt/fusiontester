ALTER proc [dbo].[RemoveTestRecord]
	@TestId int
as
begin
	delete from FusionRequestsTests
	where 
		TestId = @Testid and 
		TestStatus = 0
end