//
//  MyCell.swift
//  BI-IOS
//
//  Created by Dominik Vesely on 30/10/2017.
//  Copyright © 2017 ČVUT. All rights reserved.
//

import Foundation
import UIKit

class RecipeTableCell : UITableViewCell {
    
    
    weak var recipeName : UILabel!
    weak var recipeScore : UILabel!
    weak var recipeDuration : UILabel!
    
    var recipe : Recipe? { didSet {
        if let recipe = recipe {
            self.recipeName.text = recipe.name
            self.recipeScore.text = "\(recipe.score)/5"
        }
        }
    }
    
    

    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        accessoryType = .disclosureIndicator
        
        // ----- Name -----
        let name = UILabel()
        contentView.addSubview(name)
        name.snp.makeConstraints { make in
            make.leading.equalTo(10)
            make.centerY.equalTo(contentView)
        }
        self.recipeName = name
        
        // ----- Name -----
        let score = UILabel()
        contentView.addSubview(score)
        score.snp.makeConstraints { make in
            make.leading.equalTo(name.snp.trailing).offset(10)
            make.trailing.equalTo(contentView.snp.trailing).offset(-10)
            make.centerY.equalTo(contentView)
        }
        score.textColor = .red
        self.recipeScore = score
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
