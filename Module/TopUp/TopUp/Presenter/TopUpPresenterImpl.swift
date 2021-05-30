//
//  TopUpPresenterImpl.swift
//  TopUp
//
//  Created by MacBook on 30/05/21.
//

import Foundation
import UIKit

class TopUpPresenterImpl {
    
    var router: TopUpRouter
    
    init(router: TopUpRouter) {
        self.router = router
    }
    
}

extension TopUpPresenterImpl: TopUpPresenter {
    func loadDataHeader() {
        //
    }
    
    func backToHome(viewController: UIViewController) {
        self.router.navigateToHome(viewController: viewController)
    }
    
}
