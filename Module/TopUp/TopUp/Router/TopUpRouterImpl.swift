//
//  TopUpRouterImpl.swift
//  TopUp
//
//  Created by MacBook on 30/05/21.
//

import Foundation
import Core
import UIKit

public class TopUpRouterImpl {
    public init() {
        
    }
    
    public static func navigateToModule(viewController: UIViewController) {
        let bundle = Bundle(identifier: "com.casestudy.TopUp")
        let vc = TopUpViewController(nibName: "TopUpViewController", bundle: bundle)
        
//        let balanceNetwork = BalanceNetworkManagerImpl()
        
        let router = TopUpRouterImpl()
//        let interactor = TransactionInteractorImpl(balanceNetworkManager: balanceNetwork)
        let presenter = TopUpPresenterImpl(router: router)
        
        vc.presenter = presenter
        
//        interactor.interactorOutput = presenter
    
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .coverVertical
        
        viewController.navigationController?.pushViewController(vc, animated: true)
    }
}

extension TopUpRouterImpl: TopUpRouter {
    func navigateToHome(viewController: UIViewController) {
        viewController.navigationController?.popToRootViewController(animated: true)
    }
}
