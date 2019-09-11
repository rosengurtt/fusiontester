create proc [dbo].[StopTest]
	@TestId int
as
begin

	if ((select count(*) from Tests where TestId=@TestId) = 0)
	begin
		select 'Test does not exist' as Result
		return
	end

	if ((select count(*) from Tests where TestId = @TestId and TestIsRunning = 1) = 0)
	begin
		select 'Test is not running' as Result
		return
	end

	begin try

		update Tests
		set TestIsRunning = 0
		where TestId = @TestId
		
		select 'Test stopped' as Result

	end try
	begin catch
		select 'An error happened, test was not stopped' as Result
		return
	end catch

end