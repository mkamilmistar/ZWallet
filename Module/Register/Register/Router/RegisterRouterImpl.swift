//
//  RegisterRouterImpl.swift
//  Register
//
//  Created by MacBook on 26/05/21.
//

import Foundation
import UIKit
import Core

public class RegisterRouterImpl {
    
    public static func navigateToModule(viewController: UIViewController) {
        let bundle = Bundle(identifier: "com.casestudy.Register")
        let vc = RegisterViewController(nibName: "RegisterViewController", bundle: bundle)
        
        let networkManager = AuthNetworkManagerImpl()
        
        let router = RegisterRouterImpl()
        let interactor = RegisterInteractorImpl(networkManager: networkManager)
        let presenter = RegisterPresenterImpl(view: vc, interactor: interactor, router: router)

        interactor.interactorOutput = presenter
        
        vc.presenter = presenter

        viewController.navigationController?.pushViewController(vc, animated: false)
    }
}

extension RegisterRouterImpl: RegisterRouter {
    func backToLogin(viewController: UIViewController) {
        viewController.navigationController?.popToRootViewController(animated: false)
    }
    
//    func navigateToLogin() {
//        AppRouter.shared.navigateToLogin()
//    }
    
    func navigateToPINConfirmation() {
        AppRouter.shared.navigateToPINActivation()
    }
}
