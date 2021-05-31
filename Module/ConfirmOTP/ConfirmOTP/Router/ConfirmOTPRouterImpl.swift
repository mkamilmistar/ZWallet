//
//  ConfirmOTPRouterImpl.swift
//  ConfirmOTP
//
//  Created by MacBook on 26/05/21.
//

import Foundation
import UIKit
import Core

public class ConfirmOTPRouterImpl {
    public static func navigateToModule() {
        let bundle = Bundle(identifier: "com.casestudy.ConfirmOTP")
        let vc = ConfirmOTPViewController(nibName: "ConfirmOTPViewController", bundle: bundle)
        
        let networkManager = AuthNetworkManagerImpl()

        let router = ConfirmOTPRouterImpl()
        let interactor = ConfirmOTPInteractorImpl(authNetworkManager: networkManager)
        let presenter = ConfirmOTPPresenterImpl(view: vc, interactor: interactor, router: router)

        interactor.interactorOutput = presenter

        vc.presenter = presenter
        
        // parsing data email to OTP
        let emailDefault: String? = UserDefaultHelper.shared.get(key: .userEmail)
        vc.email = emailDefault ?? ""
        
        let navController = UINavigationController(rootViewController: vc)
        navController.setNavigationBarHidden(true, animated: false)
        
        UIApplication.shared.windows.first?.rootViewController = navController
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
}

extension ConfirmOTPRouterImpl: ConfirmOTPRouter {
    func navigateToLogin() {
        AppRouter.shared.navigateToLogin()
    }
}
