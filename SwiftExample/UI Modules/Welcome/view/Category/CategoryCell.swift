//
//  CategoryCell.swift
//  SwiftExample
//
//  Created by Akash Srivastava on 06/05/19.
//  Copyright © 2019 Akash Srivastava. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    lazy var label: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.font = UIFont.systemFont(ofSize: 14.dip())
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(label)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public func setCategoryLabel(categoryString: String?) {
        if let categoryString = categoryString {
            self.label.text = categoryString
            var tempFrme = self.label.frame
            tempFrme.size = categoryString.sizeOfString(usingFont: UIFont.systemFont(ofSize: 14.dip()))
            tempFrme.origin.y = (self.frame.height - tempFrme.height) / 2
            tempFrme.origin.x = (self.frame.width - tempFrme.width) / 2
            self.label.frame = tempFrme
            self.label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            
            self.backgroundColor = #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)
            self.layer.cornerRadius = self.frame.height / 2
        } else {
            self.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
            self.label.text = ""
        }
        
    }
    
}
