//
//  Extension+Date.swift
//  Asa
//
//  Created by Dhiky Aldwiansyah on 09/08/20.
//  Copyright © 2020 Dhiky Aldwiansyah. All rights reserved.
//

import Foundation
import LanguageManager_iOS

extension String {
    func toDate(withFormat format: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.dateFormat = format
        guard let date = dateFormatter.date(from: self) else { return Date() }
        return date
    }
    
    func toString(withFormat format: String, toFormat: String, timeZone: String) -> String {
        
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.timeZone = TimeZone.init(abbreviation: "UTC")
        
        var localTime = ""
        
        if let date = formatter.date(from: self) {
            formatter.timeZone = TimeZone(identifier: timeZone)
            if LanguageManager.shared.currentLanguage == .ja {
                formatter.dateFormat = KEnum.TimeFormatJp(format: toFormat)
            } else {
                formatter.dateFormat = toFormat
            }            
            localTime = formatter.string(from: date)
        }
        
        return localTime
    }
    
    func toString(withMinutes format: String, toFormat: String, minutes: Int, timeZone: String) -> String {
        var localTime = ""
        
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.timeZone = TimeZone.init(abbreviation: "UTC")
        
        if var date = formatter.date(from: self) {
            formatter.timeZone = TimeZone(identifier: timeZone)
            if LanguageManager.shared.currentLanguage == .ja {
                formatter.dateFormat = KEnum.TimeFormatJp(format: toFormat)
            } else {
                formatter.dateFormat = toFormat
            }
            date.addTimeInterval(TimeInterval(minutes * 60))
            localTime = formatter.string(from: date)
        }
        
        return localTime
    }
}

extension Date {
    func toString(toFormat: String) -> String? {
        let dateFormatterOutput = DateFormatter()
        dateFormatterOutput.calendar = Calendar(identifier: .gregorian)
        dateFormatterOutput.dateFormat = toFormat
        return dateFormatterOutput.string(from: self)
    }
}

import Foundation

extension Date {
    func totalDistance(from date: Date, resultIn component: Calendar.Component) -> Int? {
        return Calendar.current.dateComponents([component], from: self, to: date).value(for: component)
    }
    
    func compare(with date: Date, only component: Calendar.Component) -> Int {
        let days1 = Calendar.current.component(component, from: self)
        let days2 = Calendar.current.component(component, from: date)
        return days1 - days2
    }
}
