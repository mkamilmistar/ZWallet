//
//  LoginPresenterImpl.swift
//  Login
//
//  Created by MacBook on 24/05/21.
//

import Foundation
import UIKit
import Core

public class LoginPresenterImpl: LoginPresenter {
    let view: LoginView
    let interactor: LoginInteractor
    let router: LoginRouter
    
    init(view: LoginView, interactor: LoginInteractor, router: LoginRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func login(email: String, password: String) {
        self.interactor.postLoginData(email: email, password: password)
    }
    
    func showRegister(viewController: UIViewController) {
        self.router.navigateToRegister(viewController: viewController)
    }
}

extension LoginPresenterImpl: LoginInteractorOutput {
    func authenticationResult(isSuccess: Bool, isActivate: Bool, isSetPin: Bool) {
        print(isSuccess,isActivate,isSetPin)
        if isSuccess && isActivate && isSetPin {
            self.router.navigateToHome()
        } else if isSuccess && isActivate && !isSetPin {
            self.router.navigateToPinActiovation()
        } else if isSuccess && !isActivate && !isSetPin {
            self.router.navigateToOTP()
        } else {
            self.view.showError()
        }
    }
}
