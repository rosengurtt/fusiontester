%dw 2.0
output application/xml skipNullOn = "everywhere"
ns ns0 http://www.w3.org/2003/05/soap-envelope
ns ns01 http://services.fusion.aero
ns ns02 http://schemas.datacontract.org/2004/07/Fusion.Integration
---
{
	BuyAllowance_Response: {
		RequestId: payload.ns0#Envelope.ns0#Body.ns01#BuyAllowanceResponse.ns01#BuyAllowanceResult.ns02#RequestId,
		ResponseId: payload.ns0#Envelope.ns0#Body.ns01#BuyAllowanceResponse.ns01#BuyAllowanceResult.ns02#ResponseId,
		Errors: (payload.ns0#Envelope.ns0#Body.ns01#BuyAllowanceResponse.ns01#BuyAllowanceResult.ns02#Errors.*ns02#FusionError map
		{
			FusionError: {
				Code: $.ns02#Code,
				Critical: $.ns02#Critical,
				Description: $.ns02#Description,
				Method: $.ns02#Method,
				Source: $.ns02#Source
			}
		}),
	}
}