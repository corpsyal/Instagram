//
//  ProfileHeaderView.swift
//  Instagram
//
//  Created by Anthony Lahlah on 12.03.22.
//

import SwiftUI

struct ProfileHeaderView: View {
    @EnvironmentObject private var auth: AuthViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image("joker")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .scaledToFit()
                    .clipShape(Circle())
                
                Spacer()
                
                HStack(spacing: 24) {
                    ProfileUserStatView(value: 200, title: "Posts")
                    ProfileUserStatView(value: 280, title: "Followers")
                    ProfileUserStatView(value: 50, title: "Following")
                }
            }
            
            Text("Jean Cocteau")
                .font(.system(size: 15, weight: .semibold))
//                .padding(.vertical, 8)
            
            Text("Une description de test")
                .font(.system(size: 15))
//                .padding(.vertical, 8)
            
            Button {
                auth.signout()
            } label: {
                Text("Logout")
            }

            
            Spacer()
            
            ProfileActionButtonView(isCurrentUser: false)
//            .border(Color.primary, width: 0.5)
//            .cornerRadius(2)

        }
        .frame(maxWidth: .infinity, alignment: .leading)
//        .background(Color.red)
    }
}



struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView()
    }
}
