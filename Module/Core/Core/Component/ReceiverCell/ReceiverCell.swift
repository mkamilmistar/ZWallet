//
//  ReceiverCell.swift
//  Core
//
//  Created by MacBook on 26/05/21.
//

import UIKit
import Kingfisher

public class ReceiverCell: UITableViewCell {

    @IBOutlet var receiverNameLabel: UILabel!
    @IBOutlet var receiverPhoneLabel: UILabel!
    @IBOutlet var receiverPhoto: UIImageView!
    @IBOutlet var backgroundCell: UIView!
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundCell.setShadow(color: UIColor.black.cgColor, opacity: 0.1)
    }
    
    public func showDataReceiver(receiver: ReceiverEntity) {
        self.receiverNameLabel.text = receiver.name
        self.receiverPhoneLabel.text = receiver.phone
        
        let url = URL(string: receiver.image)
        self.receiverPhoto.kf.setImage(with: url)
    }
}
