//
//  ProfileView.swift
//  Instagram
//
//  Created by Anthony Lahlah on 06.03.22.
//

import SwiftUI

struct ProfileView: View {
    var user: User
    
    var body: some View {
        ScrollView {
            ProfileHeaderView(user: user)
                .padding(.horizontal)
                .padding(.top)
            
            PostGridView()
                .padding(.top)
        }.modifier(DefaultNavigationBar())
        
        
    }
}
