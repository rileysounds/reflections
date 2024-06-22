import UIKit
import SwiftUI

struct HomeView: View {
    let horizontalImages = [Image(.art1), Image(.art2), Image(.art3), Image(.art4),
                            Image(.art5), Image(.art6), Image(.art7), Image(.art8)]
    
    let verticalImages = [Image(.art1), Image(.art2), Image(.art3), Image(.art4),
                          Image(.art5), Image(.art6), Image(.art7), Image(.art8)]
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                // Title Label or image
                Text("ReflectionsFM")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
                // Profile button
                ZStack {
                    Circle()
                        .foregroundStyle(.red)
                        .frame(width: 35, height: 35)
                    Text("RW")
                        .foregroundStyle(.white)
                }
            }
            .padding(.horizontal, 25)
            .padding(.top, 25)
            
            // Tracks section
            Text("Latest tracks:")
                .padding(.horizontal, 25)
                .padding(.top, 15)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 20) {
                    ForEach(0..<horizontalImages.count, id: \.self) { index in
                        TrackItem(image: horizontalImages[index],
                                  artistName: MusicService.shared.tracks[index].artistName,
                                  trackName: MusicService.shared.tracks[index].trackName,
                                  trackURL: MusicService.shared.tracks[index].trackURL)
                    }
                }
            }
            .frame(height: 135)
            .padding(.horizontal, 25)
            
            // Mixes section
            Text("Latest mixes:")
                .padding(.horizontal, 25)
                .padding(.top, 15)
            
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack(spacing: 20) {
                    ForEach(0..<verticalImages.count, id: \.self) { index in
                        MixItem(image: verticalImages[index])
                    }
                }
            }
            .padding(.horizontal, 25)
            .padding(.vertical, 15)
            
        }
        
        Spacer()
        
        NowPlayingView()
            .frame(height: 60)
    }
}

class HomeViewController: UIHostingController<HomeView> {
    
    
}

struct MixItem: View {
    var image: Image
    
    var body: some View {
        
        HStack {
            image
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .padding(.trailing, 25)
            
            
            VStack(alignment: .leading) {
                Text("Artist Name")
                Text("Mix Title")
            }
            
            Spacer()
            
            Image(systemName: "play.fill")
        }
        
    }
}

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
