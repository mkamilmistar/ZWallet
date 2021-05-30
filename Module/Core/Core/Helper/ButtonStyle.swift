//
//  ButtonStyle.swift
//  Core
//
//  Created by MacBook on 31/05/21.
//

import Foundation
import UIKit

public func enabledMainButton(_ button: UIButton) {
    button.layer.cornerRadius = 12
    button.isUserInteractionEnabled = true
    button.isEnabled = true
    button.backgroundColor = #colorLiteral(red: 0.3882352941, green: 0.4745098039, blue: 0.9568627451, alpha: 1)
    button.setTitleColor(.white, for: .normal)
}

public func disabledMainButton(_ button: UIButton) {
    button.layer.cornerRadius = 12
    button.isUserInteractionEnabled = false
    button.isEnabled = false
    button.backgroundColor = #colorLiteral(red: 0.8549019608, green: 0.8549019608, blue: 0.8549019608, alpha: 1)
    button.setTitleColor(#colorLiteral(red: 0.5333333333, green: 0.5333333333, blue: 0.5607843137, alpha: 1), for: .normal)
}
