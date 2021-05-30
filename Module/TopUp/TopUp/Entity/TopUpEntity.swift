//
//  TopUpEntity.swift
//  Core
//
//  Created by MacBook on 30/05/21.
//

import Foundation

public struct TopUpEntity {
    var id: String
    var howTopUp: String
    
    public init(id: String, howTopUp: String) {
        self.id = id
        self.howTopUp = howTopUp
    }
}

public var topUp: [TopUpEntity] = [
    TopUpEntity(id: "1", howTopUp: "Go to the nearest ATM or you can use E-Banking."),
    TopUpEntity(id: "2", howTopUp: "Type your security number on the ATM or E-Banking."),
    TopUpEntity(id: "3", howTopUp: "Select “Transfer” in the menu"),
    TopUpEntity(id: "4", howTopUp: "Type the virtual account number that we provide you at the top."),
    TopUpEntity(id: "5", howTopUp: "Type the amount of the money you want to top up."),
    TopUpEntity(id: "6", howTopUp: "Read the summary details"),
    TopUpEntity(id: "7", howTopUp: "Press transfer / top up"),
    TopUpEntity(id: "8", howTopUp: "You can see your money in Zwallet within 3 hours.")
]
