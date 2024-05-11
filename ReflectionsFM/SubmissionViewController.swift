//
//  SubmissionViewController.swift
//  ReflectionsFM
//
//  Created by Riley Wells on 3/24/24.
//

import UIKit
import SwiftUI

class SubmissionViewController: UIHostingController<SubmissionView> {

    override init(rootView: SubmissionView = SubmissionView(onSubmit: {})) {
        super.init(rootView: rootView)
        self.rootView = SubmissionView(onSubmit: submitAction)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.rootView = SubmissionView(onSubmit: submitAction)
    }
    
    private func submitAction() {
        let alertController = UIAlertController(title: "Success",
                                                message: "Your submission was sent. Please wait for a response.",
                                                preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            // navigate back to home screen
            self.tabBarController?.selectedIndex = 0
        }
        alertController.addAction(okAction)
        
        self.present(alertController, animated: true, completion: nil)
        
    }

}

struct SubmissionView: View {
    @State private var artistName: String = ""
    @State private var email: String = ""
    @State private var link: String = ""
    @State private var description: String = ""
    @State private var selectedSegment: Int = 0
    
    var onSubmit: () -> Void
    
    var body: some View {
        VStack {
            Text("Submit your music")
            // artist name
            TextField("Artist Name", text: $artistName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.vertical, 15)
                .padding(.horizontal, 25)
            
            // email
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.vertical, 15)
                .padding(.horizontal, 25)
            
            // track link
            TextField("Link to track or mix", text: $link)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.vertical, 15)
                .padding(.horizontal, 25)
            
            // segmented control for track, morning drive or mirrrors
            Picker("", selection: $selectedSegment) {
                Text("Original Track").tag(0)
                Text("Mirrors Mix").tag(1)
                Text("Morning Drive").tag(2)
            }
            .pickerStyle(.segmented)
            .padding()
            
            // something about it
            Text("Tell us about your creation:")
            TextEditor(text: $description)
                .frame(height: 200)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 1)  // Adding a border
                        .frame(height: 200)
                )
                .padding(.horizontal, 25)
                .padding(.vertical, 15)
            
            // submit button
            Button {
                resetPage()
                onSubmit()
            } label: {
                Text("Submit")
            }
        }
        
    }

    func resetPage() {
        artistName = ""
        email = ""
        link = ""
        selectedSegment = 0
        description = ""
    }
}
