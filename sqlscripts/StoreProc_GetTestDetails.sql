ALTER proc [dbo].[GetTestDetails]
	@TestId integer
as

select  
		TestId,
		TestName,
		TestDescription,
		CreationDateTime,
		StartDateTime,
		LastActiveDateTime,
		EndDateTime,
		RecordsProcessed,
		NumberOfErrors,
		TestCreator,
		IncludeAirports,
		IncludeAirlines,
		FromDate,
		ToDate,
		IncludeFusionRequestTypes
from	
		Tests
where	
		TestId = @TestId

