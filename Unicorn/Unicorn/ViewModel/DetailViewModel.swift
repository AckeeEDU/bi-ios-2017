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
    
    
    private var playingObservation: NSKeyValueObservation? = nil
    
    override var displayName: String {
        get {
            return model.name!
        }
    }
    
    var sentence : String
    
    @objc dynamic var playCount : Int = 0
    
    var isPlaying : Bool = false

    var code : String
        
    override init (model: Language) {
        self.sentence = model.sentence!
        self.code = model.language_code!
        super.init(model: model)
        
        playingObservation = SpeechSynthesizer.shared.observe(\.isSpeaking) { [weak self] synt, _ in
            self?.isPlaying = synt.isSpeaking
        }
        
    }
    
    func playSentence() {
        SpeechSynthesizer.shared.speakSentence(sentence, language: code)
        playCount += 1
    }
}
