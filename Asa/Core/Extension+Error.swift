//
//  Extension+Cell.swift
//  Asa
//
//  Copyright © 2020 Dhiky Aldwiansyah. All rights reserved.
//

import Foundation

extension Error {

    public var asBaseResponse: BaseResponse {
        let error = self as NSError
        return BaseResponse(code: error.code , message: error.localizedDescription )
    }

}
