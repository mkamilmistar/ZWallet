//
//  ReceiverPresenterImpl.swift
//  Receiver
//
//  Created by MacBook on 26/05/21.
//

import Foundation
import Core
import UIKit

public class ReceiverPresenterImpl: ReceiverPresenter {
    
    let view: ReceiverView
    let interactor: ReceiverInteractor
    let router: ReceiverRouter
    
    init(view: ReceiverView, interactor: ReceiverInteractor, router: ReceiverRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    public func loadDataReceiver() {
        self.interactor.getReceiverData()
    }
    
    public func backToHome(viewController: UIViewController) {
        self.router.navigateToHome(viewController: viewController)
    }
}

extension ReceiverPresenterImpl: ReceiverInteractorOutput {
    public func loadedDataReceiver(contacts: [ReceiverEntity]) {
        self.view.showAllReceiver(receiverData: contacts)
    }
}
