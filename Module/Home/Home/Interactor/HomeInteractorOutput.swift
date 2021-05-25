//
//  HomeInteractorOutput.swift
//  Home
//
//  Created by MacBook on 24/05/21.
//

import Foundation
import Core

protocol HomeInteractorOutput {
    func loadedUserProfileData(userProfile: UserProfileEntity)
    func loadedTransaction(transactions: [TransactionEntity])
}
