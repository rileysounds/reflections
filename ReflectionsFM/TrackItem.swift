import SwiftUI


struct TrackItem: View {
    let image: Image
    let artistName: String
    let trackName: String
    let trackURL: String
    
    var body: some View {
        ZStack {
            image
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .cornerRadius(25)
                .overlay(
                    Color.black.opacity(0.5)
                        .cornerRadius(25)
                )
                .blur(radius: 0.3)
            
            VStack {
                Text(artistName)
                    .font(.system(size: 13, weight: .bold))
                    .lineLimit(nil)
                    .multilineTextAlignment(.center)
                Text(trackName)
                    .font(.system(size: 12))
                    .lineLimit(nil)
                    .multilineTextAlignment(.center)
            }
            .foregroundColor(.white)
            .frame(width: 100, height: 100)
        }
        .frame(width: 100, height: 100)
        .onTapGesture {
            let track = Track(artistName: trackName, trackName: artistName, trackURL: trackURL)
            AudioManager.shared.loadRemoteAudioFile(from: trackURL, track: track)
            AudioManager.shared.play()
        }
    }
}

