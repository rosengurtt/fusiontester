ALTER proc [dbo].[GetNextTestFromQueue]
as
begin
	declare @TestId int = -1
	
-------------------------------------------------------------------------------------------------------------------
	-- Do some cleanup

	declare @RunningTestInactiveTimeoutInMinutes int = 3 -- If a running test is inactive this number of minutes, we stop it

	-- If there are more than 1 jobs running stop them all, because this is a condition that should not happen
	if ((select count(*) from Tests where TestIsRunning = 1) > 1)
		update Tests set TestIsRunning = 0
		
	-- Stop the current running test if if looks dead
	if ((select count(*) from Tests where TestIsRunning = 1) = 1)
	begin
		if ((select top 1 DateDiff(mi, LastActiveDateTime, GetDate()) from Tests where TestIsRunning = 1) > @RunningTestInactiveTimeoutInMinutes)
			update Tests set TestIsRunning = 0
	end
-------------------------------------------------------------------------------------------------------------------

	if ((select count(*) from Tests where TestIsRunning = 1) = 0)
	begin
		-- Get first item in the queue
		select 	
				top 1 @TestId = tq.TestId
		from	
				TestsQueue tq inner join
				Tests t on tq.TestId = t.TestId
		where	
				t.EndDateTime is null and
				t.TestIsRunning = 0
		order by tq.id asc
		
		if (@TestId is null or @TestId < 0)
			select 'Queue is empty' as Result
		else
		begin
			begin try
				begin transaction [tran1]
					-- Remove first from queue
					delete from TestsQueue
					where TestId = @TestId

					-- There should be no tests running but just in case ...
					update Tests
					set TestIsRunning = 0

					-- Start first from queue
					declare @sql nvarchar(max) = 'exec StartTest ' + cast(@TestId as nvarchar(50)) 
				
					exec sp_executesql @sql
				commit transaction
			end try
			begin catch
				rollback transaction [tran1]
		 end catch  
		end
	end
	else
		select 'There is another test being run at the moment' as Result
	select @TestId as TestId
end

