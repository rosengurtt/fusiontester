alter proc RemoveTestFromQueue
	@testId int
as
begin
	declare @rowsDeleted int

	delete from TestsQueue
	where TestId = @TestId

	select @rowsDeleted = @@ROWCOUNT

	select cast(@rowsDeleted as nvarchar(10)) + ' row(s) deleted from TestsQueue' as Result
end