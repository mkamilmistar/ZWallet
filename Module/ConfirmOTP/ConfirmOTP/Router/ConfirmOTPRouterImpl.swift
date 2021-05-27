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
    public static func navigateToModule(email: String, viewController: UIViewController) {
        let bundle = Bundle(identifier: "com.casestudy.ConfirmOTP")
        let vc = ConfirmOTPViewController(nibName: "ConfirmOTPViewController", bundle: bundle)
        
        let networkManager = AuthNetworkManagerImpl()

        let router = ConfirmOTPRouterImpl()
        let interactor = ConfirmOTPInteractorImpl(authNetworkManager: networkManager)
        let presenter = ConfirmOTPPresenterImpl(view: vc, interactor: interactor, router: router)

        interactor.interactorOutput = presenter

        vc.presenter = presenter
        
        //parsing data email to OTP
        vc.email = email
        
        let navController = UINavigationController(rootViewController: vc)
        navController.setNavigationBarHidden(true, animated: false)
        
        viewController.navigationController?.pushViewController(vc, animated: true)
    }
}

extension ConfirmOTPRouterImpl: ConfirmOTPRouter {
    func navigateToLogin() {
        AppRouter.shared.navigateToLogin()
    }
}
