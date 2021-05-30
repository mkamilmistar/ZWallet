//
//  TransactionDetailViewController.swift
//  TransactionDetail
//
//  Created by MacBook on 27/05/21.
//

import UIKit
import Core
import Kingfisher
import NVActivityIndicatorView

class TransactionConfirmationViewController: UIViewController {

    @IBOutlet var loadingView: NVActivityIndicatorView!
    @IBOutlet var nameReceiver: UILabel!
    @IBOutlet var phoneReceiver: UILabel!
    @IBOutlet var imagesReceiver: UIImageView!
    @IBOutlet var amountLabel: UILabel!
    @IBOutlet var balanceLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var notesLabel: UILabel!
    
    @IBOutlet var receiverBG: UIView!
    @IBOutlet var amountBG: UIView!
    @IBOutlet var balanceBG: UIView!
    @IBOutlet var dateBG: UIView!
    @IBOutlet var notesBG: UIView!
    @IBOutlet var backIcon: UIImageView!
    
    var presenter: TransactionConfirmationPresenter?
    var passDataReceiver: ReceiverEntity = ReceiverEntity(id: 0, name: "", phone: "", image: "")
    var amount: Int = 0
    var notes: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupBackgroundView()
        self.setupDataView()
        self.presenter?.getUserBalance()
        self.loadingView.color = #colorLiteral(red: 0.4625302553, green: 0.5670406818, blue: 0.9667261243, alpha: 1)
        self.loadingView.type = .ballRotateChase
        self.loadingView.startAnimating()
    }
    
    @IBAction func backTapAction(_ sender: UITapGestureRecognizer) {
        self.presenter?.backToTransaction(viewController: self)
    }
    
    @IBAction func continueAction(_ sender: UIButton) {
        self.presenter?.navigateToCheckPIN(viewController: self, passDataTransaction: passDataReceiver, amount: amount, notes: notes)
    }
    
    func setupDataView() {
        self.backIcon.image = UIImage(named: "arrow-left", in: Bundle(identifier: "com.casestudy.Core"), compatibleWith: nil)
        
        self.nameReceiver.text = passDataReceiver.name
        self.phoneReceiver.text = passDataReceiver.phone
        self.amountLabel.text = amount.formatToIdr()
        self.notesLabel.text = notes
        
        let url = URL(string: passDataReceiver.image)
        self.imagesReceiver.kf.setImage(with: url)
        
        let dateNow: String  = "MMM dd, yyyy - HH.mm"
        
        self.dateLabel.text = dateNow.dateFormat()
    }
    
    func setupBackgroundView() {
        receiverBG.setShadow(color: UIColor.blue.cgColor, opacity: 0.1)
        amountBG.setShadow(color: UIColor.blue.cgColor, opacity: 0.1)
        balanceBG.setShadow(color: UIColor.blue.cgColor, opacity: 0.1)
        dateBG.setShadow(color: UIColor.blue.cgColor, opacity: 0.1)
        notesBG.setShadow(color: UIColor.blue.cgColor, opacity: 0.1)
    }

}

extension TransactionConfirmationViewController: TransactionConfirmationView {
    func getDataBalance(balance: Int) {
        DispatchQueue.main.async {
            self.balanceLabel.text = balance.formatToIdr()
            self.loadingView.stopAnimating()
        }
    }
}
