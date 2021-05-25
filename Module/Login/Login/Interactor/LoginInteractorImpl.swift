//
//  LoginInteractorImpl.swift
//  Login
//
//  Created by MacBook on 24/05/21.
//

import Foundation
import Core

public class LoginInteractorImpl: LoginInteractor {
   
    var interactorOutput: LoginInteractorOutput?
    let authNetworkManager: AuthNetworkManager
    
    init(networkManager: AuthNetworkManager) {
        self.authNetworkManager = networkManager
    }
    
    func postLoginData(email: String, password: String) {
        // Hit API login with sending email and password
        self.authNetworkManager.login(email: email, password: password) { data, error in
            if let loginData = data {
                // save user token to Userdefault
                UserDefaultHelper.shared.set(key: .userToken, value: loginData.token)
                // tell the presenter if process is success
                self.interactorOutput?.authenticationResult(isSuccess: true)
            } else {
                // tell the presentel iff process is failed
                self.interactorOutput?.authenticationResult(isSuccess: false)
            }
        }
    }
    
}
