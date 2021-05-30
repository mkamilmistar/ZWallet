//
//  PINSuccessViewController.swift
//  PINSuccess
//
//  Created by MacBook on 30/05/21.
//

import UIKit

class PINSuccessViewController: UIViewController {

    var presenter: PINSuccessPresenter?
    @IBOutlet var successImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.successImage.image = UIImage(named: "success", in: Bundle(identifier: "com.casestudy.Core"), compatibleWith: nil)
    }

    @IBAction func goHomeAction(_ sender: UIButton) {
        self.presenter?.navigateToHome()
    }
}
