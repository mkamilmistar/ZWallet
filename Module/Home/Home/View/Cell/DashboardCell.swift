//
//  DashboardCell.swift
//  Home
//
//  Created by MacBook on 24/05/21.
//

import UIKit
import Kingfisher

class DashboardCell: UITableViewCell {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var balanceLabel: UILabel!
    @IBOutlet var phoneNumberLabel: UILabel!
    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var topUpButton: UIButton!
    @IBOutlet var transferButton: UIButton!
    @IBOutlet var notificationBtn: UIButton!
    
    var delegate: DashboardCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func showData(userProfile: UserProfileEntity) {
        self.nameLabel.text = userProfile.name
        self.balanceLabel.text = userProfile.balance.formatToIdr()
        self.phoneNumberLabel.text = userProfile.phoneNumber
        
        let url = URL(string: userProfile.imageUrl)
        self.profileImage.kf.setImage(with: url)
        
        let topUpIcon = UIImage(named: "plus", in: Bundle(identifier: "com.casestudy.Core"), compatibleWith: nil)
        let transferIcon = UIImage(named: "arrow-up (1)", in: Bundle(identifier: "com.casestudy.Core"), compatibleWith: nil)
        let notifBtn = UIImage(named: "bell-1", in: Bundle(identifier: "com.casestudy.Core"), compatibleWith: nil)
        
        self.topUpButton.setImage(topUpIcon, for: .normal)
        self.transferButton.setImage(transferIcon, for: .normal)
        self.notificationBtn.setImage(notifBtn, for: .normal)
    }
    
    @IBAction func showTransactionAction(_ sender: Any) {
        self.delegate?.showAllTransaction()
    }
    
    @IBAction func transferAction(_ sender: UIButton) {
        self.delegate?.showAllReceiver()
    }
    
    @IBAction func logoutAction(_ sender: Any) {
        self.delegate?.logout()
    }
    
}
