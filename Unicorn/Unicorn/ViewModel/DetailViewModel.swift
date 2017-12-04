//
//  DetailViewModel.swift
//  Unicorn
//
//  Created by Dominik Vesely on 04/12/2017.
//  Copyright © 2017 Jan Misar. All rights reserved.
//

import Foundation
import UIKit


class DetailViewModel : ListViewModel {
    
    
    
    
    override var displayName: String {
        get {
            return model.name!
        }
    }
    
    var sentence : String
    
    var playCount = 0
    
    var code : String
    
    override init (model: Language) {
        self.sentence = model.sentence!
        self.code = model.language_code!
        super.init(model: model)
        
    }
}
