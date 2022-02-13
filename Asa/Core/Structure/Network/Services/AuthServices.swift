//
//  AuthService.swift
//  Asa
//
//  Created by Dhiky Aldwiansyah on 28/05/21.
//

import Foundation
import Moya

public enum AuthService {
    case login(loginRequest: LoginRequest)
}

extension AuthService: TargetType {
    
    public var authorizationType: AuthorizationType? {
        switch self {
        case .login:
            return .bearer
        }
    }
    
    public var baseURL: URL {
        return URL(string: AppConfiguration.apiBaseURL)!
    }
    
    public var path: String {
        switch self {
        case .login:
            return "v1/auth/login"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .login:
            return .post
        }
    }
    
    public var task: Task {
        switch self {
        case .login(let loginRequest):
            return .requestParameters(parameters: loginRequest.toDictionary(), encoding: JSONEncoding.default)
        }
    }
    
    public var headers: [String: String]? {
        
        switch self {
        default:
            return ["Content-Type": "application/json; charset=utf-8",
                    "Accept": "application/json; charset=utf-8",
                    "APP-KEY":AppConfiguration.apiKey]
//                    "Authorization": KeychainWrapper.shared.getAuthToken()]
        }
        
    }
    
    public var validationType: ValidationType {
        return .customCodes(KEnum.responseCodeAccepted)
    }
    
    public var sampleData: Data {
        switch self {
        case .login(_):
            let bundle = Bundle.main
            guard let path = bundle.path(forResource: LoginResponseJson.LoginResponse.rawValue, ofType: "json"),
                  let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe) else {
                return "".data(using: String.Encoding.utf8)!
            }
            return data
        }
    }
}
