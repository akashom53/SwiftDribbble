//
//  ImageCell.swift
//  SwiftExample
//
//  Created by Akash Srivastava on 07/05/19.
//  Copyright © 2019 Akash Srivastava. All rights reserved.
//

import UIKit

class ImageCell: UITableViewCell {
    var spacer: Bool? {
        didSet {
            contentView.isHidden = spacer!
        }
    }
    
    lazy var cellImageView: UIImageView = {
        let imageView = UIImageView(frame: contentView.frame)
        imageView.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        return imageView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        internalInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        internalInit()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupCell()
    }
    
    func internalInit() {
        self.contentView.addSubview(cellImageView)
    }
    
    
    func setupCell() {
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20))
        self.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        contentView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        cellImageView.layer.masksToBounds = true
        cellImageView.frame = CGRect(x: 0, y: 0, width: contentView.bounds.width, height: contentView.bounds.height)
    }
    
    func setRadius(cornerRadius: CGFloat) {
        cellImageView.layer.cornerRadius = cornerRadius
    }
    

}
