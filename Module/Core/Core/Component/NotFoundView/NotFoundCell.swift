//
//  NotFoundCell.swift
//  Core
//
//  Created by MacBook on 31/05/21.
//

import UIKit

public class NotFoundCell: UITableViewCell {

    @IBOutlet var nofFoundBG: UIView!
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        
        nofFoundBG.setShadow(color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), opacity: 0.1)
    }
}
