//
//  MainTabView.swift
//  Instagram
//
//  Created by Anthony Lahlah on 06.03.22.
//

import SwiftUI

enum MainTabs {
    case home
    case search
    case newPost
    case notifications
    case profile
}

struct MainTabView: View {
    @EnvironmentObject private var auth: AuthViewModel
    @State var currentTab: MainTabs = .home
    
    var body: some View {
        
        TabView(selection: $currentTab) {
            NavigationView(content: {
                FeedView()
            }).tabItem {
                Image(systemName: "house")
            }.tag(MainTabs.home)
            
            NavigationView(content: {
                SearchView()
            }).tabItem {
                Image(systemName: "magnifyingglass")
            }.tag(MainTabs.search)
            
            NavigationView(content: {
                UploadPostView(currentTab: $currentTab)
            }).tabItem {
                Image(systemName: "plus.square")
            }.tag(MainTabs.newPost)
            
            NavigationView(content: {
                NotificationsView()
            }).tabItem {
                Image(systemName: "heart")
            }.tag(MainTabs.notifications)
            
            NavigationView(content: {
                if auth.user != nil {
                    ProfileView(user: auth.user!)
                }
            }).tabItem {
                Image(systemName: "person")
            }.tag(MainTabs.profile)
        }
        .accentColor(.primary)
        
    }
}

//struct MainTabView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainTabView()
//    }
//}
