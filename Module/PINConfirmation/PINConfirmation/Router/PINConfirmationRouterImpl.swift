//
//  PINConfirmationRouterImpl.swift
//  PINConfirmation
//
//  Created by MacBook on 27/05/21.
//

import Foundation
import UIKit
import Core

class PINConfirmationRouterImpl {
    public static func navigateToModule(viewController: UIViewController) {
        let bundle = Bundle(identifier: "com.casestudy.PINConfirmation")
        let vc = PINConfirmationViewController(nibName: String(describing: PINConfirmationViewController.self), bundle: bundle)
        
        let netwokManager = AuthNetworkManagerImpl()
        
        let router = PINConfirmationRouterImpl()
        let interactor = PINConfirmationInteractorImpl(authNetworkManager: netwokManager)
        let presenter = PINConfirmationPresenterImpl(view: vc, interactor: interactor, router: router)
        
        interactor.interactorOutput = presenter
        
        vc.presenter = presenter
        
        viewController.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension PINConfirmationRouterImpl: PINConfirmationRouter {
    func backNavigation(viewController: UIViewController) {
        viewController.navigationController?.popViewController(animated: true)
    }
    
    func navigateToTransactionStatus(viewController: UIViewController) {
        //
    }
}
