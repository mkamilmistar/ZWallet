//
//  PINActivationViewController.swift
//  PINActivation
//
//  Created by MacBook on 26/05/21.
//

import UIKit
import Core

class PINActivationViewController: UIViewController {

    @IBOutlet var pinField: UITextField!
    
    var presenter: PINActivationPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pinField.layer.borderColor = UIColor.mainColor().cgColor
    }


    @IBAction func confirmAction(_ sender: UIButton) {
        let pin = pinField.text!
        print(pin)
        self.presenter?.activatePin(pin: pin)
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
