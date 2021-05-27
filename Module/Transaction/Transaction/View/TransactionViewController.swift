//
//  TransactionViewController.swift
//  Transaction
//
//  Created by MacBook on 27/05/21.
//

import UIKit
import Core

public class TransactionViewController: UIViewController {
    
    var presenter: TransactionPresenter?
    
    @IBOutlet var receiverField: UITextField!
    @IBOutlet var amountField: UITextField!
    @IBOutlet var notesField: UITextField!
    
    public override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func backAction(_ sender: UITapGestureRecognizer) {
        print("Tapp")
        self.presenter?.backToReceiver(viewController: self)
    }
    
    @IBAction func transactionAction(_ sender: Any) {
        let receiver: Int = Int(receiverField.text ?? "") ?? 0
        let amount: Int = Int(amountField.text ?? "") ?? 0
        let notes = notesField.text ?? ""
        
        self.presenter?.createTransaction(receiver: receiver, amount: amount, notes: notes)
    }
    
}

extension TransactionViewController: TransactionView {
    func showError() {
        let alert = UIAlertController(
            title: "Peringatan",
            message: "Transaksi Gagal!",
            preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
