//
//  BalanceApi.swift
//  Core
//
//  Created by MacBook on 24/05/21.
//

import Foundation
import Moya

public enum BalanceApi {
    case getBalance
}

extension BalanceApi: TargetType {
    public var baseURL: URL {
        return URL(string: AppConstant.baseUrl)!
    }
    
    public var path: String {
        switch self {
        case .getBalance:
            return "/home/getBalance"
        }
    }
    
    public var method: Moya.Method {
        return .get
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        switch self {
        case .getBalance:
            return .requestPlain
        }
    }
    
    public var headers: [String: String]? {
        let token: String = UserDefaultHelper.shared.get(key: .userToken) ?? ""
        return [
            "Content-Type": "application/json",
            "Authorization": "Bearer \(token)"
        ]
    }
    
}
