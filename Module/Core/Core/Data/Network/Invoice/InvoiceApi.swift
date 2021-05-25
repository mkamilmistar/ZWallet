//
//  InvoiceApi.swift
//  Core
//
//  Created by MacBook on 24/05/21.
//

import Foundation
import Moya

public enum InvoiceApi {
    case getThisWeekInvoice
    case getAllInvoice
}

extension InvoiceApi: TargetType {
    public var baseURL: URL {
        return URL(string: AppConstant.baseUrl)!
    }
    
    public var path: String {
        switch self {
        case .getThisWeekInvoice, .getAllInvoice:
            return "/home/getAllInvoice"
        }
    }
    
    public var method: Moya.Method {
        .get
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        switch self {
        case .getThisWeekInvoice:
            return .requestParameters(parameters: ["thisweek": true], encoding: URLEncoding.queryString)
        case .getAllInvoice:
            return .requestPlain
        }
    }
    
    public var headers: [String : String]? {
        let token: String = UserDefaultHelper.shared.get(key: .userToken) ?? ""
        return [
            "Content-Type": "application/json",
            "Authorization": "Bearer \(token)"
        ]
    }
    
    
}
