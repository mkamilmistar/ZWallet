//
//  LoginPresenterImpl.swift
//  Login
//
//  Created by MacBook on 24/05/21.
//

import Foundation
import UIKit

public class LoginPresenterImpl: LoginPresenter {
    let view: LoginView
    let interactor: LoginInteractor
    let router: LoginRouter
    
    init(view: LoginView, interactor: LoginInteractor, router: LoginRouter){
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
    func getPinStatus(hasPin: Bool) {
        if hasPin {
            self.router.navigateToHome()
        } else {
            self.router.navigateToPinActiovation()
        }
    }
    
    func authenticationResult(isSuccess: Bool) {
        if isSuccess {
            self.router.navigateToHome()
        } else {
            self.view.showError()
        }
    }
}
