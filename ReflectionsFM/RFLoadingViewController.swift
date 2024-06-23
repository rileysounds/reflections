import UIKit
import SwiftUI

class RFLoadingViewController: UIHostingController<LoadingView> { }

struct LoadingView: View {
    
    var label: String? // Optional label
    
    var body: some View {
        ZStack {
            // Blurred background
            BlurView(style: .systemThinMaterialDark)
                .edgesIgnoringSafeArea(.all)
                .background(Color.black.opacity(0.3))
            
            VStack(spacing: 20) {
                // Spinner
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                    .scaleEffect(2)
                
                // Optional label
                if let label = label {
                    Text(label)
                        .foregroundColor(.white)
                        .font(.headline)
                }
            }
        }
    }
}

struct BlurView: UIViewRepresentable {
    var style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}
