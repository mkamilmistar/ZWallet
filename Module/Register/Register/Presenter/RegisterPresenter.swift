//
//  RegisterPresenter.swift
//  Register
//
//  Created by MacBook on 26/05/21.
//

import Foundation
import UIKit

protocol RegisterPresenter {
    func register(usernmae: String, email: String, password: String)
    func backNavigation(viewController: UIViewController)
}
