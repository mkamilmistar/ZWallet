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
    
    init(authNetworkManager: AuthNetworkManager) {
        self.authNetworkManager = authNetworkManager
    }
    
    public func postLoginData(email: String, password: String) {
        // Hit API login with sending email and password
        self.authNetworkManager.login(email: email, password: password) { data, error in
            if let loginData = data?.data {
                print("data true \(loginData)")
                // save user token to Userdefault
                UserDefaultHelper.shared.set(key: .userToken, value: loginData.token)
                UserDefaultHelper.shared.set(key: .refreshToken, value: loginData.refreshToken)
                UserDefaultHelper.shared.set(key: .userEmail, value: loginData.email)
                
                // set refresh token expired
                let tokenExpired: Date = Calendar.current.date(byAdding: .second, value: loginData.expiredIn, to: Date()) ?? Date()
                UserDefaultHelper.shared.set(key: .userTokenExpired, value: tokenExpired)
                
                // tell the presenter if process is success
                self.interactorOutput?.authenticationResult(isSuccess: true)
                
                // get status PIN
                if loginData.hasPin == true {
                    self.interactorOutput?.getPinStatus(hasPin: true)
                } else {
                    self.interactorOutput?.getPinStatus(hasPin: false)
                }
                
                UserDefaultHelper.shared.set(key: .pinStatus, value: loginData.hasPin)
                UserDefaultHelper.shared.set(key: .loginStatus, value: data?.status)
            } else {
                print("data false")

                // tell the presenter if process is failed
                self.interactorOutput?.authenticationResult(isSuccess: false)
            }
        }
    }
    
}
