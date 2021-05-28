//
//  LoginDataResponse.swift
//  Core
//
//  Created by MacBook on 24/05/21.
//

import Foundation

public struct LoginDataResponse: Codable {
    public var hasPin: Bool
    public var id: Int
    public var email: String
    public var token: String
    public var expiredIn: Int
    public var refreshToken: String
    
    enum CodingKeys: String, CodingKey {
        case hasPin
        case id
        case email
        case token
        case expiredIn = "expired_in"
        case refreshToken
    }
}
