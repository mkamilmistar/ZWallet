//
//  ContactDataResponse.swift
//  Core
//
//  Created by MacBook on 26/05/21.
//

import Foundation

public struct GetContactDataResponse: Codable {
    public var id: Int
    public var name: String
    public var phone: String
    public var image: String
}
