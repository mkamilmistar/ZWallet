//
//  HeaderViewCell.swift
//  TopUp
//
//  Created by MacBook on 30/05/21.
//

import UIKit

class HeaderViewCell: UITableViewCell {
    @IBOutlet var headerBG: UIView!
    @IBOutlet var buttonAdd: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.headerBG.setShadow(color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), opacity: 0.1)
        
        let buttonIcon = UIImage(named: "plus", in: Bundle(identifier: "com.casestudy.Core"), compatibleWith: nil)
        buttonAdd.setImage(buttonIcon, for: .normal)
    }

    @IBAction func addButton(_ sender: UIButton) {
        
    }
    
}
