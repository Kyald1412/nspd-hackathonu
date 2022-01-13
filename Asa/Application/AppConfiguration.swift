//
//  AppConfiguration.swift
//  Asa
//
//  Created by Dhiky Aldwiansyah on 14/11/21.
//

import Foundation
public final class AppConfiguration {
    
    // Api Key
    static let apiVersion = ""
    static var apiKey: String = {
        guard let apiKey = Bundle.main.object(forInfoDictionaryKey: "apiKey") as? String else {
            fatalError("ApiKey must not be empty in plist")
        }
        return apiKey
    }()
    
    static var apiBaseImgURL: String = {
        guard let apiBaseImgURL = Bundle.main.object(forInfoDictionaryKey: "apiBaseImgURL") as? String else {
            fatalError("apiBaseImgURL must not be empty in plist")
        }
        return apiBaseImgURL
    }()
    
    static var apiBaseAuthURL: String = {
        guard let apiBaseAuthURL = Bundle.main.object(forInfoDictionaryKey: "apiBaseAuthURL") as? String else {
            fatalError("apiBaseAuthURL must not be empty in plist")
        }
        return apiBaseAuthURL
    }()
    
    
    static var apiBaseURL: String = {
        guard let apiBaseURL = Bundle.main.object(forInfoDictionaryKey: "apiBaseURL") as? String else {
            fatalError("apiBaseURL must not be empty in plist")
        }
        return apiBaseURL
    }()
}
