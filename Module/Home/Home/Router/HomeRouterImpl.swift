//
//  HomeRouterImpl.swift
//  Home
//
//  Created by MacBook on 24/05/21.
//

import Foundation
import UIKit
import Core

public class HomeRouterImpl {
    public static func navigateToModule() {
        let bundle = Bundle(identifier: "com.casestudy.Home")
        let vc = HomeViewController(nibName: "HomeViewController", bundle: bundle)
        
        let balanceNetworkManager = BalanceNetworkManagerImpl()
        let invoiceNetworkManager = InvoiceNetworkManagerImpl()
        
        let router = HomeRouterImpl()
        let interactor = HomeInteractorImpl(balanceNetworkManager: balanceNetworkManager, invoiceNetworkManager: invoiceNetworkManager)
        let presenter = HomePresenterImpl(view: vc, interactor: interactor, router: router)
        
        interactor.interactorOutput = presenter
        
        vc.presenter = presenter
        
        let navController = UINavigationController(rootViewController: vc)
        navController.setNavigationBarHidden(true, animated: false)
        
        UIApplication.shared.windows.first?.rootViewController = navController
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
    
}

extension HomeRouterImpl: HomeRouter {
    func navigateToReceiver(viewController: UIViewController) {
        AppRouter.shared.navigateToReceiver(viewController)
    }
    
    func navigateToHistory(viewController: UIViewController) {
        AppRouter.shared.navigateToHistory(viewController)
    }
    
    func navigateToLogin() {
        NotificationCenter.default.post(name: Notification.Name("reloadRootView"), object: nil)
    }
    
    func navigateToTopUp(viewController: UIViewController) {
        AppRouter.shared.navigateToTopUp(viewController)
    }
}
