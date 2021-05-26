//
//  ConfirmOTPPresenterImpl.swift
//  ConfirmOTP
//
//  Created by MacBook on 26/05/21.
//

import Foundation

public class ConfirmOTPPresenterImpl: ConfirmOTPPresenter {
    
    let view: ConfirmOTPView
    let interactor: ConfirmOTPInteractor
    let router: ConfirmOTPRouter
    
    init(view: ConfirmOTPView, interactor: ConfirmOTPInteractor, router: ConfirmOTPRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    public func confirmOTP(email: String, otp: String) {
        self.interactor.postOTPConfirm(email: email, otp: otp)
    }
}

extension ConfirmOTPPresenterImpl: ConfirmOTPInteractorOutput {
    public func confirmOTPResult(isSuccess: Bool) {
        if isSuccess {
            self.router.navigateToLogin()
        } else {
            self.view.showError()
        }
    }
}
