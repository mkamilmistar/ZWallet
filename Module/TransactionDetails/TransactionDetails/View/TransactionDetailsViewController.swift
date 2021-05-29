//
//  TransactionDetailsViewController.swift
//  TransactionDetails
//
//  Created by MacBook on 28/05/21.
//

import UIKit
import Core
import Kingfisher

class TransactionDetailsViewController: UIViewController {
    @IBOutlet var imageStatus: UIImageView!
    @IBOutlet var titleTransferStatus: UILabel!
    @IBOutlet var amountLabel: UILabel!
    @IBOutlet var notesLabel: UILabel!
    @IBOutlet var button: UIButton!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var messageLabel: UILabel!
    @IBOutlet var receiverLabel: UILabel!
    @IBOutlet var phoneLabel: UILabel!
    @IBOutlet var photoReceiver: UIImageView!
    
    
    @IBOutlet var amountBG: UIView!
    @IBOutlet var balanceBG: UIView!
    @IBOutlet var dateBG: UIView!
    @IBOutlet var receiverBG: UIView!
    @IBOutlet var noteBG: UIView!
    
    var presenter: TransactionDetailsPresenter?
    var isSuccess: Bool = false
    var passingData: ReceiverEntity = ReceiverEntity(id: 0, name: "", phone: "", image: "")
    var amount: Int = 0
    var notes = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewStatus()
        
        let dateNow: String  = "MMM dd, yyyy - HH:mm"
        let url: String = passingData.image

        self.dateLabel.text = dateNow.dateFormat()
        amountLabel.text = amount.formatToIdr()
        notesLabel.text = notes
        photoReceiver.kf.setImage(with: URL(string: url))
        
        self.receiverLabel.text = passingData.name
        self.phoneLabel.text = passingData.phone
        
        setupBackgroundView()
    }

    @IBAction func backToHomeAction(_ sender: Any) {
        if isSuccess {
            self.presenter?.navigateToHome()
        } else {
            AppRouter.shared.navigateToConfirmationTransaction(self, passingData, amount, notes)
        }
    }
    
    func viewStatus() {
        if isSuccess {
            imageStatus.image = UIImage(named: "success", in: Bundle(identifier: "com.casestudy.Core"), compatibleWith: nil)
            titleTransferStatus.text = "Transfer Success"
            messageLabel.isHidden = true
            button.setTitle("Back To Home", for: .normal)
        } else {
            imageStatus.image = UIImage(named: "failed", in: Bundle(identifier: "com.casestudy.Core"), compatibleWith: nil)
            titleTransferStatus.text = "Transfer Failed"
            messageLabel.isHidden = false

            button.setTitle("Try Again", for: .normal)
        }
    }
    
    func setupBackgroundView() {
//        receiverBG.setShadow(color: UIColor.blue.cgColor, opacity: 0.1)
        amountBG.setShadow(color: UIColor.blue.cgColor, opacity: 0.1)
        balanceBG.setShadow(color: UIColor.blue.cgColor, opacity: 0.1)
        dateBG.setShadow(color: UIColor.blue.cgColor, opacity: 0.1)
        receiverBG.setShadow(color: UIColor.blue.cgColor, opacity: 0.1)
        noteBG.setShadow(color: UIColor.blue.cgColor, opacity: 0.1)
    }
}

extension TransactionDetailsViewController: TransactionDetailsView {
    
}
