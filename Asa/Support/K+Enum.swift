//
//  K+Enum.swift
//  Asa
//
//  Created by Dhiky Aldwiansyah on 09/08/20.
//  Copyright © 2020 Dhiky Aldwiansyah. All rights reserved.
//

import Foundation
import UIKit

public struct KEnum {
    
    public enum PaymentRegion: String {
        case stripe = "default" //default country
        case midtrans = "62" //indonesia
    }
    
    enum HomeCoordinatorFlow: String {
        case home = "home"
        case explore = "explore"
        case orderlist = "orderlist"
        case profile = "profile"
    }
    
    enum Gender: String {
        case male = "male"
        case female = "female"
    }
    
    public enum TimeFormat: String {
        case datetimezone = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        case date = "yyyy-MM-dd"
        case dayMonthTime = "EEEE, dd MMM HH:mm"
        case prettyDate = "EEEE, dd MMM yyyy HH:mm"
        case dateTime = "yyyy-MM-dd HH:mm:ss"
        case dayMonthYear = "dd MMMM yyyy"
        case dayMonthYearTime = "dd MMMM yyyy HH:mm"
        case hourMinuteSecond = "HH:mm:ss"
        case hourMinute = "HH:mm"
        case yearOnly = "YYYY"
        case monthOnly = "MM"
        case coredata = "dd/MM/yyyy"
    }

    enum TimeZone: String {
        case japan = "Asia/Tokyo"
        case indonesia = "Asia/Jakarta"
        case utc = "UTC"
    }
    
    enum FetchableDays: Int {
        case one = 1
        case seven = 7
    }

    enum FetchStatus {
        case none
        case didFetch
        case willFetch
        case fetching
    }
    
//    static func getGenderLocalization(gender: String) -> String {
//        switch (gender) {
//        case Gender.male.rawValue:
//            return L10n.man
//        case Gender.female.rawValue:
//            return L10n.women
//        default:
//            return gender
//        }
//    }
//    
//    static func setGenderLocalization(gender: String) -> String {
//        switch (gender) {
//        case L10n.man:
//            return Gender.male.rawValue
//        case L10n.women:
//            return Gender.female.rawValue
//        default:
//            return gender
//        }
//    }
        
    public static func TimeFormatJp(format :String) -> String {
        switch format {
        case TimeFormat.datetimezone.rawValue:
            return TimeFormat.datetimezone.rawValue
        case TimeFormat.date.rawValue :
            return "yyyy年MM月dd日"
        case TimeFormat.dayMonthTime.rawValue:
            return "yyyy年MM月dd日 HH:mm"
        case TimeFormat.prettyDate.rawValue :
            return "yyyy年MM月dd日 HH:mm"
        case TimeFormat.dateTime.rawValue :
            return "yyyy年MM月dd日 HH:mm"
        case TimeFormat.hourMinuteSecond.rawValue :
            return "HH:mm:ss"
        case TimeFormat.hourMinute.rawValue:
            return "HH:mm"
        case "yyyy年MM月dd日":
            return TimeFormat.date.rawValue
        default:
            return format
        }
    }
    
//    static func OrderStatus(status: Int) -> String {
//        switch status {
//        case 1:
//            return L10n.requestOrder
//        case 2:
//            return L10n.productReady
//        case 3:
//            return L10n.alreadyPickup
//        case 10:
//            return L10n.cancel
//        default:
//            return ""
//        }
//    }
//
//    static func OrderType(status: Int) -> String {
//        switch status {
//        case 1:
//            return L10n.stayInShop
//        case 2:
//            return L10n.takeOut
//        case 3:
//            return L10n.stayInShopTakeOut
//        case 10:
//            return L10n.cancel
//        default:
//            return ""
//        }
//    }
//
//    static func TransactionStatus(status: Int) -> String {
//        switch status {
//        case 1:
//            return L10n.orderRequest
//        case 2:
//            return "Topup by App"
//        case 3:
//            return "Topup by Admin"
//        case 4:
//            return L10n.cancel
//        default:
//            return ""
//        }
//    }
    
    
    static func OrderStatusColor(status: Int) -> UIColor {
        switch status {
        case 1:
            return .systemYellow
        case 2:
            return .green
        case 3:
            return .blue
        case 10:
            return .darkGray
        default:
            return .darkGray
        }
    }
    
    enum OrderStatusCode: Int {
        case RequestOrder = 1
        case ProductReady = 2
        case AlreadyPickup = 3
        case Cancel = 10
    }
    
    static let responseCodeAccepted: [Int] = [200,201,400,401,403,422,500,502,504]
    static let responseCodeFailed: [Int] = [400,401,403,422,500,502,504]
    static let responseCodeSucceed: [Int] = [200,201]

//    enum ResponseCode: Int {
//        case success = 200
//        case created = 201
//        case badRequest = 422
//        case unauthorized = 401
//        case forbidden = 403
//        case validationError = 400
//        case internalServerError = 500
//        case serverBadGateway = 502
//        case timeout = 504
//    }
}
