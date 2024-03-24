import UIKit
import SwiftUI

struct HomeView: View {
    let horizontalItems = [Color.red, Color.green, Color.blue, Color.orange, Color.purple]
    let verticalItems = ["List Item 1", "List Item 2", "List Item 3", "List Item 4", "List Item 5"]
    
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
                        .foregroundStyle(.cyan)
                        .frame(width: 35, height: 35)
                    Text("RW")
                        .foregroundStyle(.white)
                }
            }
            .padding(.horizontal, 25)
            .padding(.top, 25)
            
            Text("Latest tracks:")
                .padding(.horizontal, 25)
                .padding(.top, 15)
            
            // horizontal collectionview
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 20) {
                    ForEach(horizontalItems, id: \.self) { color in
                        RoundedRectangle(cornerRadius: 25)
                            .fill(color)
                            .frame(width: 100, height: 100)
                    }
                }
            }
            .frame(height: 135)
            
            Text("Latest mixes:")
                .padding(.horizontal, 25)
                .padding(.top, 15)
            
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack(spacing: 20) {
                    ForEach(verticalItems, id: \.self) { text in
                        HStack {
                            Text(text)
                            Spacer()
                        }
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
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

struct NowPlayingView: View {
    var body: some View {
        ZStack {
            Color.gray
            HStack(spacing: 25) {
                Image(systemName: "play.fill")
                    .font(.system(size: 25))
                    .padding(.leading, 15)
                
                VStack {
                    Text("Track name")
                    Text("Artist name")
                }
                
                Spacer()
            }
            .foregroundStyle(.black)
        }
    }
}
