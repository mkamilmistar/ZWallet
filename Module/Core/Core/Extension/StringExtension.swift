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
}


public let dateNow: String  = "dd MMM yyyy"
public let hourNow: String = "HH:mm"
