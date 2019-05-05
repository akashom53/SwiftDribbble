//
//  WelcomeView.swift
//  SwiftExample
//
//  Created by Akash Srivastava on 05/05/19.
//  Copyright © 2019 Akash Srivastava. All rights reserved.
//

import Foundation
import UIKit

class WelcomeView {
    let view: UIView
    
    
    lazy var testLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 100, width: view.frame.width, height: 50))
        label.text = "Akash"
        label.textColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        label.textAlignment = .center
        label.layer.shadowOffset = CGSize(width: 2, height: 2)
        label.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        label.layer.shadowOpacity = 0.5
        return label
    }()
    
    init(view: UIView) {
        self.view = view
    }
    
    func viewDidLoad() {
        self.view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.view.addSubview(testLabel)
    }
    
}
