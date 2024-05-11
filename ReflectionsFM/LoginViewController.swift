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
    
    var onSubmit: () -> Void
    
    var body: some View {
        
        Image(.rfmLogoBlack)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding(.vertical, 25)
            .padding(.horizontal, 10)
            .background(.cyan)
        
        TextField("Email", text: $email)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding(.vertical, 15)
            .padding(.horizontal, 25)
                
        SecureField("Password", text: $password)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding(.vertical, 15)
            .padding(.horizontal, 25)
        
        Button {
            print("button tapped")
            onSubmit()
        } label: {
            Text("Submit")
        }
        
    }
    
}

