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
    public static func navigateToModule(viewController: UIViewController) {
        let bundle = Bundle(identifier: "com.casestudy.TransactionDetails")
        let vc = TransactionDetailsViewController(nibName: "TransactionDetailsViewController", bundle: bundle)
        
        let router = TransactionDetailsRouterImpl()
        let presenter = TransactionDetailsPresenterImpl(view: vc, router: router)

        vc.presenter = presenter
    
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .coverVertical
        
        viewController.navigationController?.pushViewController(vc, animated: true)
    }
}

extension TransactionDetailsRouterImpl: TransactionDetailsRouter {
    public func navigateToHome() {
        AppRouter.shared.navigateToHome()
    }
}
