//
//  TransactionDetailsViewController.swift
//  TransactionDetails
//
//  Created by MacBook on 28/05/21.
//

import UIKit

class TransactionDetailsViewController: UIViewController {
    @IBOutlet var imageStatus: UIImageView!
    
    var presenter: TransactionDetailsPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageStatus.image = UIImage(named: "success", in: Bundle(identifier: "com.casestudy.Core"), compatibleWith: nil)
    }



    @IBAction func backToHomeAction(_ sender: Any) {
        self.presenter?.navigateToHome()
    }
}

extension TransactionDetailsViewController: TransactionDetailsView {
    func showError() {
        print("error")
    }
}
