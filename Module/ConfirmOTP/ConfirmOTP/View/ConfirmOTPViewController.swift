//
//  ConfirmOTPViewController.swift
//  ConfirmOTP
//
//  Created by MacBook on 26/05/21.
//

import UIKit
import Core
import OTPFieldView

class ConfirmOTPViewController: UIViewController {

    @IBOutlet var confirmBtn: UIButton!
    @IBOutlet var otpField: OTPFieldView!
    @IBOutlet var otpView: UIView!
    
    var presenter: ConfirmOTPPresenter?
    var email: String = ""
    var otpValue: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        otpView.setShadow(color: UIColor.black.cgColor, opacity: 0.1)
        self.otpField.delegate = self
        setupOtpView()
        
        confirmBtn.isEnabled = false
        confirmBtn.backgroundColor = #colorLiteral(red: 0.8549019608, green: 0.8549019608, blue: 0.8549019608, alpha: 1)
        confirmBtn.setTitleColor(#colorLiteral(red: 0.5333333333, green: 0.5333333333, blue: 0.5607843137, alpha: 1), for: .normal)
    }
    
    @IBAction func confirmAction(_ sender: UIButton) {
        self.presenter?.confirmOTP(email: email, otp: otpValue)
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

extension ConfirmOTPViewController: OTPFieldViewDelegate {
    func hasEnteredAllOTP(hasEnteredAll hasEntered: Bool) -> Bool {
        if hasEntered == true {
            confirmBtn.isEnabled = true
            confirmBtn.backgroundColor = #colorLiteral(red: 0.4625302553, green: 0.5670406818, blue: 0.9667261243, alpha: 1)
            confirmBtn.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        } else {
            confirmBtn.isEnabled = false
            confirmBtn.backgroundColor = #colorLiteral(red: 0.8549019608, green: 0.8549019608, blue: 0.8549019608, alpha: 1)
            confirmBtn.setTitleColor(#colorLiteral(red: 0.5333333333, green: 0.5333333333, blue: 0.5607843137, alpha: 1), for: .normal)
        }
        return false
    }
    
    func shouldBecomeFirstResponderForOTP(otpTextFieldIndex index: Int) -> Bool {
        return true
    }
    
    func enteredOTP(otp otpString: String) {
        self.otpValue = otpString
    }
    
    func setupOtpView() {
        self.otpField.fieldsCount = 6
        self.otpField.fieldBorderWidth = 1
        self.otpField.defaultBorderColor = #colorLiteral(red: 0.662745098, green: 0.662745098, blue: 0.662745098, alpha: 0.4)
        self.otpField.filledBorderColor = #colorLiteral(red: 0.3882352941, green: 0.4745098039, blue: 0.9568627451, alpha: 1)
//        self.otpField.cursorColor = UIColor.red
        self.otpField.cornerRadius = 10
        self.otpField.displayType = .square
        self.otpField.fieldSize = 47
        self.otpField.separatorSpace = 8
        self.otpField.shouldAllowIntermediateEditing = false
        self.otpField.delegate = self
        self.otpField.initializeUI()
    }
}
