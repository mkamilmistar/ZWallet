//
//  TransactionViewController.swift
//  Transaction
//
//  Created by MacBook on 27/05/21.
//

import UIKit
import Core
import Kingfisher

public class TransactionViewController: UIViewController {
    
    var presenter: TransactionPresenter?
    
    @IBOutlet var amountField: UITextField!
    @IBOutlet var notesField: UITextField!
    @IBOutlet var pinField: UITextField!
    
    @IBOutlet var imageReceiver: UIImageView!
    @IBOutlet var nameReceiver: UILabel!
    @IBOutlet var phoneReceiver: UILabel!
  
    
    var id: Int = 0
    var name: String = ""
    var phone: String = ""
    var image: String = ""
    
    @IBOutlet var background: UIView!
    @IBOutlet var receiverBG: UIView!
    
    public override func viewDidLoad() {
        super.viewDidLoad()

        setupViewData()
    }

    @IBAction func backAction(_ sender: UITapGestureRecognizer) {
        self.presenter?.backToReceiver(viewController: self)
    }
    
    @IBAction func transactionAction(_ sender: Any) {
        let amount: Int = Int(amountField.text ?? "") ?? 0
        let notes = notesField.text ?? ""
        let pin = pinField.text ?? ""
        
        self.presenter?.createTransaction(pin: pin, receiver: id, amount: amount, notes: notes)
    }
    
    func setupViewData() {
        self.nameReceiver.text = name
        self.background.backgroundColor = UIColor(red: 250/255, green: 252/255, blue: 255/255, alpha: 1)
        self.receiverBG.setShadow(color: UIColor.black.cgColor, opacity: 0.2)
        
        self.imageReceiver.kf.setImage(with: URL(string: image))
        self.nameReceiver.text = name
        self.phoneReceiver.text = phone
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
