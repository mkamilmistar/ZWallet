//
//  ReceiverEntity.swift
//  Core
//
//  Created by MacBook on 26/05/21.
//

import Foundation

public struct ReceiverEntity {
    public var id: Int
    public var name: String
    public var phone: String
    public var image: String
    
    public init(id: Int, name: String, phone: String, image: String) {
        self.id = id
        self.name = name
        self.phone = phone
        self.image = image
    }
}
