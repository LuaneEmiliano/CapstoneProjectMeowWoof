//
//  Singleton.swift
//  CapstoneProjectMeowWoof
//
//  Created by luane Niejelski on 9/24/22.
//

import SwiftUI
import AVKit

//The singleton pattern ensures that only one object of a particular class is ever created. All further references to objects of the singleton class refer to the same underlying instance. 

class SoundManager {
    
    static let instance = SoundManager()
    
    var player: AVAudioPlayer?
    func playSound() {
        
        guard let url = Bundle.main.url(forResource: "notification", withExtension: ".mp3") else {return}
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print("Error playing sound. \(error.localizedDescription)")
        }
    }
}

struct Singleton: View {
    
    var soundManager = SoundManager()
    
    var body: some View {
        VStack {
            Button("Play sound 1") {
                SoundManager.instance.playSound()
            }
        }
    }
}

struct Singleton_Previews: PreviewProvider {
    static var previews: some View {
        Singleton()
    }
}

