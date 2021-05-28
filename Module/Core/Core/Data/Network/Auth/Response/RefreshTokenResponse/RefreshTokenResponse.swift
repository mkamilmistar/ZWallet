//
//  RefreshTokenResponse.swift
//  Core
//
//  Created by MacBook on 28/05/21.
//

import Foundation

public struct RefreshTokenResponse: Codable {
    var status: Int
    var message: String
    var data: RefreshTokenDataResponse
}
