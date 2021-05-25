//
//  LoginDataResponse.swift
//  Core
//
//  Created by MacBook on 24/05/21.
//

import Foundation

public struct LoginDataResponse: Codable {
    public var id: Int
    public var email: String
    public var token: String
}
