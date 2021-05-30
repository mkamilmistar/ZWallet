//
//  TopUpView.swift
//  TopUp
//
//  Created by MacBook on 28/05/21.
//

import Foundation

protocol TopUpView {
    func showHeader()
    func showDataTopUp(topUpData: [TopUpEntity])
}
