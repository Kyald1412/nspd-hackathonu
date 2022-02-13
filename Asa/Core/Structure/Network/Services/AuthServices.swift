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
    case register(registerRequest: RegisterRequest)
    case logout
}

extension AuthService: TargetType {
    
    public var authorizationType: AuthorizationType? {
        switch self {
        case .login:
            return .bearer
        case .register:
            return .bearer
        case .logout:
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
        case .register:
            return "v1/auth/register"
        case .logout:
            return "v1/logout"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .login:
            return .post
        case .register:
            return .post
        case .logout:
            return .post
        }
    }
    
    public var task: Task {
        switch self {
        case .login(let loginRequest):
            return .requestParameters(parameters: loginRequest.toDictionary(), encoding: JSONEncoding.default)
        case .register(let registerRequest):
            return .requestParameters(parameters: registerRequest.toDictionary(), encoding: JSONEncoding.default)
        case .logout:
            return .requestPlain
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
            guard let path = bundle.path(forResource: AuthResponsesJSON.LoginResponse.rawValue, ofType: "json"),
                  let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe) else {
                      return "".data(using: String.Encoding.utf8)!
                  }
            return data
        case .register(_):
            let bundle = Bundle.main
            guard let path = bundle.path(forResource: AuthResponsesJSON.RegisterResponse.rawValue, ofType: "json"),
                  let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe) else {
                      return "".data(using: String.Encoding.utf8)!
                  }
            return data
        case .logout:
            let bundle = Bundle.main
            guard let path = bundle.path(forResource: AuthResponsesJSON.LogoutResponse.rawValue, ofType: "json"),
                  let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe) else {
                      return "".data(using: String.Encoding.utf8)!
                  }
            return data
        }
    }
}
