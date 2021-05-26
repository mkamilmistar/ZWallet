//
//  ConfirmOTPPresenter.swift
//  ConfirmOTP
//
//  Created by MacBook on 26/05/21.
//

import Foundation

public protocol ConfirmOTPPresenter {
    func confirmOTP(email: String, otp: String)
}
