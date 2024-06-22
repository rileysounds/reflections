import SwiftUI
import Combine

class NowPlayingViewModel: ObservableObject {
    @Published var isPlaying: Bool = false
    @Published var trackName: String = ""
    @Published var artistName: String = ""
    
    private var audioManager = AudioManager.shared
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        // Observe changes from the AudioManager
        audioManager.$currentTrack
            .sink { [weak self] track in
                self?.trackName = track?.trackName ?? "Track name"
                self?.artistName = track?.artistName ?? "Artist name"
            }
            .store(in: &cancellables)
        
        audioManager.$isPlaying
            .sink(receiveValue: { [weak self] bool in
                self?.isPlaying = bool
            })
            .store(in: &cancellables)
    }
    
    func togglePlayPause() {
        if isPlaying {
            audioManager.pause()
        } else {
            audioManager.play()
        }
    }
}
