//
//  Appearance.swift
//  SwiftExample
//
//  Created by Akash Srivastava on 07/05/19.
//  Copyright © 2019 Akash Srivastava. All rights reserved.
//

import Foundation
import UIKit

class Appearance {
    
    public static var splash:SplashAppearance {
        get {
            return instace._splash
        }
    }
    
    public static var welcome: WelcomeAppearance {
        get {
            return instace._welcome
        }
    }
    
    
    private var font = ""
    private var _splash: SplashAppearance!
    private var _welcome: WelcomeAppearance!
    
    private static let instace = Appearance()
    
    private init() {
        _splash = SplashAppearance(appearance: self)
        _welcome = WelcomeAppearance(appearance: self)
    }
    
    
    func font(ofSize size: CGFloat) -> UIFont {
        //TODO: Add code for custom font
        if (font.count == 0) {
            return UIFont.systemFont(ofSize:size)
        }
        return UIFont.systemFont(ofSize:size)
    }
}
