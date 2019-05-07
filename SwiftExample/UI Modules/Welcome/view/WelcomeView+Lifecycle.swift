//
//  WelcomeView+Lifecycle.swift
//  SwiftExample
//
//  Created by Akash Srivastava on 07/05/19.
//  Copyright © 2019 Akash Srivastava. All rights reserved.
//

import Foundation
import UIKit

extension WelcomeView {
    
    func viewDidLoad() {
        mimicSplash()
        self.view.addSubview(imageTableView)
        self.view.addSubview(categoryCollectionView)
    }
    
    func viewDidAppear() {
        performEntryAnimation()
    }
    
}
