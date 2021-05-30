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
    var currentString: String = ""
    
    public var passDataReceiver: ReceiverEntity = ReceiverEntity(id: 0, name: "", phone: "", image: "")
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupViewData()
        
        self.presenter?.getUserBalance()
        self.loadingView.color = #colorLiteral(red: 0.4625302553, green: 0.5670406818, blue: 0.9667261243, alpha: 1)
        self.loadingView.type = .ballRotateChase
        self.loadingView.startAnimating()
        self.backIcon.image = UIImage(named: "arrow-left", in: Bundle(identifier: "com.casestudy.Core"), compatibleWith: nil)
        
        disabledMainButton(continueButton)
        notesField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        amountField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        amountField.delegate = self
    }
    
    func setupViewData() {
        self.background.backgroundColor = UIColor(red: 250/255, green: 252/255, blue: 255/255, alpha: 1)
        self.receiverBG.setShadow(color: UIColor.black.cgColor, opacity: 0.2)
        self.notesIcon.image = UIImage(named: "notes", in: Bundle(identifier: "com.casestudy.Core"), compatibleWith: nil)
        self.imageReceiver.kf.setImage(with: URL(string: passDataReceiver.image))
        self.nameReceiver.text = passDataReceiver.name
        self.phoneReceiver.text = passDataReceiver.phone
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if amountField.text?.isEmpty ?? false || notesField.text?.isEmpty ?? false {
            disabledMainButton(continueButton)
        } else {
           enabledMainButton(continueButton)
        }
    }

    @IBAction func backAction(_ sender: UITapGestureRecognizer) {
        self.presenter?.backToReceiver(viewController: self)
    }
    
    @IBAction func transactionAction(_ sender: Any) {
        let amount: Int = (amountField.text)?.setStringToInt ?? 0
        let notes = notesField.text ?? ""

        self.presenter?.navigateToDetailTransaction(viewController: self, passDataTransaction: passDataReceiver, amount: amount, notes: notes)
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

extension TransactionViewController: UITextFieldDelegate {
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        switch string {
        case "0", "1", "2", "3", "4", "5", "6", "7", "8", "9":
            currentString += string
            formatCurrency(string: currentString)
        default:
            let array = Array(string)
            var currentStringArray = Array(currentString)
            if array.count == 0 && currentStringArray.count != 0 {
                currentStringArray.removeLast()
                currentString = ""
                for character in currentStringArray {
                    currentString += String(character)
                }
                formatCurrency(string: currentString)
            }
        }
        return false
    }
    
    func formatCurrency(string: String) {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "id_ID")
        let numberFromField = (NSString(string: currentString).doubleValue)
        amountField.text = formatter.string(from: NSNumber(value: numberFromField))
    }
}
