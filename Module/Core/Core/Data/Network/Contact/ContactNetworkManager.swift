//
//  BalanceNetworkManager.swift
//  Core
//
//  Created by MacBook on 26/05/21.
//

import Foundation

public protocol ContactNetworkManager {
    func getContact(completion: @escaping ([GetContactDataResponse]?, Error?) -> ())
}
