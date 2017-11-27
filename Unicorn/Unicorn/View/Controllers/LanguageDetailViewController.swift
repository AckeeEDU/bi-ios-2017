//
//  LanguageDetailViewController.swift
//  Unicorn
//
//  Created by Jan Misar on 27.11.17.
//  Copyright © 2017 Jan Misar. All rights reserved.
//

import UIKit

class LanguageDetailViewController: BaseViewController {

    weak var titleLabel: UILabel!
    weak var imageView: UIImageView!
    weak var sentenceLabel: UILabel!
    weak var playButton: UIButton!
    weak var playIndicator: UIActivityIndicatorView!
    
    let language: Language
    
    private var playingObservation: NSKeyValueObservation? = nil
    
    init(language: Language) {
        self.language = language
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        
        let titleLabel = Theme.label(size: 25)
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(100)
            make.centerX.equalToSuperview()
        }
        self.titleLabel = titleLabel
        
        let imageView = UIImageView()
        view.addSubview(imageView)
        imageView.snp.makeConstraints { (make) -> Void in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(15)
            make.size.equalTo(CGSize(width: 48, height: 48))
        }
        self.imageView = imageView
        
        let sentenceLabel = Theme.label(size: 17)
        sentenceLabel.textAlignment = .center
        view.addSubview(sentenceLabel)
        sentenceLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(imageView.snp.bottom).offset(15)
            make.leading.trailing.equalTo(0).inset(15)
        }
        self.sentenceLabel = sentenceLabel
        
        let playButton = UIButton()
        playButton.setTitleColor(UIColor.black, for: UIControlState())
        playButton.setTitleColor(UIColor.lightGray, for: .disabled)
        playButton.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        playButton.setTitle("▶️ Play sentence", for: .normal)
        view.addSubview(playButton)
        playButton.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(sentenceLabel.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
        }
        self.playButton = playButton
        
        let playIndicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        playIndicator.hidesWhenStopped = true
        view.addSubview(playIndicator)
        playIndicator.snp.makeConstraints { (make) -> Void in
            make.center.equalTo(playButton)
        }
        self.playIndicator = playIndicator
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        playButton.addTarget(self, action: #selector(playButtonTapped(_:)), for: .touchUpInside)
        
        titleLabel.text = language.name
        sentenceLabel.text = language.sentence
        
        if let flagUrlString = language.flag, let flagUrl = URL(string: flagUrlString) {
            imageView.af_setImage(withURL: flagUrl)
        }
        
        playingObservation = SpeechSynthesizer.shared.observe(\.isSpeaking, options: [.initial, .new, .old]) { (synthesizer, change) in
            self.playButton.isHidden = synthesizer.isSpeaking
            if synthesizer.isSpeaking {
                self.playIndicator.startAnimating()
            } else {
                self.playIndicator.stopAnimating()
            }
        }
    }

    @objc func playButtonTapped(_ sender: UIButton) {
        SpeechSynthesizer.shared.speakSentence(language.sentence!, language: language.language_code!)
    }
}
