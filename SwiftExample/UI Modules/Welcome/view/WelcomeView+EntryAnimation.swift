//
//  WelcomeView+EntryAnimation.swift
//  SwiftExample
//
//  Created by Akash Srivastava on 07/05/19.
//  Copyright © 2019 Akash Srivastava. All rights reserved.
//

import Foundation
import UIKit

extension WelcomeView {
    
    func animateTitle(completion: @escaping () -> Void) {
        UIView.animate(withDuration: 0.3, delay: 0.3, options: [.curveEaseOut, .preferredFramesPerSecond60], animations: {
            var oldFrameSwift = self.labelSwift.frame
            self.labelSwift.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
            oldFrameSwift.size.width = self.labelSwift.frame.width
            oldFrameSwift.size.height = self.labelSwift.frame.height
            oldFrameSwift.origin.y = UIApplication.shared.statusBarFrame.height + self.labelSwift.frame.height / 2
            self.labelSwift.frame = oldFrameSwift
            
            var oldFrameExample = self.labelExample.frame
            self.labelExample.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
            oldFrameExample.size.width = self.labelExample.frame.width
            oldFrameExample.size.height = self.labelExample.frame.height
            oldFrameExample.origin.y = UIApplication.shared.statusBarFrame.height + self.labelExample.frame.height / 2
            oldFrameExample.origin.x = oldFrameSwift.origin.x + oldFrameSwift.width + 10
            self.labelExample.frame = oldFrameExample
            
        }) { (completed: Bool) in
            if (completed) {
                completion()
            }
        }
    }
    
    func animateCategoryTableView(completion: @escaping () -> Void) {
        var frame = categoryCollectionView.frame
        frame.origin.x = UIScreen.main.bounds.width
        categoryCollectionView.frame = frame
        
        UIView.animate(withDuration: 0.3, delay: 0.4, options: [.curveEaseOut, .preferredFramesPerSecond60], animations: {
            var frame = self.categoryCollectionView.frame
            frame.origin.x = 0
            self.categoryCollectionView.frame = frame

            self.categoryCollectionView.alpha = 1
        }) { (completed: Bool) in
            if (completed) {
                completion()
            }
        }
    }
    
    func animateImageTableView(completion: @escaping () -> Void) {
        var frame = imageTableView.frame
        frame.origin.y -= 50
        imageTableView.frame = frame
        UIView.animate(withDuration: 0.3, delay: 0.4, options: [.curveEaseOut, .preferredFramesPerSecond60], animations: {
            var frame = self.imageTableView.frame
            frame.origin.y += 50
            self.imageTableView.frame = frame
            self.imageTableView.alpha = 1
        }) { (completed: Bool) in
            if (completed) {
                completion()
            }
        }
    }
    
    func performEntryAnimation() {
        animateTitle {
            self.labelSwift.removeFromSuperview()
            self.labelExample.removeFromSuperview()
            self.createNavBar()
        }
        animateCategoryTableView {
            
        }
        animateImageTableView {
            
        }
        
    }
    
}
