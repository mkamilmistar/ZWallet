//
//  TransactionCell.swift
//  Core
//
//  Created by MacBook on 24/05/21.
//

import UIKit
import Kingfisher

public class TransactionCell: UITableViewCell {

    @IBOutlet var userImage: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var noteLabel: UILabel!
    @IBOutlet var amountLabel: UILabel!
    @IBOutlet var backgroundCell: UIView!
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backgroundCell.layer.cornerRadius = 10
        backgroundCell.layer.shadowColor = UIColor.black.cgColor
        backgroundCell.layer.shadowOpacity = 0.1
        backgroundCell.layer.shadowOffset = CGSize(width: 0, height: 1)
    }
    
    public func showData(transaction: TransactionEntity) {
        self.nameLabel.text = transaction.name
        self.noteLabel.text = transaction.notes
        
        
        if transaction.type == "in" {
            self.amountLabel.text = "+\(transaction.amount.formatToIdr())"
            self.amountLabel.textColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        } else {
            self.amountLabel.text = "-\(transaction.amount.formatToIdr())"
            self.amountLabel.textColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        }
        
        let url = URL(string: transaction.imageUrl)
        self.userImage.kf.setImage(with: url)
    }

}
