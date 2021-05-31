//
//  InvoiceNetworkManagerImpl.swift
//  Core
//
//  Created by MacBook on 24/05/21.
//

import Foundation
import Moya

public class InvoiceNetworkManagerImpl: InvoiceNetworkManager {
    public init() {
        
    }
    
    public func getThisWeekInvoice(completion: @escaping ([GetInvoiceDataResponse]?, Error?) -> ()) {
        let provider = MoyaProvider<InvoiceApi>(isRefreshToken: true)
        provider.request(.getThisWeekInvoice) { response in
            switch response {
            case .success(let result):
                let decoder = JSONDecoder()
                do {
                    let getInvoiceResponse = try decoder.decode(GetInvoiceResponse.self, from: result.data)
                    completion(getInvoiceResponse.data, nil)
                } catch let error {
                    completion(nil, error)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    public func getAllInvoice(completion: @escaping ([GetInvoiceDataResponse]?, Error?) -> ()) {
        let provider = MoyaProvider<InvoiceApi>(isRefreshToken: true)
        provider.request(.getAllInvoice) { response in
            switch response {
            case .success(let result):
                let decoder = JSONDecoder()
                do {
                    let getInvoiceResponse = try decoder.decode(GetInvoiceResponse.self, from: result.data)
                    completion(getInvoiceResponse.data, nil)
                } catch let error {
                    completion(nil, error)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}
