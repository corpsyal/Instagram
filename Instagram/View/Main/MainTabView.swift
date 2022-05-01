//
//  MainTabView.swift
//  Instagram
//
//  Created by Anthony Lahlah on 06.03.22.
//

import SwiftUI

struct MainTabView: View {
    @EnvironmentObject private var auth: AuthViewModel
    
    init(){
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
    }
    
    
    var body: some View {
        
            TabView {
                NavigationView(content: {
                    FeedView()
                }).tabItem {
                    Image(systemName: "house")
                }

                NavigationView(content: {
                    SearchView()
                }).tabItem {
                    Image(systemName: "magnifyingglass")
                }

                NavigationView(content: {
                    UploadPostView()
                }).tabItem {
                    Image(systemName: "plus.square")
                }

                NavigationView(content: {
                    NotificationsView()
                }).tabItem {
                    Image(systemName: "heart")
                }
                
                NavigationView(content: {
                    if auth.userInfos != nil {
                        ProfileView(user: auth.userInfos!)
                    }
                }).tabItem {
                    Image(systemName: "person")
                }
            }
            .accentColor(.primary)
        
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
