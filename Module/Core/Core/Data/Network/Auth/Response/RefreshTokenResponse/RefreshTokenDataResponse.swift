//
//  RefreshTokenDataResponse.swift
//  Core
//
//  Created by MacBook on 28/05/21.
//

import Foundation

public struct RefreshTokenDataResponse: Codable {
    public var id: Int
    public var email: String
    public var token: String
    public var expiredIn: Int
    public var expiredAt: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case email
        case token
        case expiredIn = "expired_in"
        case expiredAt = "expired_at"
    }
}
