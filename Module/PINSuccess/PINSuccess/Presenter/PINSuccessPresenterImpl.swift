//
//  PINSuccessPresenterImpl.swift
//  PINSuccess
//
//  Created by MacBook on 30/05/21.
//

import Foundation

public class PINSuccessPresenterImpl: PINSuccessPresenter {
    let router: PINSuccessRouter
    
    init(router: PINSuccessRouter) {
        self.router = router
    }
    
    func navigateToHome() {
        self.router.navigateToHome()
    }
}
