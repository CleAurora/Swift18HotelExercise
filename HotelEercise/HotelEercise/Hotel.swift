//
//  Hotel.swift
//  HotelEercise
//
//  Created by Cleís Aurora Pereira on 09/10/20.
//

struct HotelPrice {
    let priceWeek: Double
    let priceWeekend: Double
}

struct HotelTax {
    let priceRegular: HotelPrice
    let priceVip: HotelPrice
}

struct Hotel {
    let name: String
    let taxes: HotelTax
    let classification: Int

    func price(weekDays: Int, weekendDays: Int, isVip: Bool) -> Double {
        let weekDays = Double(weekDays)
        let weekendDays = Double(weekendDays)

        if isVip {
            return taxes.priceVip.priceWeek * weekDays + taxes.priceVip.priceWeekend * weekendDays
        } else {
            return taxes.priceRegular.priceWeek * weekDays + taxes.priceRegular.priceWeekend * weekendDays
        }
    }
}
