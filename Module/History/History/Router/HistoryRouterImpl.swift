//
//  HistoryRouterImpl.swift
//  History
//
//  Created by MacBook on 25/05/21.
//

import Foundation
import UIKit
import Core

public class HistoryRouterImpl {
    public static func navigateToModule(viewController: UIViewController) {
        let bundle = Bundle(identifier: "com.casestudy.History")
        let vc = HistoryViewController(nibName: "HistoryViewController", bundle: bundle)
        
        let invoiceManager = InvoiceNetworkManagerImpl()
        
        let router = HistoryRouterImpl()
        let interactor = HistoryInteractorImpl(invoiceNetworkManager: invoiceManager)
        let presenter = HistoryPresenterImpl(view: vc, interactor: interactor, router: router)
        
        interactor.interactorOutput = presenter
        
        vc.presenter = presenter
        
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .coverVertical

        viewController.navigationController?.pushViewController(vc, animated: true)
    }
}

extension HistoryRouterImpl: HistoryRouter {
    func navigateToHome(viewController: UIViewController) {
        NotificationCenter.default.post(name: Notification.Name("reloadRootView"), object: nil)
//        viewController.navigationController?.popToRootViewController(animated: true)
    }
}
