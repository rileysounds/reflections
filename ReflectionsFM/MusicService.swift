import Foundation


class MusicService {
    static let shared = MusicService()
    
    var tracks: [Track] = []
    
    func store(_ tracks: [CodableTrack], completion: (([Track]) -> Void)? = nil) {
        let processedTracks: [Track] = tracks.compactMap { track in
            let (artistName, trackName) = extractArtistAndTrackName(track.fileName)
            
            guard !artistName.isEmpty, !trackName.isEmpty else {
                print("*** MS: Unable to extract artist and track name from \(track.fileName)")
                return nil
            }
            
            return Track(artistName: artistName,
                         trackName: trackName,
                         trackURL: track.url)
        }
        
        completion?(processedTracks)
        self.tracks = processedTracks
    }
    
    private func extractArtistAndTrackName(_ from: String) -> (String, String) {
        let withoutExtension = from.replacingOccurrences(of: ".mp3", with: "")
        let components = withoutExtension.components(separatedBy: " - ")
        
        guard components.count == 2 else {
            return ("", "")
        }
        
        let artist = components[0]
        let trackName = components[1]
        
        return (artist, trackName)
    }
    
}







