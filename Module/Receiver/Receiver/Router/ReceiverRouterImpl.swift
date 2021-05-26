//
//  ReceiverRouterImpl.swift
//  Receiver
//
//  Created by MacBook on 26/05/21.
//

import Foundation
import UIKit
import Core

public class ReceiverRouterImpl {
    public static func navigateToModule(viewController: UIViewController) {
        let bundle = Bundle(identifier: "com.casestudy.Receiver")
        let vc = ReceiverViewController(nibName: "ReceiverViewController", bundle: bundle)
        
//        let networkManager = AuthNetworkManagerImpl()
//
//        let router = RegisterRouterImpl()
//        let interactor = RegisterInteractorImpl(networkManager: networkManager)
//        let presenter = RegisterPresenterImpl(view: vc, interactor: interactor, router: router)
//
//        interactor.interactorOutput = presenter
        
//        vc.presenter = presenter

        viewController.navigationController?.pushViewController(vc, animated: false)
    }
}
