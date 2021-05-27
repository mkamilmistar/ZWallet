//
//  RegisterRouter.swift
//  Register
//
//  Created by MacBook on 26/05/21.
//

import Foundation
import UIKit

protocol RegisterRouter {
    func navigateToConfirmOTP(email: String, viewController: UIViewController)
    func backNavigation(viewController: UIViewController)
}
