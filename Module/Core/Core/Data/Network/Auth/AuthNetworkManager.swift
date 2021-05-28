//
//  AuthNetworkManager.swift
//  Core
//
//  Created by MacBook on 24/05/21.
//

import Foundation

public protocol AuthNetworkManager {
    func login(email: String, password: String, completion: @escaping (LoginResponse?, Error?) -> ())
    func register(username: String, email: String, password: String,
                  completion: @escaping (RegisterResponse?, Error?) -> ())
    func refreshToken(email: String, refreshToken: String, completion: @escaping (RefreshTokenDataResponse?, Error?) -> ())
    func pinActivate(pin: String, completion: @escaping (PINConfirmationResponse?, Error?) -> ())
    func otpConfirm(email: String, otp: String, completion: @escaping (OTPConfirmationResponse?, Error?) -> ())
    func pinCheck(pin: String, completion: @escaping (CommonResponse?, Error?) -> ())
}
