//
//  PINConfirmationViewController.swift
//  PINConfirmation
//
//  Created by MacBook on 27/05/21.
//

import UIKit

class PINConfirmationViewController: UIViewController {

    var presenter: PINConfirmationPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func backAction(_ sender: UITapGestureRecognizer) {
        self.presenter?.backNavigation(viewController: self)
    }
}

extension PINConfirmationViewController: PINConfirmationView {
    func showError() {
        let alert = UIAlertController(
            title: "Peringatan",
            message: "PIN yang anda masukkan salah!, silahkan coba lagi",
            preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
