//
//  ListViewModel.swift
//  Unicorn
//
//  Created by Dominik Vesely on 04/12/2017.
//  Copyright © 2017 Jan Misar. All rights reserved.
//

import Foundation
import UIKit
import MagicalRecord

class ListViewModel  : NSObject {
    
    var model : Language
    
    
    var displayName : String  {
        get {
            if let name = model.name, let abbr = model.abbr {
                return "\(name) (\(abbr))"
            }
            return ""
        }
    }
    var flagImageURL : URL?
    var seen : Bool
    
    init (model: Language) {
        self.model = model
        self.flagImageURL = URL(string: model.flag!)
        self.seen = model.seen.boolValue
    }
    
    func setSeen() {
        MagicalRecord.save(blockAndWait:  {(context) in
            let local = self.model.mr_(in: context)!
            local.seen = true
        })
    }
}
