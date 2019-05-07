//
//  WelcomeView.swift
//  SwiftExample
//
//  Created by Akash Srivastava on 05/05/19.
//  Copyright © 2019 Akash Srivastava. All rights reserved.
//

import Foundation
import UIKit

class WelcomeView: NSObject {
    
    let view: UIView
    var images = [DribbbleImage]()
    
    let categories = [
        "Wallpapers",
        "Cars",
        "Space",
        "Nature",
        "Science Fiction"
    ]
    
    //MARK: Splash
    lazy var splashTitleFont = Appearance.splash.titleFont!
    
    lazy var labelSwift: UILabel = {
        let labelString = "Swift"
        let size = labelString.sizeOfString(usingFont: splashTitleFont)
        let frame = CGRect(
            x: Appearance.splash.leftPadding,
            y: Appearance.splash.swiftTopMargin,
            width: size.width,
            height: size.height
        )
        let label = UILabel(frame: frame)
        label.text = labelString
        label.font = splashTitleFont
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return label
    }()
    
    lazy var labelExample: UILabel = {
        let labelString = "Example"
        let size = labelString.sizeOfString(usingFont: splashTitleFont)
        let frame = CGRect(
            x: Appearance.splash.leftPadding,
            y: Appearance.splash.swiftTopMargin + size.height,
            width: size.width,
            height: size.height
        )
        let label = UILabel(frame: frame)
        label.text = labelString
        label.font = splashTitleFont
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return label
    }()
    
    func mimicSplash() {
        self.view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.view.addSubview(labelSwift)
        self.view.addSubview(labelExample)
    }
    
    //MARK: Navigation Bar
    
    lazy var title: UILabel = {
        let labelString = "Swift Example"
        let titleFont = Appearance.welcome.titleFont!
        let size = labelString.sizeOfString(usingFont: titleFont)
        let frame = CGRect(
            x: Appearance.welcome.leftPadding,
            y: 0,
            width: size.width,
            height: size.height
        )
        let label = UILabel(frame: frame)
        label.text = labelString
        label.font = titleFont
        return label
    }()
    
    lazy var navBarView: UIView = {
        let labelString = "S"
        let size = labelString.sizeOfString(usingFont: Appearance.welcome.titleFont!)
        let frame = CGRect(
            x: 0,
            y: UIApplication.shared.statusBarFrame.height,
            width: UIScreen.main.bounds.width,
            height: size.height * 2 - 20.dip()
        )
        let view = UIView(frame: frame)
        view.backgroundColor = .clear
        
        var titleFrame = self.title.frame
        titleFrame.origin.y = (frame.height - titleFrame.height)/2
        self.title.frame = titleFrame
        
        view.addSubview(self.title)
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        return view
    }()
    
    func createNavBar() {
        self.view.addSubview(navBarView)
    }
    
    //MARK: Category CollectionView
    
    lazy var categoryCollectionViewFrame: CGRect = {
        let labelString = "S"
        let size = labelString.sizeOfString(usingFont: UIFont.systemFont(ofSize: 36.dip()))
        let frame = CGRect(
            x: 0,
            y: UIApplication.shared.statusBarFrame.height + size.height * 2,
            width: UIScreen.main.bounds.width,
            height: size.height
        )
        return frame
    }()
    
    lazy var categoryFlowLayout: UICollectionViewFlowLayout = {
        let flowLayout = UICollectionViewFlowLayout()
        let collectionViewFrame = categoryCollectionViewFrame
        flowLayout.itemSize = CGSize(width: collectionViewFrame.width * 0.4, height: collectionViewFrame.height)
        flowLayout.scrollDirection = .horizontal
        return flowLayout
    }()
    
    lazy var categoryCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: categoryCollectionViewFrame, collectionViewLayout: categoryFlowLayout)
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: "categoryCell")
        collectionView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.alpha = 0
        return collectionView
    }()
    
    //MARK: Images Table View
    
    lazy var imageTableView: UITableView = {
        let frame = CGRect(x:0,
                           y: categoryCollectionViewFrame.origin.y - 20.dip(),
                           width: UIScreen.main.bounds.width,
                           height: UIScreen.main.bounds.height - categoryCollectionViewFrame.origin.y + 20.dip()
        )
        
        let tableView = UITableView(frame: frame)
        tableView.register(ImageCell.self, forCellReuseIdentifier: "ImageCell")
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.showsVerticalScrollIndicator = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        tableView.alpha = 0
        return tableView
    }()
    
    lazy var imageCellHeight = {
        return (UIScreen.main.bounds.width - 40.dip()) * 3 / 4
    }()
    
    //MARK: Loader
    lazy var loader: UIActivityIndicatorView = {
        let loader = UIActivityIndicatorView(style: .gray)
        var frame = loader.frame
        frame.size.width *= 2
        frame.size.height *= 2
        frame.origin.x = (UIScreen.main.bounds.width - frame.width)/2
        frame.origin.y = (UIScreen.main.bounds.height - frame.height)/2
        loader.frame = frame
        loader.transform = CGAffineTransform(scaleX: 2, y: 2)
        loader.hidesWhenStopped = true
        loader.stopAnimating()
        self.view.addSubview(loader)
        self.view.bringSubviewToFront(loader)
        return loader
    }()
    
    init(view: UIView) {
        self.view = view
    }
    
}
