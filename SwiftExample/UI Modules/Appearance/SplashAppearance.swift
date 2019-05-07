//
//  SplashAppearance.swift
//  SwiftExample
//
//  Created by Akash Srivastava on 07/05/19.
//  Copyright © 2019 Akash Srivastava. All rights reserved.
//

import Foundation
import UIKit

class SplashAppearance: BaseScreenAppearance {
    var titleFont: UIFont!
    let leftPadding = 20.dip()
    let swiftTopMargin = 227.67.dip()
    
    override init(appearance: Appearance) {
        super.init(appearance: appearance)
        titleFont = appearance.font(ofSize: 72.dip())
    }
}
