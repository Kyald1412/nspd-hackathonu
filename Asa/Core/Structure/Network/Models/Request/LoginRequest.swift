//
//  LoginRequest.swift
//  Asa
//
//  Created by Dhiky Aldwiansyah on 28/05/21.
//

import Foundation

// MARK: - Data Transfer Object
public class LoginRequest : NSObject{
    
    public var email : String!
    public var password : String!
    public var deviceId : String!
//    public var referral : String!

    public init(email: String, password: String, deviceId: String) { //}, referral: String) {
        self.email = email
        self.password = password
        self.deviceId = deviceId
//        self.referral = referral
    }
    
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if email != nil{
            dictionary["email"] = email
        }
        if password != nil{
            dictionary["password"] = password
        }
        if deviceId != nil{
            dictionary["device_id"] = deviceId
        }
//        if referral != nil{
//            dictionary["referral"] = referral
//        }
        return dictionary
    }
}
