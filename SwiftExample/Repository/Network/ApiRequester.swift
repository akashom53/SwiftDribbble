//
//  ApiRequester.swift
//  Ripe
//
//  Created by Akash Srivastava on 11/04/19.
//  Copyright © 2019 Akash Srivastava. All rights reserved.
//

import Foundation

public enum HTTP_METHOD: String {
    case GET = "GET"
    case POST = "POST"
}

public enum APPError: Error {
    case networkError(Error)
    case dataNotFound
    case jsonParsingError(Error)
    case invalidStatusCode(Int)
}

public enum Result<T> {
    case success(T)
    case failure(APPError)
}

class ApiRequester {
    
    public static func dataRequest<T: Decodable>(url: String, method: HTTP_METHOD, objectType: T.Type, completion: @escaping (Result<T>) -> Void) {
        
        //create the url with NSURL
        let dataURL = URL(string: url)! //change the url
        
        //create the session object
        let session = URLSession.shared
        
        //now create the URLRequest object using the url object
        var request = URLRequest(url: dataURL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 60)
        request.httpMethod = method.rawValue
        //create dataTask using the session object to send data to the server
        let task = session.dataTask(with: request, completionHandler: { data, response, error in
            DispatchQueue.main.async {
                guard error == nil else {
                    completion(Result.failure(APPError.networkError(error!)))
                    return
                }
                
                guard let data = data else {
                    completion(Result.failure(APPError.dataNotFound))
                    return
                }
                
                do {
                    //create decodable object from data
                    let decodedObject = try JSONDecoder().decode(objectType.self, from: data)
                    completion(Result.success(decodedObject))
                } catch let error {
                    completion(Result.failure(APPError.jsonParsingError(error as! DecodingError)))
                }
            }
        })
        
        task.resume()
    }
}
