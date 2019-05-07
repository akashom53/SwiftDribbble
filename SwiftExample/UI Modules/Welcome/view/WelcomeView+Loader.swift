//
//  WelcomeView+Loader.swift
//  SwiftExample
//
//  Created by Akash Srivastava on 07/05/19.
//  Copyright © 2019 Akash Srivastava. All rights reserved.
//

import Foundation
import UIKit

extension WelcomeView {
    
    func showLoader() {
        self.loader.startAnimating()
    }
    
    func hideLoader() {
        self.loader.stopAnimating()
    }
    
}
