//
//  IntExtension.swift
//  Core
//
//  Created by MacBook on 24/05/21.
//

import Foundation

public extension Int {
    func formatToIdr() -> String {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "id_ID")
        formatter.groupingSeparator = "."
        formatter.numberStyle = .decimal
        
        if let formattedAmount = formatter.string(from: self as NSNumber) {
            return "Rp\(formattedAmount)"
        } else {
            return "Rp\(self)"
        }
    }
}
