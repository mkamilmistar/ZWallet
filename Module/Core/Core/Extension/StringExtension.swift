//
//  StringExtension.swift
//  Core
//
//  Created by MacBook on 28/05/21.
//

import Foundation
import UIKit

public extension String {
    func dateFormat() -> String {
        let dateFormatter = DateFormatter()
        let todaysDate = NSDate()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = self
        let date =  dateFormatter.string(from: todaysDate as Date)
        return date
    }
    
    var setStringToInt: Int {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "id_ID")

        if let number = formatter.number(from: self) {
            return number.intValue
        } else {
            return 0
        }
    }
    
    var setStringToDecimal: Decimal {
        if let formatterDecimal: Decimal = Decimal(string: self) {
            return formatterDecimal
        } else {
            return 0.0
        }
    }
}

public let dateNow: String  = "dd MMM yyyy"
public let hourNow: String = "HH.mm"
