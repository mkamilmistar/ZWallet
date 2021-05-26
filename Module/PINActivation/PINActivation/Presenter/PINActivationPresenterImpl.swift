//
//  PINActivationPresenterImpl.swift
//  PINActivation
//
//  Created by MacBook on 26/05/21.
//

import Foundation
import UIKit

public class PINActivationPresenterImpl: PINActivationPresenter {
    let view: PINActivationView
    let interactor: PINActivationInteractor
    let router: PINActivationRouter
    
    init(view: PINActivationView, interactor: PINActivationInteractor, router: PINActivationRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func activatePin(pin: String) {
        self.interactor.postPinActivation(pin: pin)
    }
}

extension PINActivationPresenterImpl: PINActivationInteractorOutput {
    func pinActivateResult(isSuccess: Bool) {
        if isSuccess {
            self.router.navigateToHome()
        } else {
            self.view.showError()
        }
    }
}
