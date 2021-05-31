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
    
    init(invoiceNetworkManager: InvoiceNetworkManager) {
        self.invoiceNetworkManager = invoiceNetworkManager
    }
    
    func getHistoryThisWeek() {
        self.invoiceNetworkManager.getThisWeekInvoice { (data, _) in
            var historyThisWeek: [TransactionEntity] = []
            
            data?.forEach({ (invoiceData) in
                historyThisWeek.append(TransactionEntity(name: invoiceData.name, type: invoiceData.type, imageUrl: "\(AppConstant.baseUrl)\(invoiceData.image)", amount: invoiceData.amount, notes: invoiceData.notes))
                
                self.interactorOutput?.loadedHistoryThisWeek(historiesThisWeek: historyThisWeek)
            })
        }
    }
    
    func getHistoryThisMonth() {
        self.invoiceNetworkManager.getAllInvoice { (data, _) in
            var historyThisMonth: [TransactionEntity] = []
            
            data?.forEach({ (invoiceData) in
                historyThisMonth.append(TransactionEntity(name: invoiceData.name, type: invoiceData.type, imageUrl: "\(AppConstant.baseUrl)\(invoiceData.image)", amount: invoiceData.amount, notes: invoiceData.notes))
                
                self.interactorOutput?.loadedHistoryThisMonth(historiesThisMonth: historyThisMonth)
            })
        }
    }
}
