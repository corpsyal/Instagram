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
    @StateObject var authViewModel = AuthViewModel.shared
    
    init(){
        FirebaseApp.configure()
        
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.backgroundColor = .systemBackground

        // without scroll
        UINavigationBar.appearance().standardAppearance = coloredAppearance
        // when scroll
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
        
        let coloredTabBarAppearance = UITabBarAppearance()
        coloredTabBarAppearance.backgroundColor = .systemBackground
        UITabBar.appearance().standardAppearance = coloredTabBarAppearance
        UITabBar.appearance().scrollEdgeAppearance = coloredTabBarAppearance
        
        // remove background from all text view
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(authViewModel)
        }
    }
}
