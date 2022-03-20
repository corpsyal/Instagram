//
//  MainTabView.swift
//  Instagram
//
//  Created by Anthony Lahlah on 06.03.22.
//

import SwiftUI

struct MainTabView: View {
    
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
        NavigationView {
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
            .accentColor(.primary)
            .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Image("Instagram_logo")
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(.primary)
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 200, maxHeight: 100, alignment: .leading)
                            
                            
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        HStack(spacing: 20) {
                            Button(action: {}) {
                                Image(systemName: "plus.square")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .font(Font.title.weight(.semibold))
                                    .tint(Color.primary)
                            }
                            Button(action: {}) {
                                Image(systemName: "heart")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .font(Font.title.weight(.semibold))
                                    .tint(Color.primary)
                            }
                            Button(action: {}) {
                                Image(systemName: "paperplane")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .font(Font.title.weight(.semibold))
                                    .tint(Color.primary)
                            }
                        }
                    }
    //                ToolbarItem(placement: .principal) {
    //                    Text("Home").fontWeight(.semibold)
    //                }
                }
            
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
