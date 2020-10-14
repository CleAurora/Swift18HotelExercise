//
//  BookSystem.swift
//  HotelEercise
//
//  Created by Cleís Aurora Pereira on 13/10/20.
//

import Foundation

enum CustomerType: Int {
    case regular
    case vip
}

struct BookSystem {
    let hotels: [Hotel]

    init() {
        self.hotels = [
            Hotel(
                name: "Parque das Flores",
                taxes: HotelTax(
                    priceRegular: HotelPrice(
                        priceWeek: 110,
                        priceWeekend: 90
                    ),
                    priceVip: HotelPrice(
                        priceWeek: 80,
                        priceWeekend: 80
                    )
                ),
                classification: 3
            ),
            Hotel(
                name: "Jardim Botânico",
                taxes: HotelTax(
                    priceRegular: HotelPrice(
                        priceWeek: 160,
                        priceWeekend: 60
                    ),
                    priceVip: HotelPrice(
                        priceWeek: 110,
                        priceWeekend: 50
                    )
                ),
              classification: 4
            ),
            Hotel(
                name: "Mar Atlântico",
                taxes: HotelTax(
                    priceRegular: HotelPrice(
                        priceWeek: 220,
                        priceWeekend: 250
                    ),
                    priceVip: HotelPrice(
                        priceWeek: 100,
                        priceWeekend: 40
                    )
                ),
                classification: 5
            )
        ]
    }

    func findBestHotel(checkInDate: Date, checkOutDate: Date, customerType: CustomerType) -> Hotel {
        let (workingDays, weekends) = checkInDate.daysCount(until: checkOutDate)
        let isVip = customerType == .vip

        var bestHotel = hotels[0]

        hotels.forEach { hotel in
            let currentBestPrice = bestHotel.price(weekDays: workingDays, weekendDays: weekends, isVip: isVip)
            let hotelPrice = hotel.price(weekDays: workingDays, weekendDays: weekends, isVip: isVip)
            let samePriceAndBestClassification = hotelPrice == currentBestPrice && hotel.classification > bestHotel.classification
            let lessPrice = hotelPrice < currentBestPrice

            if samePriceAndBestClassification || lessPrice {
                bestHotel = hotel
            }
        }

        return bestHotel
    }
}
