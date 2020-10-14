//
//  Calendar+Date.swift
//  HotelEercise
//
//  Created by Cleís Aurora Pereira on 13/10/20.
//

import Foundation

extension Date {
    func nextDay(in calendar: Calendar) -> Date? {
        return calendar.date(byAdding: .day, value: 1, to: self)
    }

    func daysCount(until endDate: Date) -> (workingDays: Int, weekends: Int) {
        let calendar = Calendar.current

        var weekends = 0
        var workingDays = 0
        var date = self

        while date <= endDate {
            if calendar.isDateInWeekend(date) {
                weekends += 1
            } else {
                workingDays += 1
            }

            guard let nextDay = date.nextDay(in: calendar) else {
                fatalError("Failed to instantiate a next day")
            }

            date = nextDay
        }

        return (workingDays, weekends)
    }
}
