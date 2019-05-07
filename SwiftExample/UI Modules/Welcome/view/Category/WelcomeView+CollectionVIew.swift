//
//  WelcomeView+CategoryDelegation.swift
//  SwiftExample
//
//  Created by Akash Srivastava on 06/05/19.
//  Copyright © 2019 Akash Srivastava. All rights reserved.
//

import Foundation
import UIKit

extension WelcomeView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as! CategoryCell
        if (indexPath.row == 0) {
            cell.setCategoryLabel(categoryString: nil)
        } else {
            cell.setCategoryLabel(categoryString: categories[indexPath.row-1])
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if (indexPath.row == 0) {
            return CGSize(width: 10, height: 0)
        } else {
            var size = categories[indexPath.row-1].sizeOfString(usingFont: UIFont.systemFont(ofSize: 14.dip()))
            size.width += 40
            size.height = collectionView.frame.height
            return size
        }
    }
    
    public func reloadCategories() {
        categoryCollectionView.reloadData()
    }
    
    
}
