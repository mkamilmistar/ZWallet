//
//  LoginRouterImpl.swift
//  Login
//
//  Created by MacBook on 24/05/21.
//

import Foundation
import Core
import UIKit
import Home

public class LoginRouterImpl {
    
    public static func navigateToModule() {
        //show login view
        let bundle = Bundle(identifier: "com.casestudy.Login")
        let vc = LoginViewController(nibName: "LoginViewController", bundle: bundle)
        
        let networkManager = AuthNetworkManagerImpl()
        
        let router = LoginRouterImpl()
        let interactor = LoginInteractorImpl(authNetworkManager: networkManager)
        let presenter = LoginPresenterImpl(view: vc, interactor: interactor, router: router)
        
        interactor.interactorOutput = presenter
        
        vc.presenter = presenter
        
        let navController = UINavigationController(rootViewController: vc)
        navController.setNavigationBarHidden(true, animated: false)
        
        UIApplication.shared.windows.first?.rootViewController = navController
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }

}

extension LoginRouterImpl: LoginRouter {
    func navigateToRegister(viewController: UIViewController) {
        AppRouter.shared.registerScene!(viewController)
    }
    
    func navigateToHome() {
        NotificationCenter.default.post(name: Notification.Name("reloadRootView"), object: nil)
    }
    
    func navigateToPinActiovation() {
        AppRouter.shared.navigateToPINActivation()
    }
    
    func navigateToOTP() {
        AppRouter.shared.navigateToConfirmOTP()
    }
}
