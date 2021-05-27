//
//  ConfirmTransactionRouterImpl.swift
//  ConfirmTransaction
//
//  Created by MacBook on 27/05/21.
//

import Foundation
import UIKit
import Core

public class ConfirmTransactionRouterImpl {
    public static func navigateToModule(viewController: UIViewController, passingData: ReceiverEntity, amount: Int, notes: String) {
        
        let bundle = Bundle(identifier: "com.casestudy.TransactionDetail")
        let vc = TransactionDetailViewController(nibName: "TransactionDetailViewController", bundle: bundle)
        
        let router = TransactionDetailRouterImpl()
        let presenter = TransactionDetailPresenterImpl(view: vc, router: router)

        vc.presenter = presenter
        
        // Get data from Receiver
        vc.passDataReceiver = passingData
        vc.amount = amount
        vc.notes = notes
    
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .coverVertical
        
        viewController.navigationController?.pushViewController(vc, animated: true)
    }
}

extension ConfirmTransactionRouterImpl: ConfirmTransaction {
    public func navigateToInputPIN(viewController: UIViewController, passDataTransaction: ReceiverEntity, amount: Int, notes: String) {
        AppRouter.shared.navigateToInputPINConfirm(viewController, passDataTransaction, amount, notes)
    }
    
    public func backToTransaction(viewController: UIViewController) {
        viewController.navigationController?.popViewController(animated: true)
    }
}


