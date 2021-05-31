//
//  ReceiverInteractorImpl.swift
//  Receiver
//
//  Created by MacBook on 26/05/21.
//

import Foundation
import UIKit
import Core

class ReceiverInteractorImpl: ReceiverInteractor {
    var interactorOutput: ReceiverInteractorOutput?
    
    let contactNetworkManager: ContactNetworkManager
    
    init(contactNetworkManager: ContactNetworkManager) {
        self.contactNetworkManager = contactNetworkManager
    }
    
    func getReceiverData() {
        self.contactNetworkManager.getContact { (data, _) in
            var getAllContact: [ReceiverEntity] = []
            data?.forEach({ (contactData) in
                getAllContact.append(ReceiverEntity(id: contactData.id, name: contactData.name, phone: contactData.phone, image: "\(AppConstant.baseUrl)\(contactData.image)"))
            })
            self.interactorOutput?.loadedDataReceiver(contacts: getAllContact)
        }
    }
}
