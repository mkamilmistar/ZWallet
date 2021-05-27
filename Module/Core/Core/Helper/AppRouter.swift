//
//  AppRouter.swift
//  Core
//
//  Created by MacBook on 24/05/21.
//

import Foundation
import UIKit

public class AppRouter {
    
    public static let shared: AppRouter = AppRouter()
    
    // AUTH
    
    public var registerScene: ((_ viewController: UIViewController) -> ())? = nil
    
    public func navigateToRegister(_ viewController: UIViewController) {
        self.registerScene?(viewController)
    }
    
    public var confirmOTPScene: ((_ email: String, _ viewController: UIViewController) -> ())? = nil
    
    public func navigateToConfirmOTP(_ email: String, _ viewController: UIViewController) {
        self.confirmOTPScene?(email, viewController)
    }
    
    public var pinActivationScene: (() -> ())? = nil
    
    public func navigateToPINActivation() {
        self.pinActivationScene?()
    }
    
    public var loginScene: (() -> ())? = nil
    
    public func navigateToLogin() {
        self.loginScene?()
    }
    
    // END OF AUTH
    
    public var homeScene: (() -> ())? = nil
    
    public func navigateToHome() {
        self.homeScene?()
    }
    
    public var historyScene: ((_ viewController: UIViewController) -> ())? = nil
    
    public func navigateToHistory(_ viewController: UIViewController) {
        self.historyScene?(viewController)
    }
    
    public var receiverScene: ((_ viewController: UIViewController) -> ())? = nil
    
    public func navigateToReceiver(_ viewController: UIViewController) {
        self.receiverScene?(viewController)
    }
    
    public var transactionScene: ((_ viewController: UIViewController, _ id: Int, _ name: String, _ phone: String, _ image: String) -> ())? = nil
    
    public func navigateToTransaction(_ viewController: UIViewController, _ id: Int, _ name: String, _ phone: String, _ image: String) {
        self.transactionScene?(viewController, id, name, phone, image)
    }
}
