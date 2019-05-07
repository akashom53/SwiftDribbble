//
//  WelcomeAppearance.swift
//  SwiftExample
//
//  Created by Akash Srivastava on 07/05/19.
//  Copyright © 2019 Akash Srivastava. All rights reserved.
//

import Foundation
import UIKit

class WelcomeAppearance: BaseScreenAppearance {
    var titleFont: UIFont!
    let leftPadding = 20.dip()
    
    override init(appearance: Appearance) {
        super.init(appearance: appearance)
        titleFont = appearance.font(ofSize: 36.dip())
    }
}
