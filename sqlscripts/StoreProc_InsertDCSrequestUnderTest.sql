ALTER proc [dbo].[InsertDCSrequestUnderTest]
	@DCSrequestType nvarchar(200),
	@DcsRequestXml nvarchar(max),
	@DcsRequestIdMatched nvarchar(50) = NULL
as
begin
	insert into DCSrequestsUnderTest (DCSrequestType, DcsRequestxml, DcsRequestIdMatched, TestTime)
	values (@DCSrequestType, @DcsRequestxml, @DcsRequestIdMatched, GetDate())
end