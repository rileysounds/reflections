import UIKit
import SwiftUI

class LoginViewController: UIHostingController<LoginView> {
    
    override init(rootView: LoginView = LoginView(onSubmit: {})) {
        super.init(rootView: rootView)
        self.rootView = LoginView(onSubmit: submitAction)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchAndStoreMusic()
    }
    
    private func fetchAndStoreMusic() {
        Task {
            showLoading()
            defer { hideLoading() }
            
            do {
                try await MusicService.shared.fetchAndStoreMusic().value
            } catch {
                print("Error fetching and storing music: \(error)")
            }
        }
    }
    
    private func submitAction() {
        let tabNav = RFTabBarController()
        tabNav.modalPresentationStyle = .overFullScreen
        self.present(tabNav, animated: false)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.rootView = LoginView(onSubmit: submitAction)
    }
}

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var buttonDisabled: Bool = true
    
    var onSubmit: () -> Void
    
    var body: some View {
        
        VStack {
            Spacer(minLength: 50)
            
            Image(.rfmLogoBlack)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.vertical, 40)
                .padding(.horizontal, 25)
                        
            VStack(spacing: 20) {
                TextField("Email", text: $email)
                    .controlSize(.large)
                SecureField("Password", text: $password)
                    .controlSize(.large)
            }
            .font(.system(size: 25))
            .textFieldStyle(.roundedBorder)
            .padding(.vertical, 30)
            .padding(.horizontal, 25)
            
            Button {
                onSubmit()
            } label: {
                Text("Submit")
                    .font(.system(size: 25))
                    .foregroundStyle(.white)
            }
            .frame(width: 200, height: 60)
            .background(.black)
            .cornerRadius(10)
            .padding(.vertical, 40)
            
            Spacer()
        }
        
    }
}

extension UIHostingController {
    
    func showLoading() {
        guard self.presentedViewController == nil else {
            print("DESIGN A BETTER LOADING ICON SYSTEM!!!!!!!!!!")
            return
        }
        let loadingVC = RFLoadingViewController(rootView: LoadingView(label: "Fetching mixes and tracks..."))
        loadingVC.modalPresentationStyle = .overFullScreen
        present(loadingVC, animated: false)
    }
    
    func hideLoading() {
        if let spinner = self.presentedViewController as? RFLoadingViewController {
            spinner.dismiss(animated: true)
        }
    }
    
}
