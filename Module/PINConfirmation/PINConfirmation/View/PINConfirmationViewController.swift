//
//  PINConfirmationViewController.swift
//  PINConfirmation
//
//  Created by MacBook on 27/05/21.
//

import UIKit
import Core

class PINConfirmationViewController: UIViewController {

    @IBOutlet var backIcon: UIImageView!
    
    var presenter: PINConfirmationPresenter?
    var passDataReceiver: ReceiverEntity = ReceiverEntity(id: 0, name: "", phone: "", image: "")
    var amount: Int = 0
    var notes: String = ""
    
    @IBOutlet var pinField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.backIcon.image = UIImage(named: "arrow-left", in: Bundle(identifier: "com.casestudy.Core"), compatibleWith: nil)
    }

    @IBAction func backAction(_ sender: UITapGestureRecognizer) {
        self.presenter?.backNavigation(viewController: self)
    }
    
    @IBAction func confirmTransactionAction(_ sender: UIButton) {
        let pin = pinField.text ?? ""
        
        self.presenter?.createTransaction(pin: pin, receiver: passDataReceiver.id, amount: amount, notes: notes)
    }
    
}

extension PINConfirmationViewController: PINConfirmationView {
    func showSuccess() {
        self.presenter?.navigateToTransactionDetails(viewController: self)
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
