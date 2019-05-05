//
//  WelcomeVC.swift
//  SwiftExample
//
//  Created by Akash Srivastava on 05/05/19.
//  Copyright © 2019 Akash Srivastava. All rights reserved.
//

import UIKit

class WelcomeVC: UIViewController {
    
    lazy var rootView: WelcomeView = {
        return WelcomeView(view: self.view)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rootView.viewDidLoad()
    }
    
}
