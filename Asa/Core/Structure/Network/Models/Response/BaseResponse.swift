//
//  BaseResponse.swift
//  Asa
//
//  Created by Dhiky Aldwiansyah on 28/05/21.
//

import Foundation

public struct BaseResponse: Decodable, Equatable {
    public let code: Int
    public let message: String
}
