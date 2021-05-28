//
//  TransactionDetailViewController.swift
//  TransactionDetail
//
//  Created by MacBook on 27/05/21.
//

import UIKit
import Core
import Kingfisher

class TransactionConfirmationViewController: UIViewController {

    @IBOutlet var nameReceiver: UILabel!
    @IBOutlet var phoneReceiver: UILabel!
    @IBOutlet var imagesReceiver: UIImageView!
    @IBOutlet var amountLabel: UILabel!
    @IBOutlet var balanceLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var notesLabel: UILabel!
    
    @IBOutlet var receiverBG: UIView!
    @IBOutlet var amountBG: UIView!
    @IBOutlet var balanceBG: UIView!
    @IBOutlet var dateBG: UIView!
    @IBOutlet var timeBG: UIView!
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
        self.amountLabel.text = String(amount)
        self.notesLabel.text = notes
        
        let url = URL(string: passDataReceiver.image)
        self.imagesReceiver.kf.setImage(with: url)
        
        let dateNow: String  = "dd MMM yyyy"
        let hourNow: String = "HH:mm"
        
        self.dateLabel.text = dateNow.dateFormat()
        self.timeLabel.text = hourNow.dateFormat()
    }
    
    func setupBackgroundView() {
        receiverBG.setShadow(color: UIColor.blue.cgColor, opacity: 0.1)
        amountBG.setShadow(color: UIColor.blue.cgColor, opacity: 0.1)
        balanceBG.setShadow(color: UIColor.blue.cgColor, opacity: 0.1)
        dateBG.setShadow(color: UIColor.blue.cgColor, opacity: 0.1)
        timeBG.setShadow(color: UIColor.blue.cgColor, opacity: 0.1)
        notesBG.setShadow(color: UIColor.blue.cgColor, opacity: 0.1)
    }

}

extension TransactionConfirmationViewController: TransactionConfirmationView {
    
}
