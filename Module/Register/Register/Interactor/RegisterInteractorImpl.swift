//
//  RegisterInteractorImpl.swift
//  Register
//
//  Created by MacBook on 26/05/21.
//

import Foundation
import Core

class RegisterInteractorImpl: RegisterInteractor {
    var interactorOutput: RegisterInteractorOutput?
    var authManagerNetwork: AuthNetworkManager
    
    init(networkManager: AuthNetworkManager){
        self.authManagerNetwork = networkManager
    }
    
    func postRegisterData(username: String, email: String, password: String) {
        // Hit API
        self.authManagerNetwork.register(username: username, email: email, password: password) { (data, error) in
            if data?.status == 200 {
                UserDefaultHelper.shared.set(key: .userEmail, value: email)
                self.interactorOutput?.registerResult(isSuccess: true)
            } else {
                self.interactorOutput?.registerResult(isSuccess: false)
            }
        }
    }
}
