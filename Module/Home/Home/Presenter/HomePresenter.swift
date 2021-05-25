//
//  HomePresenter.swift
//  Home
//
//  Created by MacBook on 24/05/21.
//

import Foundation
import UIKit

protocol HomePresenter {
    func loadProfile()
    func loadTransaction()
    func showHistory(viewController: UIViewController)
    func logout()
}
