//
//  APIService.swift
//  Unicorn
//
//  Created by Jan Misar on 27.11.17.
//  Copyright © 2017 Jan Misar. All rights reserved.
//

import UIKit
import Alamofire

typealias SuccessBlock = (Any) -> ()
typealias FailureBlock = (Error) -> ()

class APIService {
    
    static let shared = APIService()
    
    func languages(success: @escaping SuccessBlock, failure: @escaping FailureBlock) {
        Alamofire.request("https://www.whostolemyunicorn.com/api/languages.json")
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    success(value)
                case .failure(let error):
                    failure(error)
                }
        }
    }
    
}
