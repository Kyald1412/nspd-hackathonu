//
//  AuthRepository.swift
//  ExampleMVVM
//
//  Created by Oleh Kudinov on 01.10.18.
//
// **Note**: DTOs structs are mapped into Domains here, and Repository protocols does not contain DTOs

import Foundation
import Moya
import SwiftyJSON

public protocol AuthRepositoryProtocol {
    func executeFetchLoginApi(email: String, password: String,deviceId: String, referral: String,
                       completion: @escaping (Result<UserData, Error>) -> Void)
}

public class AuthRepository {
    
    private var authProvider: MoyaProvider<AuthService>
    private let cache: LocalAuthRepository
    
    public init(authProvider: MoyaProvider<AuthService>, cache: LocalAuthRepository = LocalAuthRepository()) {
        self.authProvider = authProvider
        self.cache = cache
        
        //        if NetworkState().isInternetAvailable {
        //            isRechable.accept(true)
        //        }
    }
}

extension AuthRepository: LocalAuthRepositoryProtocol {
    public func getUserData(completion: @escaping (Result<UserData, CoreDataStorageError>) -> Void) {
        self.cache.getUserData { result in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    public func save(response: UserData, completion: @escaping (Result<Bool, CoreDataStorageError>) -> Void){
        self.cache.save(response: response, completion: completion)
    }
    
}


extension AuthRepository: AuthRepositoryProtocol {
    
    public func executeFetchLoginApi(email: String, password: String,deviceId: String, referral: String,
                              completion: @escaping (Result<UserData, Error>) -> Void){
        
        let loginRequest = LoginRequest(email: email, password: password, deviceId: deviceId, referral: referral)
        
        authProvider.request(.login(loginRequest: loginRequest), completion: { result in
            
            switch result {
            case .success(let response):
                
                guard let userData = try? JSONDecoder().decode(LoginResponse.self, from: response.data) else {
                    print("Error parsing data \(response.description)")
                    let baseResponse = try? JSONDecoder().decode(BaseResponse.self, from: response.data)
                    let error = NSError(domain: "", code: baseResponse?.code ?? 0, userInfo: [ NSLocalizedDescriptionKey: "\(baseResponse?.message ?? "")"])
                    completion(.failure(error))
                    return
                }
                
                if KEnum.responseCodeFailed.contains(userData.code) {
                    let error = NSError(domain: "", code: userData.code, userInfo: [ NSLocalizedDescriptionKey: userData.message ?? ""])
                    completion(.failure(error))
                    return
                }
                
                completion(.success(userData.data))
            case .failure(let error):
                completion(.failure(error))
            }
            
        })
    }
}
