//
//  TransactionRouterImpl.swift
//  Transaction
//
//  Created by MacBook on 27/05/21.
//

import Foundation
import UIKit
import Core

public class TransactionRouterImpl {
    public static func navigateToModule(viewController: UIViewController, passingData: ReceiverEntity) {
        let bundle = Bundle(identifier: "com.casestudy.Transaction")
        let vc = TransactionViewController(nibName: "TransactionViewController", bundle: bundle)
        
        let balanceNetwork = BalanceNetworkManagerImpl()
        
        let router = TransactionRouterImpl()
        let interactor = TransactionInteractorImpl(balanceNetworkManager: balanceNetwork)
        let presenter = TransactionPresenterImpl(view: vc, interactor: interactor, router: router)
        
        vc.presenter = presenter
        
        interactor.interactorOutput = presenter
        
        // Get data from Receiver
        vc.passDataReceiver = passingData
    
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .coverVertical
        
        viewController.navigationController?.pushViewController(vc, animated: true)
    }
}

extension TransactionRouterImpl: TransactionRouter {
    public func navigateToDetailTransaction(viewController: UIViewController,
                                            passDataTransaction: ReceiverEntity, amount: Int, notes: String) {
        AppRouter.shared.navigateToConfirmationTransaction(viewController, passDataTransaction, amount, notes)
    }
    
    public func backToHome() {
        NotificationCenter.default.post(name: Notification.Name("reloadRootView"), object: nil)
    }
    
    public func backToReceiver(viewController: UIViewController) {
        viewController.navigationController?.popViewController(animated: true)
    }
}
