//
//  LoginInteractor.swift
//  Login
//
//  Created by MacBook on 24/05/21.
//

import Foundation

public protocol LoginInteractor {
    func postLoginData(email: String, password: String)
}
