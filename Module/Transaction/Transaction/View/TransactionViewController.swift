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
    var balance: Int = 0
    
    @IBOutlet var amountField: UITextField!
    @IBOutlet var notesField: UITextField!
    @IBOutlet var notesIcon: UIImageView!
    
    @IBOutlet var imageReceiver: UIImageView!
    @IBOutlet var nameReceiver: UILabel!
    @IBOutlet var phoneReceiver: UILabel!
      
    @IBOutlet var background: UIView!
    @IBOutlet var receiverBG: UIView!
    @IBOutlet var userBalanceLabel: UILabel!
    
    public var passDataReceiver: ReceiverEntity = ReceiverEntity(id: 0, name: "", phone: "", image: "")
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupViewData()
        
        self.presenter?.getUserBalance()
    }

    @IBAction func backAction(_ sender: UITapGestureRecognizer) {
        self.presenter?.backToReceiver(viewController: self)
    }
    
    @IBAction func transactionAction(_ sender: Any) {
        let amount: Int = Int(amountField.text ?? "") ?? 0
        let notes = notesField.text ?? ""

        self.presenter?.navigateToDetailTransaction(viewController: self, passDataTransaction: passDataReceiver, amount: amount, notes: notes)
    }
    
    func setupViewData() {
        self.background.backgroundColor = UIColor(red: 250/255, green: 252/255, blue: 255/255, alpha: 1)
        self.receiverBG.setShadow(color: UIColor.black.cgColor, opacity: 0.2)
        self.notesIcon.image = UIImage(named: "notes", in: Bundle(identifier: "com.casestudy.Core"), compatibleWith: nil)
        self.imageReceiver.kf.setImage(with: URL(string: passDataReceiver.image))
        self.nameReceiver.text = passDataReceiver.name
        self.phoneReceiver.text = passDataReceiver.phone
    }
    
}

extension TransactionViewController: TransactionView {
    func getUserBalance(balance: Int) {
        self.userBalanceLabel.text = "\(balance.formatToIdr()) Available"
    }
    
    func showError() {
        let alert = UIAlertController(
            title: "Peringatan",
            message: "Transaksi Gagal!",
            preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
