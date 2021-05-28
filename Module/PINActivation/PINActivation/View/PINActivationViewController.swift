//
//  PINActivationViewController.swift
//  PINActivation
//
//  Created by MacBook on 26/05/21.
//

import UIKit
import Core
import OTPFieldView

class PINActivationViewController: UIViewController {


    @IBOutlet var pinField: OTPFieldView!
    
    var presenter: PINActivationPresenter?
    var pinValue: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }


    @IBAction func confirmAction(_ sender: UIButton) {
        self.presenter?.activatePin(pin: pinValue)
    }
}

extension PINActivationViewController: PINActivationView {
    func showError() {
        let alert = UIAlertController(
            title: "Peringatan",
            message: "PIN Input tidak sesuai, coba lagi",
            preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

extension PINActivationViewController: OTPFieldViewDelegate {
    func hasEnteredAllOTP(hasEnteredAll hasEntered: Bool) -> Bool {
        return false
    }
    
    func shouldBecomeFirstResponderForOTP(otpTextFieldIndex index: Int) -> Bool {
        return true
    }
    
    func enteredOTP(otp otpString: String) {
        self.pinValue = otpString
    }
    
    func setupOtpView() {
        self.pinField.fieldsCount = 6
        self.pinField.fieldBorderWidth = 1
        self.pinField.defaultBorderColor = #colorLiteral(red: 0.662745098, green: 0.662745098, blue: 0.662745098, alpha: 0.4)
        self.pinField.filledBorderColor = #colorLiteral(red: 0.3882352941, green: 0.4745098039, blue: 0.9568627451, alpha: 1)
//        self.pinField.cursorColor = UIColor.red
        self.pinField.cornerRadius = 10
        self.pinField.displayType = .square
        self.pinField.fieldSize = 47
        self.pinField.separatorSpace = 8
        self.pinField.shouldAllowIntermediateEditing = false
        self.pinField.delegate = self
        self.pinField.initializeUI()
    }
}

