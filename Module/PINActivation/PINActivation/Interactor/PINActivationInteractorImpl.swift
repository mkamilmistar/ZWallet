//
//  PINConfirmationInteractorImpl.swift
//  PINActivation
//
//  Created by MacBook on 26/05/21.
//

import Foundation
import Core

public class PINActivationInteractorImpl: PINActivationInteractor {
    
    var interactorOutput: PINActivationInteractorOutput?
    let authNetworkManager: AuthNetworkManager
    
    init(authNetworkManager: AuthNetworkManager) {
        self.authNetworkManager = authNetworkManager
    }
    
    func postPinActivation(pin: String) {
        self.authNetworkManager.pinActivate(pin: pin) { (data, error) in
            if let pinActivateData = data {
                if pinActivateData.status == 200 {
                    self.interactorOutput?.pinActivateResult(isSuccess: true)
                }
            } else {
                self.interactorOutput?.pinActivateResult(isSuccess: false)
            }
        }
    }
}
