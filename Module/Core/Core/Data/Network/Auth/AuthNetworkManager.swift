//
//  AuthNetworkManager.swift
//  Core
//
//  Created by MacBook on 24/05/21.
//

import Foundation

public protocol AuthNetworkManager {
    func login(email: String, password: String, completion: @escaping (LoginDataResponse?, Error?) -> ())
}
