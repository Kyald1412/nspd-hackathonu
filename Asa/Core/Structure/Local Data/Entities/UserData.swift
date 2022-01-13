//
//  UserData.swift
//  Asa
//
//  Created by Dhiky Aldwiansyah on 28/05/21.
//

import Foundation
import CoreData


public struct UserData: Equatable, Decodable {
    public var uid, fname, lname, email: String?
    public var gender, provinceID, countryID, phoneCountry: String?
    public var phone, lang: String?
    public var imgURL: String?
    public var status, firebaseID, referral, token: String?
    public var customerId: CustomerData?
    
    enum CodingKeys: String, CodingKey {
        case uid, fname, lname, email, gender
        case provinceID = "province_id"
        case countryID = "country_id"
        case phoneCountry = "phone_country"
        case phone, lang
        case imgURL = "img_url"
        case status
        case firebaseID = "firebase_id"
        case referral, token
        case customerId = "customer_id"
    }
    
    public init(uid: String?, fname: String?, lname: String?, email: String?, gender: String?, provinceID: String?, countryID: String?, phoneCountry: String?, phone: String?, lang: String?, imgURL: String?, status: String?, firebaseID: String?, referral: String?, token: String?, customerId: CustomerData?)
    {
        self.uid = uid
        self.fname = fname
        self.lname = lname
        self.email = email
        self.gender = gender
        self.provinceID = provinceID
        self.countryID = countryID
        self.phoneCountry = phoneCountry
        self.phone = phone
        self.lang = lang
        self.imgURL = imgURL
        self.status = status
        self.firebaseID = firebaseID
        self.referral = referral
        self.token = token
        self.customerId = customerId

    }
    
}

public struct CustomerData: Decodable, Equatable {
    public var id, uid, customerId, createdAt: String?
    
    enum CodingKeys: String, CodingKey {
        case id, uid
        case createdAt = "created_at"
        case customerId = "customer_id"
    }
    
    public init(id: String?, uid: String?, createdAt: String?, customerId: String?)
    {
        self.uid = uid
        self.id = id
        self.createdAt = createdAt
        self.customerId = customerId
    }
    
}



extension UserData {
    func toEntity(in context: NSManagedObjectContext) -> UserEntity {
        let entity: UserEntity = .init(context: context)
        entity.uid = Int64(uid ?? "0") ?? 0
        entity.fname = fname
        entity.lname = lname
        entity.email = email
        entity.gender = gender
        entity.province_id = provinceID
        entity.country_id = countryID
        entity.phone_country = phoneCountry
        entity.phone = phone
        entity.lang = lang
        entity.img_url = imgURL
        entity.status = status
        entity.firebase_id = firebaseID
        entity.referral = referral
        entity.token = token
        entity.customer_id = customerId?.customerId

        return entity
    }
    
    func toDomain() -> UserData {
        return .init(uid: uid, fname: fname, lname: lname, email: email, gender: gender, provinceID: provinceID, countryID: countryID, phoneCountry: phoneCountry, phone: phone, lang: lang, imgURL: imgURL, status: status, firebaseID: firebaseID, referral: referral, token: token, customerId: customerId)
    }
    
}

extension UserEntity {
    
    convenience init(userData: UserData, insertInto context: NSManagedObjectContext) {
        self.init(context: context)
        uid = Int64(userData.uid ?? "0") ?? 0
        fname = userData.fname
        lname = userData.lname
        email = userData.email
        gender = userData.gender
        province_id = userData.provinceID
        country_id = userData.countryID
        phone_country = userData.phoneCountry
        phone = userData.phone
        lang = userData.lang
        img_url = userData.imgURL
        status = userData.status
        firebase_id = userData.firebaseID
        referral = userData.referral
        token = userData.token
        customer_id = userData.customerId?.customerId
    }
    
    func toDTO() -> UserData {
        return .init(uid: String(uid), fname: fname, lname: lname, email: email, gender: gender, provinceID: province_id, countryID: country_id, phoneCountry: phone_country, phone: phone, lang: lang, imgURL: img_url, status: status, firebaseID: firebase_id, referral: referral, token: token, customerId: CustomerData(id: "", uid: "", createdAt: "", customerId: customer_id))
    }
}
