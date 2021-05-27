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
    public static func navigateToModule(viewController: UIViewController, id: Int, name: String, phone: String, image: String) {
        let bundle = Bundle(identifier: "com.casestudy.Transaction")
        let vc = TransactionViewController(nibName: "TransactionViewController", bundle: bundle)
        
        let networkManager = TransactionNetworkManagerImpl()
        
        let interactor = TransactionInteractorImpl(networkManager: networkManager)
        let router = TransactionRouterImpl()
        let presenter = TransactionPresenterImpl(view: vc, interactor: interactor, router: router)
        
        vc.presenter = presenter
        
        // Get data from Receiver
        vc.id = id
        vc.name = name
        vc.phone = phone
        vc.image = image
        
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .coverVertical
        
        viewController.navigationController?.pushViewController(vc, animated: true)
    }
}

extension TransactionRouterImpl: TransactionRouter {
    public func backToHome() {
        NotificationCenter.default.post(name: Notification.Name("reloadRootView"), object: nil)
    }
    
    public func navigateToDetailTransaction(viewController: UIViewController) {
        viewController.navigationController?.pushViewController(viewController, animated: true)
    }
    
    public func backToReceiver(viewController: UIViewController) {
        viewController.navigationController?.popViewController(animated: true)
    }
}
