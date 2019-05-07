//
//  Dimensions.swift
//  Ripe_Main
//
//  Created by Akash Srivastava on 26/04/19.
//  Copyright © 2019 Akash Srivastava. All rights reserved.
//

import Foundation
import UIKit

class Dimens {
    private final var refScreenHeight: CGFloat = 812
    private final var refScreenWidth: CGFloat = 375
    
    lazy var navBarHeight: CGFloat = heightRatio(100)
    
    static var instance = Dimens()
    
    
    func heightRatio(_ value: CGFloat) -> CGFloat {
        return (UIScreen.main.bounds.height * value) / refScreenHeight
    }
    
    func widthRatio(_ value: CGFloat) -> CGFloat {
        return (UIScreen.main.bounds.width * value) / refScreenWidth
    }
    
    func ratio(_ value: CGFloat) -> CGFloat {
        return (UIScreen.main.bounds.width * value) / refScreenWidth
    }
}

extension Int {
    func dip() -> CGFloat {
        return Dimens.instance.ratio(CGFloat(self))
    }
}

extension Double {
    func dip() -> CGFloat {
        return Dimens.instance.ratio(CGFloat(self))
    }
}
