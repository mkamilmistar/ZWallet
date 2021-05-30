//
//  TransactionViewController.swift
//  Transaction
//
//  Created by MacBook on 27/05/21.
//

import UIKit
import Core
import Kingfisher
import NVActivityIndicatorView

public class TransactionViewController: UIViewController {
    
    var presenter: TransactionPresenter?
    var balance: Int = 0
    
    @IBOutlet var loadingView: NVActivityIndicatorView!
    @IBOutlet var amountField: UITextField!
    @IBOutlet var notesField: UITextField!
    @IBOutlet var notesIcon: UIImageView!
    
    @IBOutlet var imageReceiver: UIImageView!
    @IBOutlet var nameReceiver: UILabel!
    @IBOutlet var phoneReceiver: UILabel!
      
    @IBOutlet var background: UIView!
    @IBOutlet var receiverBG: UIView!
    @IBOutlet var userBalanceLabel: UILabel!
    @IBOutlet var backIcon: UIImageView!
    @IBOutlet var continueButton: UIButton!
    
    public var passDataReceiver: ReceiverEntity = ReceiverEntity(id: 0, name: "", phone: "", image: "")
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupViewData()
        
        self.presenter?.getUserBalance()
        self.loadingView.color = #colorLiteral(red: 0.4625302553, green: 0.5670406818, blue: 0.9667261243, alpha: 1)
        self.loadingView.type = .ballRotateChase
        self.loadingView.startAnimating()
        self.backIcon.image = UIImage(named: "arrow-left", in: Bundle(identifier: "com.casestudy.Core"), compatibleWith: nil)
        
        continueButton.isEnabled = false
        continueButton.backgroundColor = #colorLiteral(red: 0.8549019608, green: 0.8549019608, blue: 0.8549019608, alpha: 1)
        continueButton.setTitleColor(#colorLiteral(red: 0.5333333333, green: 0.5333333333, blue: 0.5607843137, alpha: 1), for: .normal)
        notesField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        amountField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if amountField.text?.isEmpty ?? false || notesField.text?.isEmpty ?? false {
            continueButton.isEnabled = false
            continueButton.backgroundColor = #colorLiteral(red: 0.8549019608, green: 0.8549019608, blue: 0.8549019608, alpha: 1)
            continueButton.setTitleColor(#colorLiteral(red: 0.5333333333, green: 0.5333333333, blue: 0.5607843137, alpha: 1), for: .normal)
        } else {
            continueButton.isEnabled = true
            continueButton.backgroundColor = #colorLiteral(red: 0.4625302553, green: 0.5670406818, blue: 0.9667261243, alpha: 1)
            continueButton.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        }
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
        DispatchQueue.main.async {
            self.userBalanceLabel.text = "\(balance.formatToIdr()) Available"
            self.loadingView.stopAnimating()
        }
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
