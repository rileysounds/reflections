import Foundation

enum NetworkError: Error {
    case generic
    case decoding
    case non200StatusCode
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
            print("*** NM: error with fetch tracks URL")
            return []
        }
        
        do {
            guard let (data, httpResponse) = try? await session.data(from: url) else {
                throw NetworkError.generic
            }
            
            guard let response = httpResponse as? HTTPURLResponse, response.statusCode == 200 else {
                throw NetworkError.non200StatusCode
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
    
    func fetchMixes() async throws -> [CodableMix] {
        let urlString = ReflectionsEndpoint.fetchAllMixes
        guard let url = URL(string: urlString) else {
            print("*** NM: error with fetch mixes URL")
            return []
        }
        
        do {
            guard let (data, httpResponse) = try? await session.data(from: url) else {
                throw NetworkError.generic
            }
            
            guard let response = httpResponse as? HTTPURLResponse, response.statusCode == 200 else {
                throw NetworkError.non200StatusCode
            }
            
            guard let mixes = try? decoder.decode([CodableMix].self, from: data) else {
                throw NetworkError.decoding
            }
            
            print("*** NM: Successfully fetched mixes!")
            return mixes
            
        } catch(let error) {
            print("*** NM: Error fetching mixes: \(error)")
            return []
            
        }
    }
    
}


