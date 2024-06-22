import Foundation

actor NetworkManager {
    
    static let shared = NetworkManager()

    private lazy var sessionConfig: URLSessionConfiguration = {
       // let key = "" - api key when implemented, add headers etc
        let config = URLSessionConfiguration.default
        return config
    }()
    
    
    private lazy var session: URLSession = {
       URLSession(configuration: sessionConfig)
    }()
    
    private lazy var decoder = JSONDecoder()
    
    func fetchTracks() async throws -> [Track] {
        let urlString = ReflectionsEndpoint.fetchAllTracks
        guard let url = URL(string: urlString) else {
            print("*** Network Manager: error with fetch tracks URL")
            return []
        }
        
        let (data, _) = try await session.data(from: url)
        print("Data: \(String(decoding: data, as: UTF8.self))")
        let tracks = try decoder.decode([Track].self, from: data)
        print("Tracks: \(tracks)")
        return tracks
    }
    
}


