//
//  BalanceNetworkManagerImpl.swift
//  Core
//
//  Created by MacBook on 24/05/21.
//

import Foundation
import Moya

public class BalanceNetworkManagerImpl: BalanceNetworkManager {
    public init() {
        
    }
    
    public func getBalance(completion: @escaping (GetBalanceDataResponse?, Error?) -> ()) {
        let provider = MoyaProvider<BalanceApi>(isRefreshToken: true)
        provider.request(.getBalance) { response in
            switch response {
            case .success(let result):
                let decoder = JSONDecoder()
                do {
                    let getBalanceResponse = try decoder.decode(GetBalanceResponse.self, from: result.data)
                    completion(getBalanceResponse.data[0], nil)
                } catch let error {
                    completion(nil, error)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}
