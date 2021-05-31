//
//  TransactionApi.swift
//  Core
//
//  Created by MacBook on 27/05/21.
//

import Foundation
import Moya

public enum TransactionApi {
    case createTransfer(pin: String, receiver: Int, amount: Int, notes: String)
}

extension TransactionApi: TargetType {
    public var baseURL: URL {
        return URL(string: AppConstant.baseUrl)!
    }
    
    public var path: String {
        switch self {
        case .createTransfer:
            return "tranfer/newTranfer"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .createTransfer:
            return .post
        }
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        switch self {
        case .createTransfer( _, let receiver, let amount, let notes):
            return .requestParameters(
                parameters: ["receiver": receiver, "amount": amount, "notes": notes],
                encoding: JSONEncoding.default
            )
        }
    }
    
    public var headers: [String: String]? {
        let token: String = UserDefaultHelper.shared.get(key: .userToken) ?? ""
        switch self {
        case .createTransfer(let pin, _, _, _):
            return [
                "Content-Type": "application/json",
                "Authorization": "Bearer \(token)",
                "x-access-PIN": "\(pin)"
            ]
        }
    }
}
