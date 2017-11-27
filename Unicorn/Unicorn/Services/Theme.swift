//
//  Theme.swift
//  Unicorn
//
//  Created by Jan Misar on 27.11.17.
//  Copyright © 2017 Jan Misar. All rights reserved.
//

import UIKit

extension UIColor {
    
    class var defaultText: UIColor { return .black }
}

class Theme {
    
    class func label(size: CGFloat = 13, color: UIColor = .defaultText, weight: UIFont.Weight = .regular) -> UILabel {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: size, weight: weight)
        label.textColor = color
        label.numberOfLines = 0
        return label
    }
    
}
