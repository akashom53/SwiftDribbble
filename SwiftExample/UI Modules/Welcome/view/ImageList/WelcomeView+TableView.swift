//
//  WelcomeView+TableView.swift
//  SwiftExample
//
//  Created by Akash Srivastava on 07/05/19.
//  Copyright © 2019 Akash Srivastava. All rights reserved.
//

import Foundation
import UIKit

extension WelcomeView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(images.count)
        return images.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ImageCell", for: indexPath) as! ImageCell
        cell.spacer = indexPath.row == 0
        if (indexPath.row > 0) {
            cell.setRadius(cornerRadius: categoryCollectionViewFrame.height/2)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath.row == 0) {
            return categoryCollectionViewFrame.height + 30
        }
        return imageCellHeight
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if (indexPath.row == 0) {
            return
        }
        
        let index = indexPath.row - 1
        (cell as! ImageCell).cellImageView.image = UIImage(named: "testImage2")
        ImageDownloader.shared.downloadImage(
            images[index].urls.small!,
            indexPath: indexPath) { (image, url, _indexPath, error) in
                if let indexPathNew = _indexPath, indexPathNew == indexPath {
                    DispatchQueue.main.async {
                        (cell as! ImageCell).cellImageView.image = image
                        (cell as! ImageCell).cellImageView.contentMode = .scaleAspectFill
                    }
                }
        }
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if (indexPath.row == 0) {
            return
        }
        
        let index = indexPath.row - 1
        ImageDownloader.shared.slowDownImageDownloadTaskfor(images[index].urls.small!)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset
        setNavigationShadow(forOffset: offset)
        setCategoryViewPosition(forOffset: offset)
    }
    
    func setImages(_ images: [DribbbleImage]) {
        self.images = images
        self.imageTableView.reloadData()
    }
    
}
