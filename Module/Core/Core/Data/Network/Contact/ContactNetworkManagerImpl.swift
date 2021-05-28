//
//  BalanceNetworkManagerImpl.swift
//  Core
//
//  Created by MacBook on 26/05/21.
//

import Foundation
import Moya

public class ContactNetworkManagerImpl: ContactNetworkManager {
    public init() {
        
    }
    
    public func getContact(completion: @escaping ([GetContactDataResponse]?, Error?) -> ()) {
        let provider = MoyaProvider<ContactApi>(isRefreshToken: true)
        provider.request(.getContact) { response in
            switch response {
            case .success(let result):
                do {
                    let getDataContact = try JSONDecoder().decode(GetContactResponse.self, from: result.data)
                    completion(getDataContact.data, nil)
                } catch let error {
                    completion(nil, error)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}
