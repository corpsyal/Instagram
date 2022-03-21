//
//  InstagramApp.swift
//  Instagram
//
//  Created by Anthony Lahlah on 06.03.22.
//

import SwiftUI
import Firebase

@main
struct InstagramApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(AuthViewModel.shared)
        }
    }
}
