//
//  PINConfirmationViewController.swift
//  PINConfirmation
//
//  Created by MacBook on 27/05/21.
//

import UIKit
import Core
import OTPFieldView
import NVActivityIndicatorView

class PINConfirmationViewController: UIViewController {
   
    @IBOutlet var loadingView: NVActivityIndicatorView!
    @IBOutlet var pinField: OTPFieldView!
    @IBOutlet var backIcon: UIImageView!
    
    var pinValue: String = ""
    var presenter: PINConfirmationPresenter?
    var passDataReceiver: ReceiverEntity = ReceiverEntity(id: 0, name: "", phone: "", image: "")
    var amount: Int = 0
    var notes: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.backIcon.image = UIImage(named: "arrow-left", in: Bundle(identifier: "com.casestudy.Core"), compatibleWith: nil)
        
        self.setupOtpView()
        self.loadingView.color = #colorLiteral(red: 0.4625302553, green: 0.5670406818, blue: 0.9667261243, alpha: 1)
        self.loadingView.type = .ballRotateChase
    }

    @IBAction func backAction(_ sender: UITapGestureRecognizer) {
        self.presenter?.backNavigation(viewController: self)
    }
    
    @IBAction func confirmTransactionAction(_ sender: UIButton) {
        self.loadingView.startAnimating()
        self.presenter?.createTransaction(pin: pinValue, receiver: passDataReceiver.id, amount: amount, notes: notes)
    }
    
}

extension PINConfirmationViewController: PINConfirmationView {
    func showTransactionDetails(isSuccess: Bool) {
        DispatchQueue.main.async {
            self.presenter?.navigateToTransactionDetails(viewController: self, isSuccess: isSuccess, passDataTransaction: self.passDataReceiver, amount: self.amount, notes: self.notes)
            self.loadingView.stopAnimating()
        }
    }
    
    func showError() {
        let alert = UIAlertController(
            title: "Peringatan",
            message: "PIN yang anda masukkan salah!, silahkan coba lagi",
            preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

extension PINConfirmationViewController: OTPFieldViewDelegate {
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
