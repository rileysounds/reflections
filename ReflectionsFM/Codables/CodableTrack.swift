import Foundation

struct CodableTrack: Codable {
    let fileName: String
    let url: String
}

struct Track {
    let artistName: String
    let trackName: String
    let trackURL: String
}
