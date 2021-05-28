//
//  UIViewControllerExtension.swift
//  Core
//
//  Created by MacBook on 28/05/21.
//

import Foundation
import UIKit

public extension UIViewController {
    
    func setupLoadingView() {
        self.view.addSubview(loadingIndicator)
        
        NSLayoutConstraint.activate([
            loadingIndicator.centerXAnchor
                .constraint(equalTo: self.view.centerXAnchor),
            loadingIndicator.centerYAnchor
                .constraint(equalTo: self.view.centerYAnchor),
            loadingIndicator.widthAnchor
                .constraint(equalToConstant: 50),
            loadingIndicator.heightAnchor
                .constraint(equalTo: loadingIndicator.widthAnchor)
        ])
    }
}

let loadingIndicator: ProgressView = {
    let progress = ProgressView(colors: [.purple, .systemBlue, .gray], lineWidth: 5)
    progress.translatesAutoresizingMaskIntoConstraints = false
    return progress
}()

