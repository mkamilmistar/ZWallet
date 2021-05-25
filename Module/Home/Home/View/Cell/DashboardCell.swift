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
    }
    
    @IBAction func showTransactionAction(_ sender: Any) {
        self.delegate?.showAllTransaction()
    }
    
    @IBAction func logoutAction(_ sender: Any) {
        self.delegate?.logout()
    }
    
}
