//
//  Extensions.swift
//  MeowWoofPetDiary
//
//  Created by luane Niejelski on 9/18/22.
//

import Foundation

extension Date {
    var dayText: String {
        if Locale.current.calendar.isDateInToday(self) {
            return NSLocalizedString("Today", comment: "Today due date description")
        } else {
            return formatted(.dateTime.month().day().weekday(.wide))
        }
    }
    var dayOnly: Date {
        guard let date = Calendar.current.date(from: Calendar.current.dateComponents([.year, .month, .day], from: self)) else {
            fatalError("Failed to strip time from Date object")
        }
        return date
    }
    var shortFormat: String {
        return formatted(.dateTime.month(.abbreviated).day())
    }
    var dayAndTimeText: String {
            let timeText = formatted(date: .omitted, time: .shortened)
            if Locale.current.calendar.isDateInToday(self) {
                let timeFormat = NSLocalizedString("Today at %@", comment: "Today at time format string")
                return String(format: timeFormat, timeText)
            } else {
                let dateText = formatted(.dateTime.month(.abbreviated).day())
                let dateAndTimeFormat = NSLocalizedString("%@ at %@", comment: "Date and time format string")
                return String(format: dateAndTimeFormat, dateText, timeText)
            }
        }
}
