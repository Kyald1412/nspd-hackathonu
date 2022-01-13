//
//  DIService.swift
//  Asa
//
//  Created by Dhiky Aldwiansyah on 13/01/22.
//

import Foundation
import Moya
import SwiftyUserDefaults

public class DIService{
    
    static let authPlugin = AccessTokenPlugin { _ in KeychainWrapper.shared.getAuthToken() }

    public static let authUseCase =
        AuthUseCase(authRepository: AuthRepository(authProvider: MoyaProvider<AuthService>(plugins:[NetworkLoggerPlugin(configuration: .init(logOptions: .verbose)),authPlugin])))
    
}
