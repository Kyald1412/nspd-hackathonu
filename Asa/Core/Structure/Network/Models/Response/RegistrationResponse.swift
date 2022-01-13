//
//  LoginResponse.swift
//  Asa
//
//  Created by Dhiky Aldwiansyah on 28/05/21.
//

import Foundation

struct LoginResponse: Decodable,Equatable {
    let code: Int
    let message: String?
    let data: UserData
}
