import UIKit
import SwiftUI

class LoginViewController: UIHostingController<LoginView> {
    
    override init(rootView: LoginView = LoginView(onSubmit: {})) {
        super.init(rootView: rootView)
        self.rootView = LoginView(onSubmit: submitAction)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.rootView = LoginView(onSubmit: submitAction)
    }
    
    private func submitAction() {
        let tabNav = RFTabBarController()
        tabNav.modalPresentationStyle = .overFullScreen
        self.present(tabNav, animated: false)
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
                print("button tapped")
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

