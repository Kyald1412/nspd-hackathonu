//
//  Extension+Int.swift
//  Asa
//
//  Created by Dhiky Aldwiansyah on 09/08/20.
//  Copyright © 2020 Dhiky Aldwiansyah. All rights reserved.
//

import Foundation

extension Int {
    func currency() -> String {
        let price = NSNumber(value: Int32(self))
        let formatter = NumberFormatter()

        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "ja_JP")
        formatter.usesGroupingSeparator = true
        formatter.allowsFloats = true
        formatter.maximumFractionDigits = 2
        
        guard let formattedPrice = formatter.string(from: price) else {
            return "\(self)"
        }

        print(formattedPrice)

        return formattedPrice
        
    }
    
}
