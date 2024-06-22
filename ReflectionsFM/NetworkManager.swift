import Foundation

enum NetworkError: Error {
    case generic
    case decoding
}

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
    
    func fetchTracks() async throws -> [CodableTrack] {
        let urlString = ReflectionsEndpoint.fetchAllTracks
        guard let url = URL(string: urlString) else {
            print("*** Network Manager: error with fetch tracks URL")
            return []
        }
        
        do {
            guard let (data, _) = try? await session.data(from: url) else {
                throw NetworkError.generic
            }
            
            guard let tracks = try? decoder.decode([CodableTrack].self, from: data) else {
                throw NetworkError.decoding
            }
            
            print("*** NM: Successfully fetched tracks!")
            return tracks
            
        } catch(let error) {
            print("*** NM: Error fetching tracks: \(error)")
            return []
            
        }
    }
    
}


