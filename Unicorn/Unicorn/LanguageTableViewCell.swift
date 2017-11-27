//
//  LanguageTableViewCell.swift
//  ProjectSkeleton
//
//  Created by Tomas Kohout on 8/22/15.
//  Copyright © 2015 Ackee s. r. o. All rights reserved.
//

import AlamofireImage

class LanguageTableViewCell: UITableViewCell {

    weak var flagImageView: UIImageView!
    weak var nameLabel: UILabel!

    var language: Language? = nil {
        didSet {
            nameLabel.text = language?.name
            
            if let flagUrlString = language?.flag, let flagUrl = URL(string: flagUrlString) {
                flagImageView.af_setImage(withURL: flagUrl)
            } else {
                flagImageView.image = nil
            }
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        let flagImageView = UIImageView()
        self.contentView.addSubview(flagImageView)
        flagImageView.snp.makeConstraints { make in
            make.leading.top.bottom.equalToSuperview().inset(12)
            make.width.equalTo(48)
            make.height.equalTo(48)
        }
        self.flagImageView = flagImageView

        let nameLabel = UILabel()
        self.contentView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.leading.equalTo(flagImageView.snp.trailing).offset(12)
            make.centerY.equalTo(flagImageView)
            make.trailing.equalTo(-15)
        }
        self.nameLabel = nameLabel
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}
