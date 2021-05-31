//
//  AppConstant.swift
//  Core
//
//  Created by MacBook on 24/05/21.
//

import Foundation

public class AppConstant {
    public static var baseUrl: String {
        return Bundle.main.infoDictionary?["BASE_URL"] as? String ?? ""
    }
}
