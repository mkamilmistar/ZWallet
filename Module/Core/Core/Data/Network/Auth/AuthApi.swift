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
    case refreshToken(email: String, refreshToken: String)
    case pinActivation(pin: String)
    case confirmOTP(email: String, otp: String)
    case checkPIN(pin: String)
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
        case .confirmOTP(let email, let otp):
            return "auth/activate/\(email)/\(otp)"
        case .checkPIN(let pin):
            return "auth/checkPIN/\(pin)"
        case .refreshToken:
            return "auth/refresh-token"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .login, .register:
            return .post
        case .pinActivation:
            return .patch
        case .confirmOTP, .checkPIN, .refreshToken:
            return .get
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
        case .register(let username, let email, let password):
            return .requestParameters(
                parameters: ["username": username, "email": email, "password": password],
                encoding: JSONEncoding.default
            )
        case .pinActivation(let pin):
            return .requestParameters(
                parameters: ["PIN": pin],
                encoding: JSONEncoding.default
            )
        case .confirmOTP, .checkPIN:
            return .requestPlain
        case .refreshToken(let email, let refreshToken):
            return .requestParameters(
                parameters: ["email": email, "refreshToken": refreshToken],
                encoding: JSONEncoding.default
            )
        }
    }
    
    public var headers: [String : String]? {
        let token: String = UserDefaultHelper.shared.get(key: .userToken) ?? ""
        switch self {
        case .pinActivation, .checkPIN, .refreshToken:
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
