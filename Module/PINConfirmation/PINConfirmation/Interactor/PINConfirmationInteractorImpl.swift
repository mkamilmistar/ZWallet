//
//  PINConfirmationInteractorImpl.swift
//  PINConfirmation
//
//  Created by MacBook on 27/05/21.
//

import Foundation
import Core

class PINConfirmationInteractorImpl: PINConfirmationInteractor {
    
    var interactorOutput: PINConfirmationInteractorOutput?
    let authNetworkManager: AuthNetworkManager
    
    init(authNetworkManager: AuthNetworkManager) {
        self.authNetworkManager = authNetworkManager
    }
    
    func postPin(pin: String) {
        self.authNetworkManager.pinCheck(pin: pin) { (data, error) in
            if data?.status == 200 {
                self.interactorOutput?.getPinCheckResult(isSuccess: true)
            } else {
                self.interactorOutput?.getPinCheckResult(isSuccess: false)
            }
        }
    }
}
