//
//  RotatingAnimation.swift
//  Core
//
//  Created by MacBook on 28/05/21.
//

import Foundation
import UIKit

public class RotationAnimation: CABasicAnimation {
    
    enum Direction: String {
        case coordinateX, coordinateY, coordinateZ
    }
    
    override init() {
        super.init()
    }
    
    init(
        direction: Direction,
        fromValue: CGFloat,
        toValue: CGFloat,
        duration: Double,
        repeatCount: Float
    ) {
        
        super.init()
        
        self.keyPath = "transform.rotation.\(direction.rawValue)"
        
        self.fromValue = fromValue
        self.toValue = toValue
        
        self.duration = duration
        
        self.repeatCount = repeatCount
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
