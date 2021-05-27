//
//  ReceiverPresenterImpl.swift
//  Receiver
//
//  Created by MacBook on 26/05/21.
//

import Foundation
import Core
import UIKit
import Transaction

public class ReceiverPresenterImpl: ReceiverPresenter {
   
    let view: ReceiverView
    let interactor: ReceiverInteractor
    let router: ReceiverRouter
    var transactionRouter: TransactionRouter?
    
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
    
    public func passingDataReceiver(viewController: UIViewController,id: Int, name: String, phone: String, image: String) {
        self.router.navigateToTransaction(viewController: viewController, id: id, name: name, phone: phone, image: image)
    }
}

extension ReceiverPresenterImpl: ReceiverInteractorOutput {
    public func loadedDataReceiver(contacts: [ReceiverEntity]) {
        self.view.showAllReceiver(receiverData: contacts)
    }
}
