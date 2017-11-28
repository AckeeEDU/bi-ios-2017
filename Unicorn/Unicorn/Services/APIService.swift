//
//  APIService.swift
//  Unicorn
//
//  Created by Jan Misar on 27.11.17.
//  Copyright © 2017 Jan Misar. All rights reserved.
//

import UIKit
import Alamofire
import MagicalRecord

typealias FailureBlock = (Error) -> ()

class APIService {
    
    static let shared = APIService() // is that 100% ok?
    
    func languages(success: @escaping ([Language]) -> (), failure: @escaping FailureBlock) {
        Alamofire.request("https://www.whostolemyunicorn.com/api/languages.json") // hardcoded URL? 🤔
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    
                    guard let languagesArray = value as? [[AnyHashable: Any]] else {
                        failure(NSError()) // NSError()..? definitely not good...
                        return
                    }
                    
                    var languages: [Language] = []
                    MagicalRecord.save({ localContext in
                        languages = Language.mr_import(from: languagesArray, in: localContext) as! [Language] // force cast because old objC API
                    }, completion: { (saved, error) in
                        if error == nil {
                            
//                            let languagesOnDefaultContext = languages.map { language in
//                                return language.mr_(in: NSManagedObjectContext.mr_default())!
//                            }
                            
                            let languagesOnDefaultContext = languages.map { $0.mr_(in: NSManagedObjectContext.mr_default())! }
                            success(languagesOnDefaultContext)
                        } else {
                            failure(NSError()) // NSError()..? nope.. not good even here
                        }
                    })
                    
                case .failure(let error):
                    failure(error)
                }
        }
    }
    
}
