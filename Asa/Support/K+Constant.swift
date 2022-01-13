//
//  K+Constant.swift
//  Asa
//
//  Created by Dhiky Aldwiansyah on 24/08/20.
//  Copyright © 2020 Dhiky Aldwiansyah. All rights reserved.
//

import Foundation
import SwiftyUserDefaults
import KeychainAccess

public enum Constant {
    public struct App {
        public static let deepLink = "asa"
        public static let deepLinkResetPassword = "reset_password"
    }
}

public class KeychainWrapper {
    public static let shared = KeychainWrapper()
    
    private let keychain = Keychain(service: "id.naspad.asa-token")

    public func setAuthToken(token: String){
        keychain["token_auth"] = token
    }
    
    public func getAuthToken() -> String{
        return keychain[string: "token_auth"] ?? ""
    }
}

public extension DefaultsKeys {
    var isLoggedIn: DefaultsKey<Bool> { .init("is_logged_in", defaultValue: false) }
}
