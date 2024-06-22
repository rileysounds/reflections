import AVFoundation
import Combine

class AudioManager: ObservableObject {
    
    static var shared = AudioManager()
    
    @Published var currentTrack: Track?
    
    @Published var isPlaying: Bool = false
    
    var player: AVPlayer?
    
    init() {
        setUpAudioSession()
    }
    
    func setUpAudioSession() {
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("::: AM - Failed to set up audio session.")
        }
    }
    
    func play() {
        isPlaying.toggle()
        player?.play()
    }

    func pause() {
        isPlaying.toggle()
        player?.pause()
    }
    
    func loadLocalAudioFile(named fileName: String, withExtension fileExtension: String) {
        guard let filePath = Bundle.main.path(forResource: fileName, ofType: fileExtension) else {
            print("::: AM - Local audio file not found")
            return
        }
        let fileURL = URL(fileURLWithPath: filePath)
        player = AVPlayer(url: fileURL)
    }

    func loadRemoteAudioFile(from url: String, track: Track) {
        guard let fileURL = URL(string: url) else {
            print("::: AM - Invalid URL")
            return
        }
        player = AVPlayer(url: fileURL)
        currentTrack = track
    }

    func seek(to position: Double) {
        let targetTime = CMTime(seconds: position, preferredTimescale: 600)
        player?.seek(to: targetTime)
    }
}
