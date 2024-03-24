import AVFoundation

class AudioManager {
    
    static var shared = AudioManager()
    
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
        player?.play()
    }

    func pause() {
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

    func seek(to position: Double) {
        let targetTime = CMTime(seconds: position, preferredTimescale: 600)
        player?.seek(to: targetTime)
    }
}
