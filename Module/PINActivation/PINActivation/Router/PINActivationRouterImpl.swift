//
//  PINActivationRouterImpl.swift
//  PINActivation
//
//  Created by MacBook on 26/05/21.
//

import Foundation
import UIKit
import Core

public class PINActivationRouterImpl {
    public static func navigateToModule() {
        let bundle = Bundle(identifier: "com.casestudy.PINActivation")
        let vc = PINActivationViewController(nibName: "PINActivationViewController", bundle: bundle)
        
        let networkManager = AuthNetworkManagerImpl()

        let router = PINActivationRouterImpl()
        let interactor = PINActivationInteractorImpl(authNetworkManager: networkManager)
        let presenter = PINActivationPresenterImpl(view: vc, interactor: interactor, router: router)

        interactor.interactorOutput = presenter
        
        vc.presenter = presenter
        let navController = UINavigationController(rootViewController: vc)
        navController.setNavigationBarHidden(true, animated: false)
        
        UIApplication.shared.windows.first?.rootViewController = navController
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
}

extension PINActivationRouterImpl: PINActivationRouter {
    func navigateToHome() {
        AppRouter.shared.navigateToHome()
        NotificationCenter.default.post(name: Notification.Name("reloadRootView"), object: nil)
    }
}
