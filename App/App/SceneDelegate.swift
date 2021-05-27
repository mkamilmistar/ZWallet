//
//  SceneDelegate.swift
//  App
//
//  Created by MacBook on 24/05/21.
//

import UIKit
import Core
import History
import Login
import Home
import Register
import PINActivation
import Receiver
import ConfirmOTP
import Transaction
import TransactionDetail
import PINConfirmation

@available(iOS 13.0, *)
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        self.setupAppRouter()
        
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.windowScene = scene
        
        self.reloadRootView()
//        self.timerToken()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.reloadRootView), name: Notification.Name("reloadRootView"), object: nil)
    }
    
    @objc func reloadRootView() {
        let token: String? = UserDefaultHelper.shared.get(key: .userToken)
        let loginStatus: Int? = UserDefaultHelper.shared.get(key: .statusLogin)
            
        if token != nil && loginStatus == 200 {
            AppRouter.shared.navigateToHome()
        } else if loginStatus == 403 {
            AppRouter.shared.confirmOTPScene = { (email, viewController) in
                ConfirmOTPRouterImpl.navigateToModule(email: email, viewController: viewController)
            }
        } else {
            AppRouter.shared.navigateToLogin()
        }
    }

//    func timerToken() {
//        let token: String? = UserDefaultHelper.shared.get(key: .userToken)
//        if token != nil {
//            Timer.scheduledTimer(timeInterval: 300,
//                target: self,
//                selector: #selector(self.resetDefault),
//                userInfo: nil,
//                repeats: true
//            )
//        }
//    }
    
    @objc func resetDefault() {
        UserDefaultHelper.shared.remove(key: .userToken)
        UserDefaultHelper.shared.remove(key: .statusLogin)
        UserDefaultHelper.shared.remove(key: .userEmail)
        AppRouter.shared.navigateToLogin()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
}

@available(iOS 13.0, *)
 extension SceneDelegate {
    func setupAppRouter() {
        AppRouter.shared.loginScene = {
            LoginRouterImpl.navigateToModule()
        }
        
        AppRouter.shared.registerScene = {viewController in
            RegisterRouterImpl.navigateToModule(viewController: viewController)
        }
        
        AppRouter.shared.confirmOTPScene = { (email, viewController) in
            ConfirmOTPRouterImpl.navigateToModule(email: email, viewController: viewController)
        }
        
        AppRouter.shared.pinActivationScene = {
            PINActivationRouterImpl.navigateToModule()
        }
        
        AppRouter.shared.homeScene = {
            HomeRouterImpl.navigateToModule()
        }
        
        AppRouter.shared.historyScene = { viewController in
            HistoryRouterImpl.navigateToModule(viewController: viewController)
        }
        
        AppRouter.shared.receiverScene = { viewController in
            ReceiverRouterImpl.navigateToModule(viewController: viewController)
        }
        
        AppRouter.shared.transactionScene = { (viewController, passingData) in
            TransactionRouterImpl.navigateToModule(viewController: viewController, passingData: passingData)
        }

        AppRouter.shared.transactionDetailScene = { (viewController, passingData, amount, notes) in
            TransactionDetailRouterImpl.navigateToModule(viewController: viewController, passingData: passingData, amount: amount, notes: notes)
        }
        
        AppRouter.shared.InputPINConfirmScene = { (viewController, passingData, amount, notes) in
            PINConfirmationRouterImpl.navigateToModule(viewController: viewController, passDataTransaction: passingData, amount: amount, notes: notes)
        }
    }
 }
