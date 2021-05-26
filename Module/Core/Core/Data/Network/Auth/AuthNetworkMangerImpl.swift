//
//  AuthNetworkMangerImpl.swift
//  Core
//
//  Created by MacBook on 24/05/21.
//

import Foundation
import Moya

public class AuthNetworkManagerImpl: AuthNetworkManager {
    public init() {
        
    }
    
    public func login(email: String, password: String, completion: @escaping (LoginDataResponse?, Error?) -> ()) {
        let provider = MoyaProvider<AuthApi>()
        provider.request(.login(email: email, password: password)) { response in
            switch response {
            case .success(let result):
                let decoder = JSONDecoder()
                do {
                    let loginResponse = try decoder.decode(LoginResponse.self, from: result.data)
                    completion(loginResponse.data, nil)
                } catch let error {
                    completion(nil, error)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    public func register(username: String, email: String, password: String, completion: @escaping (RegisterResponse?, Error?) -> ()) {
        let provider = MoyaProvider<AuthApi>()
        provider.request(.register(username: username, email: email, password: password)) { (response) in
            switch response {
            case .success(let result):
//                let decoder = JSONDecoder()
                do {
                    print(result)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
}
