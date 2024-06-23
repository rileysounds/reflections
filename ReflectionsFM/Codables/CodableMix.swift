import Foundation

struct CodableMix: Codable {
    let fileName: String
    let url: String
}

struct Mix {
    let artistName: String
    let mixName: String
    let mixURL: String
}
