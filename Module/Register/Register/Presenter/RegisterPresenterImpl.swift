//
//  RegisterPresenterImpl.swift
//  Register
//
//  Created by MacBook on 26/05/21.
//

import Foundation
import Core
import UIKit

class RegisterPresenterImpl: RegisterPresenter {
    let view: RegisterView
    let interactor: RegisterInteractor
    let router: RegisterRouter
    
    init(view: RegisterView, interactor: RegisterInteractor, router: RegisterRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func register(usernmae: String, email: String, password: String) {
        self.interactor.postRegisterData(username: usernmae, email: email, password: password)
    }
    
    func parsingEmail() {
        self.router.navigateToConfirmOTP()
    }
}

extension RegisterPresenterImpl: RegisterInteractorOutput {
    func registerResult(isSuccess: Bool) {
        if isSuccess {
            self.view.parsingEmail()
        } else {
            self.view.showError()
        }
    }
    
    func backNavigation(viewController: UIViewController) {
        self.router.backNavigation(viewController: viewController)
    }
}
