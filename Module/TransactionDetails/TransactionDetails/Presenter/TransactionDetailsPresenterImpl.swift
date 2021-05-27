//
//  TransactionDetailsPresenterImpl.swift
//  TransactionDetails
//
//  Created by MacBook on 28/05/21.
//

import Foundation
import UIKit
import Core

public class TransactionDetailsPresenterImpl {
    var view: TransactionDetailsView
    var router: TransactionDetailsRouter
    
    init(view: TransactionDetailsView, router: TransactionDetailsRouter) {
        self.view = view
        self.router = router
    }
    
}

extension TransactionDetailsPresenterImpl: TransactionDetailsPresenter {
    func navigateToHome() {
        self.router.navigateToHome()
    }
}
