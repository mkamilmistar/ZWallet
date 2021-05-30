//
//  TransactionDetailsRouterImpl.swift
//  TransactionDetails
//
//  Created by MacBook on 28/05/21.
//

import Foundation
import UIKit
import Core

public class TransactionDetailsRouterImpl {
    public static func navigateToModule(viewController: UIViewController, isSuccess: Bool, passingData: ReceiverEntity, amount: Int, notes: String) {
        
        let bundle = Bundle(identifier: "com.casestudy.TransactionDetails")
        let vc = TransactionDetailsViewController(nibName: "TransactionDetailsViewController", bundle: bundle)
        
        let networkManager = BalanceNetworkManagerImpl()
        
        let router = TransactionDetailsRouterImpl()
        let interactor = TransactionDetailsInteractorImpl(balanceNetworkManager: networkManager)
        let presenter = TransactionDetailsPresenterImpl(view: vc, interactor: interactor, router: router)

        vc.presenter = presenter
        interactor.interactorOutput = presenter
        
        // passing data
        vc.isSuccess = isSuccess
        vc.passingData = passingData
        vc.amount = amount
        vc.notes = notes
        
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .coverVertical
        
        viewController.navigationController?.pushViewController(vc, animated: true)
    }
}

extension TransactionDetailsRouterImpl: TransactionDetailsRouter {
    public func navigateToTransactionConfirmation(viewController: UIViewController) {
        //
    }
    
    public func navigateToHome() {
        AppRouter.shared.navigateToHome()
    }
}
