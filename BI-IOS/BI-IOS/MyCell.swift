//
//  MyCell.swift
//  BI-IOS
//
//  Created by Dominik Vesely on 30/10/2017.
//  Copyright © 2017 ČVUT. All rights reserved.
//

import Foundation
import UIKit

class MyTableCell : UITableViewCell {
    
    
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        accessoryType = .disclosureIndicator
        
        let square = UIView()
        square.backgroundColor = .red
        
        contentView.addSubview(square)
        square.snp.makeConstraints { (make) in
            make.size.equalTo(10)
            make.left.equalTo(10)
            make.centerY.equalTo(contentView)
        }
        
       
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
