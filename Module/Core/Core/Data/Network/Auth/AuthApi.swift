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
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .login:
            return .post
        case .register:
            return .post
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
        }
    }
    
    public var headers: [String : String]? {
        return [
            "Content-Type": "application/json"
        ]
    }
}
