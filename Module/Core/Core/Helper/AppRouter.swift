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
    
    public var confirmOTPScene: (() -> ())? = nil
    
    public func navigateToConfirmOTP() {
        self.confirmOTPScene?()
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
    
    public var transactionScene: ((_ viewController: UIViewController, _ passingData: ReceiverEntity) -> ())? = nil
    
    public func navigateToTransaction(_ viewController: UIViewController, _ passingData: ReceiverEntity) {
        self.transactionScene?(viewController, passingData)
    }
    
    public var transactionConfirmationScene: ((_ viewController: UIViewController, _ passingData: ReceiverEntity, _ amount: Int, _ notes: String) -> ())? = nil
    
    public func navigateToConfirmationTransaction(_ viewController: UIViewController, _ passingData: ReceiverEntity, _ amount: Int, _ notes: String) {
        self.transactionConfirmationScene?(viewController, passingData, amount, notes)
    }
    
    public var InputPINConfirmScene: ((_ viewController: UIViewController, _ passingData: ReceiverEntity, _ amount: Int, _ notes: String) -> ())? = nil
    
    public func navigateToInputPINConfirm(_ viewController: UIViewController, _ passingData: ReceiverEntity, _ amount: Int, _ notes: String) {
        self.InputPINConfirmScene?(viewController, passingData, amount, notes)
    }
    
    public var transactionDetailsScene: ((_ viewController: UIViewController, _ isSuccess: Bool, _ passingData: ReceiverEntity, _ amount: Int, _ notes: String) -> ())? = nil
    
    public func navigateToTransactionDetails(_ viewController: UIViewController, _ isSuccess: Bool, _ passingData: ReceiverEntity, _ amount: Int, _ notes: String) {
        self.transactionDetailsScene?(viewController, isSuccess, passingData, amount, notes)
    }
}
