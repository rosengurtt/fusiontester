%dw 2.0
output application/xml skipNullOn = "everywhere"
ns ns0 http://www.w3.org/2003/05/soap-envelope
ns ns01 http://services.fusion.aero
ns ns02 http://schemas.datacontract.org/2004/07/Fusion.Integration
---
{
	BuyAllowance_Response: (payload.ns0#Envelope.ns0#Body.ns01#BuyAllowanceResponse.*ns01#BuyAllowanceResult map (i, ind) -> {
		RequestId: i.ns02#RequestId,
		ResponseId: i.ns02#ResponseId,
		DcsRequestsIds: {
			guid: i.ns02#DcsRequestsIds.*guid			
		},
		Errors: (i.ns02#Errors.*ns02#FusionError map (err, errInd) ->
		{
			FusionError: {
				Code: err.ns02#Code,
				Critical: err.ns02#Critical,
				Description: err.ns02#Description,
				Method: err.ns02#Method,
				Source: err.ns02#Source
			}
		}),
	})
}