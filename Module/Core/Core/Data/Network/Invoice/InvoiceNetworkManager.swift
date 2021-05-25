//
//  InvoiceNetworkManager.swift
//  Core
//
//  Created by MacBook on 24/05/21.
//

import Foundation

public protocol InvoiceNetworkManager {
    func getThisWeekInvoice(completion: @escaping ([GetInvoiceDataResponse]?, Error?) -> ())
    func getAllInvoice(completion: @escaping ([GetInvoiceDataResponse]?, Error?) -> ())
}
