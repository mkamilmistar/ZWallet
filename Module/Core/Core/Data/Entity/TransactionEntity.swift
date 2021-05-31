//
//  TransactionEntity.swift
//  Core
//
//  Created by MacBook on 24/05/21.
//

import Foundation

public struct TransactionEntity {
    public var name: String
    public var type: String
    public var imageUrl: String
    public var amount: Int
    public var notes: String
    
    public init(name: String, type: String, imageUrl: String, amount: Int, notes: String) {
        self.name = name
        self.type = type
        self.imageUrl = imageUrl
        self.amount = amount
        self.notes = notes
    }
}
