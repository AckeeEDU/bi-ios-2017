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
    
    private var seenObservation: NSKeyValueObservation? = nil


    var language: Language? = nil {
        didSet {
            nameLabel.text = language?.name
            
            if let flagUrlString = language?.flag, let flagUrl = URL(string: flagUrlString) {
                flagImageView.af_setImage(withURL: flagUrl)
            }
        }
    }
    
    var viewModel : ListViewModel? = nil {
        didSet {
            nameLabel.text = viewModel?.displayName
            if let url = viewModel?.flagImageURL {
                flagImageView.af_setImage(withURL: url)
            }
            
            seenObservation = viewModel?.observe(\.seen, changeHandler: { [weak self] (vm, change) in
                self?.accessoryType = vm.seen ? .checkmark : .none
            })
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

    override func prepareForReuse() {
        // we should "reset" cell here, it is going to be reused in a moment
        flagImageView.image = nil
        seenObservation = nil
        accessoryType = .none
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}
