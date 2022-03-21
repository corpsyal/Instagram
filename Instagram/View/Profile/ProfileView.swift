//
//  ProfileView.swift
//  Instagram
//
//  Created by Anthony Lahlah on 06.03.22.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ScrollView {
            ProfileHeaderView()
                .padding(.horizontal)
                .padding(.top)
            
            PostGridView()
                .padding(.top)
        }.modifier(DefaultNavigationBar())
        
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
