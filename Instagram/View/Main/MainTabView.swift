//
//  MainTabView.swift
//  Instagram
//
//  Created by Anthony Lahlah on 06.03.22.
//

import SwiftUI

struct MainTabView: View {
    
    init(){
//        UITabBar.appearance().backgroundColor = .lightGray
    }
    
    var body: some View {
        TabView {
           
            FeedView().tabItem {
                Image(systemName: "house")
            }

            SearchView().tabItem {
                Image(systemName: "magnifyingglass")
            }

            UploadPostView().tabItem {
                Image(systemName: "plus.square")
            }

            NotificationsView().tabItem {
                Image(systemName: "heart")
            }
            
            ProfileView().tabItem {
                Image(systemName: "person")
            }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
