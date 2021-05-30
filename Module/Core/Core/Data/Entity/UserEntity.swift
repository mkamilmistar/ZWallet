//
//  BalanceEntity.swift
//  Core
//
//  Created by MacBook on 29/05/21.
//

import Foundation

public struct UserEntity: Codable {
    public var id: Int
    public var name, phone: String
    public var balance: Int
    public var image: String

    public init(id: Int, name: String, phone: String, balance: Int, image: String) {
        self.id = id
        self.name = name
        self.phone = phone
        self.balance = balance
        self.image = image
    }
}
