//
//  ProfileView.swift
//  Instagram
//
//  Created by Anthony Lahlah on 06.03.22.
//

import SwiftUI

struct ProfileView: View {
//    let user: User
    @ObservedObject var profileViewModel: ProfileViewModel
    
    init(user: User){
//        self.user = user
        self.profileViewModel = ProfileViewModel(user: user)
    }
    
    var body: some View {
        ScrollView {
            ProfileHeaderView(viewModel: profileViewModel)
                .padding(.horizontal)
                .padding(.top)
            
            PostGridView(config: .profile(profileViewModel.user.id!))
                .padding(.top)
        }.modifier(DefaultNavigationBar())
        
        
    }
}
