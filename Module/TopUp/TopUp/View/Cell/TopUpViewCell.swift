//
//  TopUpViewCell.swift
//  Core
//
//  Created by MacBook on 28/05/21.
//

import UIKit
import Core

public class TopUpViewCell: UITableViewCell {
    @IBOutlet var setBG: UIView!
    @IBOutlet var numberLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        
        setBG.setShadow(color: UIColor.black.cgColor, opacity: 0.1)
    }
    
    public func showDataTopUp(topUpDesc: TopUpEntity) {
        self.numberLabel.text = topUpDesc.id
        self.descriptionLabel.text = topUpDesc.howTopUp
    }
    
}
