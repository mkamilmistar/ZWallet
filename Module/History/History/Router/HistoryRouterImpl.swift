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
    public static func navigateToModule() {
        let bundle = Bundle(identifier: "com.casestudy.History")
        let vc = HistoryViewController(nibName: "HistoryViewController", bundle: bundle)
        
        let invoiceManager = InvoiceNetworkManagerImpl()
        
        let router = HistoryRouterImpl()
        let interactor = HistoryInteractorImpl(invoiceNetworkManager: invoiceManager)
        let presenter = HistoryPresenterImpl(view: vc, interactor: interactor, router: router)
        
        interactor.interactorOutput = presenter
        
        vc.presenter = presenter
        
        UIApplication.shared.windows.first?.rootViewController = vc
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
}

extension HistoryRouterImpl: HistoryRouter {
    func navigateToHome() {
        AppRouter.shared.navigateToHome()
    }
}
