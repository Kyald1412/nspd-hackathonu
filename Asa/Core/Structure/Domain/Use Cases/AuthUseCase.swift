//
//  AuthUseCase.swift
//  Asa
//
//  Created by Dhiky Aldwiansyah on 28/05/21.
//

import Foundation
import UIKit
import SwiftyUserDefaults

public protocol AuthUseCaseProtocol {
    func executeFetchLogin(email: String, password: String,deviceId: String, referral: String,
                 cached: @escaping (UserData) -> Void,
                 completion: @escaping (Result<UserData, Error>) -> Void)
}

public extension AuthUseCase {
    
    func getUserData(cached: @escaping (UserData) -> Void) {
        return authRepository.getUserData { result in
            switch result {
            case .success(let response):
//                print("CACHCCED \(response)")
                cached(response)
            case .failure(let error):
                print("CORE DATA ERROR \(error)")
//                completion(.failure(error))
            }
        }
    }
    
}

public final class AuthUseCase: AuthUseCaseProtocol {

    private let authRepository: AuthRepository

    public init(authRepository: AuthRepository) {
        self.authRepository = authRepository
    }
    
    public func executeFetchLogin(email: String, password: String,deviceId: String, referral: String,
                 cached: @escaping (UserData) -> Void,
                 completion: @escaping (Result<UserData, Error>) -> Void) {

        
        //Call cached here
//        getUserData { UserData in
//            
//        }
        
        return authRepository.executeFetchLoginApi(email: email, password: password,deviceId: deviceId,referral: referral) { result in
            switch result {
            case .success(let response):
                self.authRepository.save(response: response, completion: { result in
                    switch result {
                    case .success(let response):
                        print("Success save user data \(response)")
                    case .failure(let error):
                        print("Error save data \(error)")
                    }
                })
                
                cached(response.toDomain())
                
                KeychainWrapper.shared.setAuthToken(token: response.token ?? "")

                completion(.success(response))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

}
