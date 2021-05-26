//
//  ConfirmOTPInteractorImpl.swift
//  ConfirmOTP
//
//  Created by MacBook on 26/05/21.
//

import Foundation
import Core

public class ConfirmOTPInteractorImpl: ConfirmOTPInteractor {
    
    var interactorOutput: ConfirmOTPInteractorOutput?
    let authNetworkManager: AuthNetworkManager
    
    init(authNetworkManager: AuthNetworkManager) {
        self.authNetworkManager = authNetworkManager
    }
    
    public func postOTPConfirm(email: String, otp: String) {
        self.authNetworkManager.otpConfirm(email: email, otp: otp) { (data, error) in
            if let otpData = data {
                if otpData.status == 200 {
                    self.interactorOutput?.confirmOTPResult(isSuccess: true)
                } else {
                    self.interactorOutput?.confirmOTPResult(isSuccess: false)
                }
            }
        }
    }
}
