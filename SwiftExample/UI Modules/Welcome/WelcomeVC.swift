//
//  WelcomeVC.swift
//  SwiftExample
//
//  Created by Akash Srivastava on 05/05/19.
//  Copyright © 2019 Akash Srivastava. All rights reserved.
//

import UIKit

class WelcomeVC: UIViewController {
    
    lazy var rootView: WelcomeView = {
        return WelcomeView(view: self.view)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rootView.viewDidLoad()
        rootView.showLoader()
        DribbbleApi.getHomePhotos { (result: Result<[DribbbleImage]>) in
            self.rootView.hideLoader()
            switch (result) {
            case .success(let response):
                self.rootView.setImages(response)
            case .failure(let error):
                print(error)
                
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        rootView.viewDidAppear()
        rootView.reloadCategories()
    }
    
}
