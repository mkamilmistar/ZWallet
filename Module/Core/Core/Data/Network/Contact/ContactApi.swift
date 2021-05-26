//
//  BalanceApi.swift
//  Core
//
//  Created by MacBook on 26/05/21.
//

import Foundation
import Moya

public enum ContactApi {
    case getContact
}

extension ContactApi: TargetType {
    public var baseURL: URL {
        return URL(string: AppConstant.baseUrl)!
    }
    
    public var path: String {
        switch self {
        case .getContact:
            return "tranfer/contactUser"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .getContact:
            return .get
        }
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        switch self {
        case .getContact:
            return .requestPlain
        }
    }
    
    public var headers: [String : String]? {
        let token: String = UserDefaultHelper.shared.get(key: .userToken) ?? ""
        switch self {
        case .getContact:
            return [
                "Content-Type": "application/json",
                "Authorization": "Bearer \(token)"
            ]
        }
    }
}
