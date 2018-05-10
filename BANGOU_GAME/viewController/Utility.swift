//
//  Utility.swift
//  BANGOU_GAME
//
//  Created by pc on 10/31/17.
//  Copyright © 2017 pc. All rights reserved.
//

import UIKit
import AVFoundation

class MusicHelper
{
    static let sharedHelper = MusicHelper()
    var audioPlayer: AVAudioPlayer?
    func playBackgroundMusic() {
        let aSound = NSURL(fileURLWithPath: Bundle.main.path(forResource: "mario", ofType: "mp3")!)
        print(aSound)
        do {
            audioPlayer = try AVAudioPlayer(contentsOf:aSound as URL)
            audioPlayer!.prepareToPlay()
            
            if (audioPlayer?.isPlaying)! {
                audioPlayer?.pause()
            } else {
                audioPlayer?.numberOfLoops = -1
                audioPlayer?.play()
            }
            
//            audioPlayer!.play()
        } catch
        {
            print("Cannot play the file")
        }
    }
}
