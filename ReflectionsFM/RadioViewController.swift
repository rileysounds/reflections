//
//  RadioViewController.swift
//  ReflectionsFM
//
//  Created by Riley Wells on 3/24/24.
//

import UIKit
import SwiftUI


struct RadioView: View {
    let currentTrack = "Dreams"
    let currentArtist = "Riley Wells"

    @State private var isPlaying = false
    @State private var seekPosition: Double = 0.0 // Simulates the track's current position

    var body: some View {
        VStack {
            Spacer()

            // Simulated animating waveform
            RoundedRectangle(cornerRadius: 5)
                .fill(LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.5),
                                                                 Color.blue,
                                                                 Color.blue.opacity(0.5)]),
                                     startPoint: .leading, endPoint: .trailing))
                .frame(height: 100)


            Spacer()

            // Track information
            Text(currentTrack)
                .font(.title2)
                .bold()

            Text(currentArtist)
                .font(.subheadline)
                .foregroundColor(.secondary)

            Spacer()

            // Playback controls
            HStack {
                // Play/Pause button
                Button(action: {
                    isPlaying == true
                    ? AudioManager.shared.pause()
                    : AudioManager.shared.play()
                    isPlaying.toggle()
                }) {
                    Image(systemName: isPlaying ? "pause.circle.fill" : "play.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                }
                
                // Seeking slider
                Slider(value: $seekPosition, in: 0...100, step: 1)
                    .accentColor(.blue)
            }
            .padding()

            Spacer()
        }
        .padding()
    }
}

class RadioViewController: UIHostingController<RadioView> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AudioManager.shared.setUpAudioSession()
        AudioManager.shared.loadLocalAudioFile(named: "Dreams", withExtension: "mp3") // add this in
    }

    // Radio UI
    
    // animating waveform.
    // name of current track
    
    
}
