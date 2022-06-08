//
//  SoundPlayer.swift
//  GuessThePhilosopher
//
//  Created by david lam on 8/6/22.
//

import Foundation
import AVFoundation

class SoundPlayer {
    var audioPlayer = AVAudioPlayer()
    
    func playSound(_ sound: Sound) {
        
        var soundString: String
        
        switch sound {
        case .finish:
            soundString = ["ohMyGosh", "really", "wow"].randomElement()!
        default: soundString = sound.rawValue
        }
                
        let soundFile = Bundle.main.path(forResource: soundString, ofType: "wav")
        let url = URL(fileURLWithPath: soundFile!)
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer.play()
        } catch {
            print("wrong sound error")
        }
    }
}
