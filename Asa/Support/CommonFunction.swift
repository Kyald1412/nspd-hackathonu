//
//  CommonFunction.swift
//  Asa
//
//  Copyright © 2020 Dhiky Aldwiansyah. All rights reserved.
//

import Foundation
import NotificationBannerSwift
import SwiftyUserDefaults

class CommonFunction: NSObject {
    
    static let shared = CommonFunction()
    
    func updateAppBadge(count: Int){
        UIApplication.shared.applicationIconBadgeNumber = count
    }
    
    func timeString(time: TimeInterval) -> String {
        _ = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        
        return String(format: "%02i:%02i", minutes, seconds)
    }
    
    
    func clearDataOnLogout(){        
        Defaults[\.isLoggedIn] = false
        
        KeychainWrapper.shared.setAuthToken(token: "")
        
        UIApplication.shared.applicationIconBadgeNumber = 0
    }
    
    func getYearLimit(yearLimit: Int) -> Date{
        guard let date = Calendar.current.date(byAdding: .year, value: yearLimit, to: Date()) else {
            return Date()
        }
        return date
    }
    
    func showFloatingAlert(message: String, style: BannerStyle, position: BannerPosition)  {
        let banner =  FloatingNotificationBanner(title: "",
                                                 subtitle: message, 
                                                 style: style)
        
        banner.dismissOnTap = true
        banner.duration = 2
        banner.show(queuePosition: .front, bannerPosition: position,
                    queue: .init(maxBannersOnScreenSimultaneously: 2),
                    cornerRadius: 8,
                    shadowColor: UIColor(red: 0.431, green: 0.459, blue: 0.494, alpha: 1),
                    shadowBlurRadius: 16,
                    shadowEdgeInsets: UIEdgeInsets(top: 8, left: 8, bottom: 0, right: 8))
        
    }
    
    func attributedFontString(fullString: String, selectedString: String,selectedFont: UIFont, selectedColor: UIColor) -> NSMutableAttributedString {
        
        // Set global fontsize on the string
        let attrString = NSMutableAttributedString.init(string: fullString )
        // Compute the range of the string that needs a different font
        let userNameRange: NSRange? = (fullString as NSString?)?.range(of: selectedString , options:.caseInsensitive)
        
        let aSize = selectedFont
        let aRange = userNameRange
        
        // Apply new attributes for a specific range
        attrString.setAttributes([NSAttributedString.Key.font: aSize, NSAttributedString.Key.foregroundColor: selectedColor], range: aRange!)
        
        return attrString
    }
    
}
