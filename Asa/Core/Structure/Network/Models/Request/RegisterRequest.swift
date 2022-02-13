//
//  RegisterRequest.swift
//  Asa
//
//  Created by Jehnsen Hirena Kane on 13/02/22.
//

import Foundation

public class RegisterRequest: NSObject {
    public var email : String!
    public var password : String!
    public var deviceId : String!
    public var fname: String!
    public var gender: String!

    public init(email: String, password: String, deviceId: String, fname: String, gender: String) {
        self.email = email
        self.password = password
        self.deviceId = deviceId
        self.fname = fname
        self.gender = gender
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
        if fname != nil {
            dictionary["fname"] = fname
        }
        if gender != nil {
            dictionary["gender"] = gender
        }
        return dictionary
    }
}
