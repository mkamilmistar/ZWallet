//
//  RegisterRouter.swift
//  Register
//
//  Created by MacBook on 26/05/21.
//

import Foundation
import UIKit

protocol RegisterRouter {
//    func navigateToLogin()
    func backToLogin(viewController: UIViewController)
    func navigateToPINConfirmation()
}
