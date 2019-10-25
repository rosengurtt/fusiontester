%dw 2.0
output application/xml
skipNullOn = "everywhere"
ns ns0 http://www.w3.org/2003/05/soap-envelope
ns ns01 http://services.fusion.aero
ns ns02 http://schemas.datacontract.org/2004/07/Fusion.Integration
---
{
	QuoteBag_Response: (payload.ns0#Envelope.ns0#Body.ns01#QuoteBagResponse.*ns01#QuoteBagResult map (i, ind) -> {
		RequestId: i.ns02#RequestId,
		ResponseId: i.ns02#ResponseId,
		Errors: (i.ns02#Errors.*ns02#FusionError map (err, errIndex) ->
		{
			FusionError: {
				Code: err.ns02#Code,
				Critical: err.ns02#Critical,
				Description: err.ns02#Description,
				Method: err.ns02#Method,
				Source: err.ns02#Source
			}
		}),
		Costs: (i.*ns01#Costs map (costs, costsIndex) ->  {
			ItemList: (costs.*ns02#ItemList map (itemList, itemListIndex) -> {
				ExcessBaggageCost: (itemList.*ns02#ExcessBaggageCost map (excessBaggageCost, excessBaggageCostIndex) -> {
					AdditionalAllowance: (excessBaggageCost.*ns02#AdditionalAllowance map (additionalAllowance, additionalAllowanceIndex) -> {
						Id: additionalAllowance.ns02#Id,
						BaggageAllowanceTypeId: additionalAllowance.ns02#BaggageAllowanceTypeId,
						BaggageItemTypeId: additionalAllowance.ns02#BaggageItemTypeId,
						BagDropId: additionalAllowance.ns02#BagDropId,
						FlightId: additionalAllowance.ns02#FlightId,
						PassengerId: additionalAllowance.ns02#PassengerId,
						PoolItems: additionalAllowance.ns02#PoolItems as Boolean default null,
						PoolWeight: additionalAllowance.ns02#PoolWeight as Boolean default null,
						ConsumeItemWeight: additionalAllowance.ns02#ConsumeItemWeight as Boolean default null,
						UpdateInitialAllowance: additionalAllowance.ns02#UpdateInitialAllowance as Boolean default null,
						MaxSingleItemWeight: additionalAllowance.ns02#MaxSingleItemWeight,
						InitialBags: additionalAllowance.ns02#InitialBags as Number default null,
						InitialWeight: additionalAllowance.ns02#InitialWeight as Number default null,
						PurchasedBags: additionalAllowance.ns02#PurchasedBags as Number default null,
						PurchasedWeight: additionalAllowance.ns02#PurchasedWeight,
						RemainingBags: additionalAllowance.ns02#RemainingBags,
						RemainingWeight: additionalAllowance.ns02#RemainingWeight,
						CreatedOn: additionalAllowance.ns02#CreatedOn as String default null
					}),
					Price: excessBaggageCost.ns02#Price,
					Quantity: excessBaggageCost.ns02#Quantity,
					Description: excessBaggageCost.ns02#Description
				})
			}),
			Currency: costs.ns02#Currency,
			PaymentType: costs.ns02#PaymentType,
			QuoteStatus: costs.ns02#QuoteStatus
		})
	})
}