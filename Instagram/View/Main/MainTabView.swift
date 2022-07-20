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

extension View {
    func mainView(currentTab: Binding<MainTabs>) -> some View {
        modifier(DefaultNavigationBar(currentTab: currentTab))
    }
}

struct MainTabView: View {
    @EnvironmentObject private var auth: AuthViewModel
    @State var currentTab: MainTabs = .home
    
    var body: some View {
        
        TabView(selection: $currentTab) {
            NavigationView(content: {
                FeedView()
                    .mainView(currentTab: $currentTab)
            }).tabItem {
                Image(systemName: "house")
            }.tag(MainTabs.home)
            
            NavigationView(content: {
                SearchView()
                    .mainView(currentTab: $currentTab)
            }).tabItem {
                Image(systemName: "magnifyingglass")
            }.tag(MainTabs.search)
            
            NavigationView(content: {
                UploadPostView(currentTab: $currentTab)
                    .mainView(currentTab: $currentTab)
            }).tabItem {
                Image(systemName: "plus.square")
            }.tag(MainTabs.newPost)
            
            NavigationView(content: {
                NotificationsView()
                    .mainView(currentTab: $currentTab)
            }).tabItem {
                Image(systemName: "heart")
            }.tag(MainTabs.notifications)
            
            NavigationView(content: {
                if auth.user != nil {
                    ProfileView(user: auth.user!)
                        .mainView(currentTab: $currentTab)
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
