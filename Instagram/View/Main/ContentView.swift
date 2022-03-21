//
//  ContentView.swift
//  Instagram
//
//  Created by Anthony Lahlah on 06.03.22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var auth: AuthViewModel
    
    var body: some View {
        Group {
            if auth.userSession == nil{
                LoginView()
            } else {
                MainTabView()
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
