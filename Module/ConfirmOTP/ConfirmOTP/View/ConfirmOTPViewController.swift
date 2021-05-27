//
//  ConfirmOTPViewController.swift
//  ConfirmOTP
//
//  Created by MacBook on 26/05/21.
//

import UIKit
import Core

class ConfirmOTPViewController: UIViewController {

    @IBOutlet var OtpField: UITextField!
    @IBOutlet var otpView: UIView!
    
    var presenter: ConfirmOTPPresenter?
    var email: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        otpView.setShadow(color: UIColor.black.cgColor, opacity: 0.1)
    }
    
    @IBAction func confirmAction(_ sender: UIButton) {
        let otp = OtpField.text!

        self.presenter?.confirmOTP(email: email, otp: otp)
    }
}

extension ConfirmOTPViewController: ConfirmOTPView {
    func showError() {
        let alert = UIAlertController(
            title: "Peringatan",
            message: "Kode OTP salah, coba lagi",
            preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
