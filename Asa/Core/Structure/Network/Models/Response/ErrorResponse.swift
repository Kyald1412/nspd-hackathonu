//
//  ErrorResponse.swift
//  Asa
//
//  Created by Jehnsen Hirena Kane on 13/02/22.
//

import Foundation

struct ErrorResponse: Decodable,Equatable {
    let code: String?
    let message: String?
}
