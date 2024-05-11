import SwiftUI


struct NowPlayingView: View {
    var body: some View {
        ZStack {
            Color.gray
            HStack(spacing: 25) {
                Image(systemName: "play.fill") // this should be a button
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
