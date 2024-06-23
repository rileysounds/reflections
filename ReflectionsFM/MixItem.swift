import SwiftUI


struct MixItem: View {
    let image: Image
    let artistName: String
    let mixName: String
    let mixURL: String
    
    var body: some View {
        
        HStack {
            image
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .padding(.trailing, 25)
            
            
            VStack(alignment: .leading) {
                Text(artistName)
                Text(mixName)
            }
            
            Spacer()
            
            Button(action: {
                let mix = Mix(artistName: mixName, mixName: artistName, mixURL: mixURL)
                AudioManager.shared.loadRemoteAudioFile(from: mixURL, mix: mix)
                AudioManager.shared.play()
            }, label: {
                Image(systemName: "play.fill")
                    .foregroundStyle(.black)
            })
            
        }
        
    }
}

