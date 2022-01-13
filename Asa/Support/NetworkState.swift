//
//  NetworkState.swift
//  Asa
//
//  Created by Dhiky Aldwiansyah on 09/08/20.
//  Copyright © 2020 Dhiky Aldwiansyah. All rights reserved.
//

import Alamofire
import Foundation

struct NetworkState {
    var isInternetAvailable: Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}
