//
//  ListViewModel.swift
//  Unicorn
//
//  Created by Dominik Vesely on 04/12/2017.
//  Copyright © 2017 Jan Misar. All rights reserved.
//

import Foundation
import UIKit

class ListViewModel  : NSObject {
    
    private var model : Language
    
    
    var displayName : String  {
        get {
            if let name = model.name, let abbr = model.abbr {
                return "\(name) (\(abbr))"
            }
            return ""
        }
    }
    var flagImageURL : URL?
    @objc dynamic var seen = false
    
    init (model: Language) {
        self.model = model
        self.flagImageURL = URL(string: model.flag!)
    }
}
