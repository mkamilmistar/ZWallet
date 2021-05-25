//
//  HistoryInteractorImpl.swift
//  History
//
//  Created by MacBook on 25/05/21.
//

import Foundation
import Core

class HistoryInteractorImpl: HistoryInteractor {
    
    var interactorOutput: HistoryInteractorOutput?
    
    let invoiceNetworkManager: InvoiceNetworkManager
    
    init(invoiceNetworkManager: InvoiceNetworkManager){
        self.invoiceNetworkManager = invoiceNetworkManager
    }
    
    func getHistoryTransaction() {
        self.invoiceNetworkManager.getAllInvoice { (data, error) in
            var historyTransactions: [TransactionEntity] = []
            
            data?.forEach({ (invoiceData) in
                historyTransactions.append(TransactionEntity(name: invoiceData.name, type: invoiceData.type, imageUrl: "\(AppConstant.baseUrl)\(invoiceData.image)", amount: invoiceData.amount, notes: invoiceData.notes))
                
                self.interactorOutput?.loadedHistoryTransaction(histories: historyTransactions)
            })
        }
    }
}
