//
//  ContentView.swift
//  Instagram
//
//  Created by Anthony Lahlah on 06.03.22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var auth: AuthViewModel
    
    init(){
        print("ContentView")
    }
    
    var body: some View {
        Group {
            if auth.isLoading == true {
                LauchScreenView()
            } else if auth.user != nil{
                MainTabView()
            } else {
                LoginView()
            }
        }
    }
}
