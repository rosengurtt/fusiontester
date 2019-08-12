%dw 2.0
output application/xml
skipNullOn = "everywhere"
ns ns0 http://www.w3.org/2003/05/soap-envelope
ns ns01 http://services.fusion.aero
ns ns02 http://schemas.datacontract.org/2004/07/Fusion.Integration
---
{
	QuoteBag_Response: {
		RequestId: payload.ns0#Envelope.ns0#Body.ns01#QuoteBagResponse.ns01#QuoteBagResult.ns02#RequestId,
		ResponseId: payload.ns0#Envelope.ns0#Body.ns01#QuoteBagResponse.ns01#QuoteBagResult.ns02#ResponseId,
		Errors: (payload.ns0#Envelope.ns0#Body.ns01#QuoteBagResponse.ns01#QuoteBagResult.ns02#Errors.*ns02#FusionError map
		{
			FusionError: {
				Code: $.ns02#Code,
				Critical: $.ns02#Critical,
				Description: $.ns02#Description,
				Method: $.ns02#Method,
				Source: $.ns02#Source
			}
		}),
		Costs: {
			ItemList: {
				ExcessBaggageCost: {
					AdditionalAllowance: {
						Id: payload.ns0#Envelope.ns0#Body.ns01#QuoteBagResponse.ns01#QuoteBagResult.ns01#Costs.ns02#ItemList.ns02#ExcessBaggageCost.ns02#AdditionalAllowance.ns02#Id,
						BaggageAllowanceTypeId: payload.ns0#Envelope.ns0#Body.ns01#QuoteBagResponse.ns01#QuoteBagResult.ns01#Costs.ns02#ItemList.ns02#ExcessBaggageCost.ns02#AdditionalAllowance.ns02#BaggageAllowanceTypeId,
						BaggageItemTypeId: payload.ns0#Envelope.ns0#Body.ns01#QuoteBagResponse.ns01#QuoteBagResult.ns01#Costs.ns02#ItemList.ns02#ExcessBaggageCost.ns02#AdditionalAllowance.ns02#BaggageItemTypeId,
						BagDropId: payload.ns0#Envelope.ns0#Body.ns01#QuoteBagResponse.ns01#QuoteBagResult.ns01#Costs.ns02#ItemList.ns02#ExcessBaggageCost.ns02#AdditionalAllowance.ns02#BagDropId,
						FlightId: payload.ns0#Envelope.ns0#Body.ns01#QuoteBagResponse.ns01#QuoteBagResult.ns01#Costs.ns02#ItemList.ns02#ExcessBaggageCost.ns02#AdditionalAllowance.ns02#FlightId,
						PassengerId: payload.ns0#Envelope.ns0#Body.ns01#QuoteBagResponse.ns01#QuoteBagResult.ns01#Costs.ns02#ItemList.ns02#ExcessBaggageCost.ns02#AdditionalAllowance.ns02#PassengerId,
						PoolItems: payload.ns0#Envelope.ns0#Body.ns01#QuoteBagResponse.ns01#QuoteBagResult.ns01#Costs.ns02#ItemList.ns02#ExcessBaggageCost.ns02#AdditionalAllowance.ns02#PoolItems as Boolean default null,
						PoolWeight: payload.ns0#Envelope.ns0#Body.ns01#QuoteBagResponse.ns01#QuoteBagResult.ns01#Costs.ns02#ItemList.ns02#ExcessBaggageCost.ns02#AdditionalAllowance.ns02#PoolWeight as Boolean default null,
						ConsumeItemWeight: payload.ns0#Envelope.ns0#Body.ns01#QuoteBagResponse.ns01#QuoteBagResult.ns01#Costs.ns02#ItemList.ns02#ExcessBaggageCost.ns02#AdditionalAllowance.ns02#ConsumeItemWeight as Boolean default null,
						UpdateInitialAllowance: payload.ns0#Envelope.ns0#Body.ns01#QuoteBagResponse.ns01#QuoteBagResult.ns01#Costs.ns02#ItemList.ns02#ExcessBaggageCost.ns02#AdditionalAllowance.ns02#UpdateInitialAllowance as Boolean default null,
						MaxSingleItemWeight: payload.ns0#Envelope.ns0#Body.ns01#QuoteBagResponse.ns01#QuoteBagResult.ns01#Costs.ns02#ItemList.ns02#ExcessBaggageCost.ns02#AdditionalAllowance.ns02#MaxSingleItemWeight,
						InitialBags: payload.ns0#Envelope.ns0#Body.ns01#QuoteBagResponse.ns01#QuoteBagResult.ns01#Costs.ns02#ItemList.ns02#ExcessBaggageCost.ns02#AdditionalAllowance.ns02#InitialBags as Number default null,
						InitialWeight: payload.ns0#Envelope.ns0#Body.ns01#QuoteBagResponse.ns01#QuoteBagResult.ns01#Costs.ns02#ItemList.ns02#ExcessBaggageCost.ns02#AdditionalAllowance.ns02#InitialWeight as Number default null,
						PurchasedBags: payload.ns0#Envelope.ns0#Body.ns01#QuoteBagResponse.ns01#QuoteBagResult.ns01#Costs.ns02#ItemList.ns02#ExcessBaggageCost.ns02#AdditionalAllowance.ns02#PurchasedBags as Number default null,
						PurchasedWeight: payload.ns0#Envelope.ns0#Body.ns01#QuoteBagResponse.ns01#QuoteBagResult.ns01#Costs.ns02#ItemList.ns02#ExcessBaggageCost.ns02#AdditionalAllowance.ns02#PurchasedWeight,
						RemainingBags: payload.ns0#Envelope.ns0#Body.ns01#QuoteBagResponse.ns01#QuoteBagResult.ns01#Costs.ns02#ItemList.ns02#ExcessBaggageCost.ns02#AdditionalAllowance.ns02#RemainingBags,
						RemainingWeight: payload.ns0#Envelope.ns0#Body.ns01#QuoteBagResponse.ns01#QuoteBagResult.ns01#Costs.ns02#ItemList.ns02#ExcessBaggageCost.ns02#AdditionalAllowance.ns02#RemainingWeight,
						CreatedOn: payload.ns0#Envelope.ns0#Body.ns01#QuoteBagResponse.ns01#QuoteBagResult.ns01#Costs.ns02#ItemList.ns02#ExcessBaggageCost.ns02#AdditionalAllowance.ns02#CreatedOn as String default null
					},
					Price: payload.ns0#Envelope.ns0#Body.ns01#QuoteBagResponse.ns01#QuoteBagResult.ns01#Costs.ns02#ItemList.ns02#ExcessBaggageCost.ns02#Price,
					Quantity: payload.ns0#Envelope.ns0#Body.ns01#QuoteBagResponse.ns01#QuoteBagResult.ns01#Costs.ns02#ItemList.ns02#ExcessBaggageCost.ns02#Quantity,
					Description: payload.ns0#Envelope.ns0#Body.ns01#QuoteBagResponse.ns01#QuoteBagResult.ns01#Costs.ns02#ItemList.ns02#ExcessBaggageCost.ns02#Description
				}
			},
			Currency: payload.ns0#Envelope.ns0#Body.ns01#QuoteBagResponse.ns01#QuoteBagResult.ns01#Costs.ns02#Currency,
			PaymentType: payload.ns0#Envelope.ns0#Body.ns01#QuoteBagResponse.ns01#QuoteBagResult.ns01#Costs.ns02#PaymentType,
			QuoteStatus: payload.ns0#Envelope.ns0#Body.ns01#QuoteBagResponse.ns01#QuoteBagResult.ns01#Costs.ns02#QuoteStatus
		}
	}
}