//
//  ContentView.swift
//  Instagram
//
//  Created by Anthony Lahlah on 06.03.22.
//

import SwiftUI

struct ContentView: View {
    
    init(){
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.backgroundColor = .systemBackground
                           
        // without scroll
        UINavigationBar.appearance().standardAppearance = coloredAppearance
        // when scroll
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
        
        UITabBar.appearance().isTranslucent = false
    }
    
    var body: some View {
        MainTabView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
