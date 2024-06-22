//
//  MusicViewController.swift
//  ReflectionsFM
//
//  Created by Riley Wells on 3/24/24.
//

import UIKit
import SwiftUI

class MusicViewController: UIHostingController<MusicView> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // List of artists
    
    // search function
    
}

struct MusicView: View {
    
    var body: some View {
        VStack {
            Text("Music View")
                .padding()
            
            Button("Fetch Tracks") {
                Task {
                    try await NetworkManager.shared.fetchTracks()
                }
            }
        }
    }
}

