//
//  DribbleApi.swift
//  SwiftExample
//
//  Created by Akash Srivastava on 07/05/19.
//  Copyright © 2019 Akash Srivastava. All rights reserved.
//
//  https://api.unsplash.com/photos/?client_id=YOUR_ACCESS_KEY

import Foundation


class DribbbleApi {
    private let API_KEY = "99e93d1084b7a5c114c9b2596a27e5d9cf781851cb027ebbf747d973e06766e1"
    private let BASE_URL = "https://api.unsplash.com/"
    private lazy var HOME_PHOTOS: String = String(format: "%@photos/?client_id=%@", BASE_URL, API_KEY)
    private lazy var SEARCH_PHOTOS: String = String(format: "%@/search/photos/?client_id=%@&query=", BASE_URL, API_KEY)
    
    
    private static var instance = DribbbleApi()
    private init(){}
    
    public static func getHomePhotos(completion: @escaping (Result<[DribbbleImage]>) -> Void) {
        instance._getHomePhotos(completion: completion)
    }
    
    private func _getHomePhotos(completion: @escaping (Result<[DribbbleImage]>) -> Void) {
        ApiRequester.dataRequest(
            url: HOME_PHOTOS,
            method: HTTP_METHOD.GET,
            objectType: [DribbbleImage].self,
            completion: completion
        )
    }
    
}
