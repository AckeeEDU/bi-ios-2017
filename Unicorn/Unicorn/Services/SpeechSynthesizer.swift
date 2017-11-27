//
//  SpeechSynthetizer.swift
//  Unicorn
//
//  Created by Jan Misar on 27.11.17.
//  Copyright © 2017 Jan Misar. All rights reserved.
//

import AVFoundation

enum SpeakError: Error {
    case languageUnavaible(String)
    case cancelled
}

class SpeechSynthesizer: NSObject, AVSpeechSynthesizerDelegate {

    static let shared = SpeechSynthesizer()
    
    @objc dynamic private(set) var isSpeaking: Bool = false
    
    lazy var synthetizer: AVSpeechSynthesizer = {
        let synthetizer = AVSpeechSynthesizer()
        synthetizer.delegate = self
        return synthetizer
    }()
    
    func canSpeakLanguage(_ language: String) -> Bool {
        return AVSpeechSynthesisVoice.speechVoices().map {$0.language}.contains(language)
    }
    
    func speakSentence(_ sentence: String, language: String) {
        
        let utterance = AVSpeechUtterance(string: sentence)
        utterance.rate = 0.4

        let voice = AVSpeechSynthesisVoice(language: language)! // we count on previous check with canSpeakLanguage()
        
        utterance.voice = voice
        synthetizer.speak(utterance)
    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didStart utterance: AVSpeechUtterance) {
        isSpeaking = true
    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        isSpeaking = false
    }
    
}
