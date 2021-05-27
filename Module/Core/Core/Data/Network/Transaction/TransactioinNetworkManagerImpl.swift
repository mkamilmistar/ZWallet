//
//  TransactioinNetworkManagerImpl.swift
//  Core
//
//  Created by MacBook on 27/05/21.
//

import Foundation
import Moya

public class TransactionNetworkManagerImpl: TransactionNetworkManager {
    public init() {
        
    }
    
    public func createTransaction(receiver: Int, amount: Int, notes: String, pin: String,
                               completion: @escaping (TransactionResponse?, Error?) -> ()) {
        let provider = MoyaProvider<TransactionApi>()
        provider.request(.createTransfer(
                            pin: pin, receiver: receiver, amount: amount, notes: notes)
        ) { (result) in
            switch result {
            case .success(let response):
                do {
                    let newTransaction = try! JSONDecoder().decode(
                        TransactionResponse.self, from: response.data
                    )
                    completion(newTransaction, nil)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}
