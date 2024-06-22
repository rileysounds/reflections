import SwiftUI


struct NowPlayingView: View {
    @StateObject var viewModel = NowPlayingViewModel()
    
    var body: some View {
        ZStack {
            Color.gray
            HStack(spacing: 25) {
                Button(action: {
                    viewModel.togglePlayPause()
                    viewModel.isPlaying = AudioManager.shared.isPlaying
                }) {
                    Image(systemName: viewModel.isPlaying ? "pause.fill" : "play.fill")
                        .font(.system(size: 25))
                        .padding(.leading, 15)
                }
                
                VStack {
                    Text(viewModel.trackName)
                    Text(viewModel.artistName)
                }
                
                Spacer()
            }
            .foregroundStyle(.black)
        }
    }
}
