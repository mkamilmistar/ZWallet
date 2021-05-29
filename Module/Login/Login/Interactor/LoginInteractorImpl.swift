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
            if data?.status == 200 {
                
                // set refresh token expired
                let tokenExpired: Date = Calendar.current.date(byAdding: .second, value: data?.data.expiredIn ?? 0, to: Date()) ?? Date()
                
                UserDefaultHelper.shared.set(key: .userToken, value: data?.data.token)
                UserDefaultHelper.shared.set(key: .refreshToken, value: data?.data.refreshToken)
                UserDefaultHelper.shared.set(key: .userEmail, value: data?.data.email)
                UserDefaultHelper.shared.set(key: .userTokenExpired, value: tokenExpired)
                
                if data?.data.hasPin == true {
                    UserDefaultHelper.shared.set(key: .pinStatus, value: data?.data.hasPin)
                    UserDefaultHelper.shared.set(key: .loginStatus, value: data?.status)
                    self.interactorOutput?.authenticationResult(isSuccess: true, isActivate: true, isSetPin: true)
                } else {
                    self.interactorOutput?.authenticationResult(isSuccess: true, isActivate: true, isSetPin: false)
                }
                
            } else if data?.status == 404 {
                self.interactorOutput?.authenticationResult(isSuccess: false, isActivate: false, isSetPin: false)
            } else {
                self.interactorOutput?.authenticationResult(isSuccess: true, isActivate: false, isSetPin: false)
            }
        }
    }
    
}
