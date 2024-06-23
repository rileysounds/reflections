import UIKit
import SwiftUI

class HomeViewController: UIHostingController<HomeView> { }

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
                        MixItem(image: verticalImages[index],
                                artistName: MusicService.shared.mixes[index].artistName,
                                mixName: MusicService.shared.mixes[index].mixName,
                                mixURL: MusicService.shared.mixes[index].mixURL)
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
