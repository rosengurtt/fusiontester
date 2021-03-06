alter procedure [dbo].[GetDCSResponseXmlForRequestUnderTest]
	@Airline nvarchar(200) = '%',
	@Airport nvarchar(200) = '%',
	@PNR nvarchar(10) = '%',
	@UniqueFragment nvarchar(1000) = '%',
	@RequestType nvarchar(200)
as
begin

	SET NOCOUNT ON

	declare @requestNumber int
	-- The same DCS request can be done several times for the same Fusion request, and we have to return each time the appropriate response
	-- So we save the history of requests done and we use it to return the appropiate response

	select @requestNumber = count(*) 
	from DCSrequestsUnderTest ut inner join DcsRequests dr on dr.DcsRequestId=ut.DcsRequestIdMatched
	where 
			Airline LIKE @Airline AND
			Airport LIKE @Airport AND
			PNR LIKE @PNR AND
			DCSRequestType LIKE @RequestType AND
			replace(replace(replace(replace(replace(replace(replace(
			replace(replace(replace(replace(replace(replace(replace(
			replace(replace(replace(replace(replace(replace(replace(
			replace(replace(replace(replace(replace(replace(replace(
			replace(replace(replace(replace(replace(replace(replace(
			replace(replace(replace(
			cast(dr.DcsRequestXml AS varchar(max))
			,char(9), ''), char(10), ''), char(11), ''), char(12), ''), char(13), ''), char(32), ''), char(33), '')
			,char(34), ''), char(35), ''), char(36), ''), char(37), ''), char(38), ''), char(39), ''), char(40), '')
			,char(41), ''), char(42), ''), char(43), ''), char(44), ''), char(45), ''), char(46), ''), char(47), '')
			,char(58), ''), char(59), ''), char(60), ''), char(61), ''), char(62), ''), char(63), ''), char(64), '')
			,char(91), ''), char(92), ''), char(93), ''), char(94), ''), char(95), ''), char(96), ''), char(123), '')
			,char(124), ''), char(125), ''), char(126), '')
			like @UniqueFragment


	select DcsResponseXml, DCSname, DCSversion, Airline, RequestType, DcsRequestXml, DcsRequestId
	from DcsRequests dr inner join TestResults tr on dr.FusionRequestId=tr.FusionRequestId
	where 
			Airline LIKE @Airline AND
			Airport LIKE @Airport AND
			PNR LIKE @PNR AND
			RequestType LIKE @RequestType AND
			replace(replace(replace(replace(replace(replace(replace(
			replace(replace(replace(replace(replace(replace(replace(
			replace(replace(replace(replace(replace(replace(replace(
			replace(replace(replace(replace(replace(replace(replace(
			replace(replace(replace(replace(replace(replace(replace(
			replace(replace(replace(
			cast(DcsRequestXml AS varchar(max))
			,char(9), ''), char(10), ''), char(11), ''), char(12), ''), char(13), ''), char(32), ''), char(33), '')
			,char(34), ''), char(35), ''), char(36), ''), char(37), ''), char(38), ''), char(39), ''), char(40), '')
			,char(41), ''), char(42), ''), char(43), ''), char(44), ''), char(45), ''), char(46), ''), char(47), '')
			,char(58), ''), char(59), ''), char(60), ''), char(61), ''), char(62), ''), char(63), ''), char(64), '')
			,char(91), ''), char(92), ''), char(93), ''), char(94), ''), char(95), ''), char(96), ''), char(123), '')
			,char(124), ''), char(125), ''), char(126), '')
			like @UniqueFragment

			and

			tr.TestStatus=0
	order by dr.RequestTime
	offset @requestNumber rows
	fetch next 1 rows ONLY

end
