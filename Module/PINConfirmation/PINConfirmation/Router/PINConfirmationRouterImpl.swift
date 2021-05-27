//
//  PINConfirmationRouterImpl.swift
//  PINConfirmation
//
//  Created by MacBook on 27/05/21.
//

import Foundation
import UIKit
import Core

public class PINConfirmationRouterImpl {
    public static func navigateToModule(viewController: UIViewController, passDataTransaction: ReceiverEntity, amount: Int, notes: String) {
        let bundle = Bundle(identifier: "com.casestudy.PINConfirmation")
        let vc = PINConfirmationViewController(nibName: String(describing: PINConfirmationViewController.self), bundle: bundle)
        
        let netwokManager = TransactionNetworkManagerImpl()
        
        let router = PINConfirmationRouterImpl()
        let interactor = PINConfirmationInteractorImpl(transactionNetworkManager: netwokManager)
        let presenter = PINConfirmationPresenterImpl(view: vc, interactor: interactor, router: router)
        
        interactor.interactorOutput = presenter

        vc.presenter = presenter
        vc.amount = amount
        vc.passDataReceiver = passDataTransaction
        vc.notes = notes
        
        viewController.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension PINConfirmationRouterImpl: PINConfirmationRouter {
    public func navigateToHome(viewController: UIViewController) {
        viewController.navigationController?.popToRootViewController(animated: true)
    }
    
    public func backNavigation(viewController: UIViewController) {
        viewController.navigationController?.popViewController(animated: true)
    }
    
    public func navigateToTransactionStatus(viewController: UIViewController) {
        AppRouter.shared.navigateToTransactionDetails(viewController)
    }
}
