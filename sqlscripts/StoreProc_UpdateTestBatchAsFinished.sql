ALTER proc [dbo].[UpdateTestBatchAsFinished]
	@TestId int
as
begin
	update Tests
	set EndDateTime = GetDate()
	where TestId = @TestId
end