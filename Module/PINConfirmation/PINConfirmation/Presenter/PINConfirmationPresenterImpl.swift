//
//  PINConfirmationPresenterImpl.swift
//  PINConfirmation
//
//  Created by MacBook on 27/05/21.
//

import Foundation
import UIKit
import Core

class PINConfirmationPresenterImpl: PINConfirmationPresenter {
    let view: PINConfirmationView
    let interactor: PINConfirmationInteractor
    let router: PINConfirmationRouter
    
    init(view: PINConfirmationView, interactor: PINConfirmationInteractor, router: PINConfirmationRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func backNavigation(viewController: UIViewController) {
        self.router.backNavigation(viewController: viewController)
    }
    
    func createTransaction(pin: String, receiver: Int, amount: Int, notes: String) {
        self.interactor.postTransaction(pin: pin, receiver: receiver, amount: amount, notes: notes)
    }
}


extension PINConfirmationPresenterImpl: PINConfirmationInteractorOutput {
    func transactionResult(isSuccess: Bool) {
        if isSuccess {
            AppRouter.shared.navigateToHome()
        } else {
            self.view.showError()
        }
    }
    
}
