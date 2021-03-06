declare @mainTag nvarchar(max), 
		@airlineXpath nvarchar(max),
		@airportXpath nvarchar(max),
		@PNRXpath nvarchar(max),
		@requestTypesXpath nvarchar(max),
		@requestTypesOperation nvarchar(max),
		@requestTypeValueToMatch nvarchar(max),
		@uniqueFragmentPattern nvarchar(max),
		@requestType nvarchar(max),
		@sortOrder nvarchar(max),
		@addResponseStart nvarchar(max),
		@addResponseEnd  nvarchar(max)

declare ladata cursor for
select 
	mainTag, airlineXpath, airportXpath, PNRXpath, requestTypesXpath, requestTypesOperation,
	requestTypeValueToMatch, uniqueFragmentPattern, requestType, cast(sortOrder as nvarchar(max)), addResponseStart, addResponseEnd
from DCSemulatorConfig

open ladata
fetch next from ladata into @mainTag, @airlineXpath, @airportXpath, @PNRXpath, @requestTypesXpath, @requestTypesOperation,
	@requestTypeValueToMatch, @uniqueFragmentPattern, @requestType, @sortOrder, @addResponseStart, @addResponseEnd

while (@@FETCH_STATUS = 0)
begin
	print '
	insert into DCSemulatorConfig(mainTag, airlineXpath, airportXpath, PNRXpath, requestTypesXpath, requestTypesOperation, requestTypeValueToMatch, uniqueFragmentPattern, requestType, sortOrder, addResponseStart, addResponseEnd)
	values (''' + @mainTag + ''', ''' + @airlineXpath + ''', ''' + @airportXpath + ''', ''' + @PNRXpath + ''', ''' + @requestTypesXpath + ''', ''' + @requestTypesOperation + ''', ''' + @requestTypeValueToMatch + ''', ''' + @uniqueFragmentPattern + ''', ''' + @requestType + ''', ' + @sortOrder + ', ''' + @addResponseStart + ''', ''' + @addResponseEnd + ''')'

	fetch next from ladata into @mainTag, @airlineXpath, @airportXpath, @PNRXpath, @requestTypesXpath, @requestTypesOperation,
		@requestTypeValueToMatch, @uniqueFragmentPattern, @requestType, @sortOrder, @addResponseStart, @addResponseEnd
end

deallocate ladata
