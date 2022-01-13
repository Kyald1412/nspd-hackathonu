//
//  UserEntity+CoreDataProperties.swift
//  
//
//  Created by Dhiky Aldwiansyah on 13/01/22.
//
//

import Foundation
import CoreData


extension UserEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserEntity> {
        return NSFetchRequest<UserEntity>(entityName: "UserEntity")
    }

    @NSManaged public var country_id: String?
    @NSManaged public var customer_id: String?
    @NSManaged public var email: String?
    @NSManaged public var firebase_id: String?
    @NSManaged public var fname: String?
    @NSManaged public var gender: String?
    @NSManaged public var img_url: String?
    @NSManaged public var lang: String?
    @NSManaged public var lname: String?
    @NSManaged public var phone: String?
    @NSManaged public var phone_country: String?
    @NSManaged public var province_id: String?
    @NSManaged public var referral: String?
    @NSManaged public var status: String?
    @NSManaged public var token: String?
    @NSManaged public var uid: Int64

}
