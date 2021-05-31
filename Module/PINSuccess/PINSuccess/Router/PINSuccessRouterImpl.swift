//
//  PINSuccessRouterImpl.swift
//  PINSuccess
//
//  Created by MacBook on 30/05/21.
//

import Foundation
import UIKit
import Core

public class PINSuccessRouterImpl {
    public static func navigateToModule() {
        let bundle = Bundle(identifier: "com.casestudy.PINSuccess")
        let vc = PINSuccessViewController(nibName: "PINSuccessViewController", bundle: bundle)
        
        let router = PINSuccessRouterImpl()
        let presenter = PINSuccessPresenterImpl(router: router)
        
        vc.presenter = presenter
        
        let navController = UINavigationController(rootViewController: vc)
        navController.setNavigationBarHidden(true, animated: false)
        
        UIApplication.shared.windows.first?.rootViewController = navController
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
}

extension PINSuccessRouterImpl: PINSuccessRouter {
    func navigateToHome() {
//        AppRouter.shared.navigateToHome()
        NotificationCenter.default.post(name: Notification.Name("reloadRootView"), object: nil)
    }
}
