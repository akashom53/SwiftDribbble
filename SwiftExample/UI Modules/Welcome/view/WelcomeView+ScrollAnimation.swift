//
//  WelcomeView+ScrollAnimation.swift
//  SwiftExample
//
//  Created by Akash Srivastava on 07/05/19.
//  Copyright © 2019 Akash Srivastava. All rights reserved.
//

import Foundation
import UIKit

extension WelcomeView {
    
    func setNavigationShadow(forOffset offset: CGPoint) {
        var fraction: CGFloat = 0
        if (offset.y >= categoryCollectionViewFrame.height + 20.dip()) {
            fraction = 1
        } else if (offset.y > 0) {
            fraction = offset.y / (categoryCollectionViewFrame.height + 20.dip())
        }
        
        navBarView.layer.shadowOpacity = Float(0.5 * fraction)
        navBarView.layer.shadowRadius = 2 * fraction
        navBarView.layer.shadowOffset = CGSize(width: 0, height: 4 * fraction)
    }
    
    func setCategoryViewPosition(forOffset offset: CGPoint) {
        let thresh = categoryCollectionViewFrame.height + 40.dip() + UIApplication.shared.statusBarFrame.height
        var fraction: CGFloat = 0
        if (offset.y >= thresh) {
            fraction = 1
        } else if (offset.y > 0) {
            fraction = offset.y / thresh
        }
        
        var yPos = (1 - fraction) * thresh
        if (yPos < UIApplication.shared.statusBarFrame.height) {
            yPos = UIApplication.shared.statusBarFrame.height
        }
        var newFrame = categoryCollectionViewFrame
        newFrame.origin.y = yPos
        categoryCollectionView.frame = newFrame
    }
    
}
