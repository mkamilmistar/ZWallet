//
//  ReceiverRouterImpl.swift
//  Receiver
//
//  Created by MacBook on 26/05/21.
//

import Foundation
import UIKit
import Core

public class ReceiverRouterImpl: ReceiverRouter {
    public static func navigateToModule(viewController: UIViewController) {
        let bundle = Bundle(identifier: "com.casestudy.Receiver")
        let vc = ReceiverViewController(nibName: "ReceiverViewController", bundle: bundle)
        
        let networkManager = ContactNetworkManagerImpl()

        let router = ReceiverRouterImpl()
        let interactor = ReceiverInteractorImpl(contactNetworkManager: networkManager)
        let presenter = ReceiverPresenterImpl(view: vc, interactor: interactor, router: router)

        interactor.interactorOutput = presenter
        
        vc.presenter = presenter
        
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .coverVertical
        
        
        viewController.navigationController?.pushViewController(vc, animated: true)
    }
    
    public func navigateToHome(viewController: UIViewController) {
        viewController.navigationController?.popToRootViewController(animated: true)
    }
    
}
