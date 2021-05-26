//
//  AuthApi.swift
//  Core
//
//  Created by MacBook on 24/05/21.
//

import Foundation
import Moya

public enum AuthApi {
    case login(email: String, password: String)
    case register(username: String, email: String, password: String)
    case pinActivation(pin: String)
}

extension AuthApi: TargetType {
    public var baseURL: URL {
        return URL(string: AppConstant.baseUrl)!
    }
    
    public var path: String {
        switch self {
        case .login:
            return "auth/login"
        case .register:
            return "auth/signup"
        case .pinActivation:
            return "auth/PIN"
        }
        
    }
    
    public var method: Moya.Method {
        switch self {
        case .login:
            return .post
        case .register:
            return .post
        case .pinActivation:
            return .patch
        }
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        switch self {
        case .login(let email, let password):
            return .requestParameters(
                parameters: ["email": email, "password": password],
                encoding: JSONEncoding.default
            )
        case .register(username: let username, email: let email, password: let password):
            return .requestParameters(
                parameters: ["username": username, "email": email, "password": password],
                encoding: JSONEncoding.default
            )
        case .pinActivation(pin: let pin):
            return .requestParameters(
                parameters: ["PIN": pin],
                encoding: JSONEncoding.default
            )
        }
    }
    
    public var headers: [String : String]? {
        let token: String = UserDefaultHelper.shared.get(key: .userToken) ?? ""
        switch self {
        case .pinActivation:
            return [
                "Content-Type": "application/json",
                "Authorization": "Bearer \(token)"
            ]
        default:
            return [
                "Content-Type": "application/json"
            ]
        }
    }
}
