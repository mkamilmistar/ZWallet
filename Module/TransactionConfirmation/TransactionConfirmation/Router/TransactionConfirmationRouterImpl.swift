//
//  TransactionDetailRouterImpl.swift
//  TransactionDetail
//
//  Created by MacBook on 27/05/21.
//

import Foundation
import UIKit
import Core

public class TransactionConfirmationRouterImpl {
    public static func navigateToModule(viewController: UIViewController, passingData: ReceiverEntity, amount: Int, notes: String) {
        
        let bundle = Bundle(identifier: "com.casestudy.TransactionConfirmation")
        let vc = TransactionConfirmationViewController(nibName: "TransactionConfirmationViewController", bundle: bundle)
        
        let balanceNetworkManager = BalanceNetworkManagerImpl()
        
        let router = TransactionConfirmationRouterImpl()
        let interactor = TransactionConfirmationInteractorImpl(balanceNetworkManager: balanceNetworkManager)
        let presenter = TransactionConfirmationPresenterImpl(view: vc, interactor: interactor, router: router)

        vc.presenter = presenter
        interactor.interactorOutput = presenter
        
        // Get data from Receiver
        vc.passDataReceiver = passingData
        vc.amount = amount
        vc.notes = notes
    
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .coverVertical
        
        viewController.navigationController?.pushViewController(vc, animated: true)
    }
}

extension TransactionConfirmationRouterImpl: TransactionConfirmationRouter {
    public func navigateToInputPIN(viewController: UIViewController, passDataTransaction: ReceiverEntity, amount: Int, notes: String) {
        AppRouter.shared.navigateToInputPINConfirm(viewController, passDataTransaction, amount, notes)
    }
    
    public func backToTransaction(viewController: UIViewController) {
        viewController.navigationController?.popViewController(animated: true)
    }
}


