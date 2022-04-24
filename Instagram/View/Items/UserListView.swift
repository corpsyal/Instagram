//
//  UserListView.swift
//  Instagram
//
//  Created by Anthony Lahlah on 08.03.22.
//

import SwiftUI

struct UserListView: View {
    var users: [User]
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(users){ user in
                    NavigationLink(destination: ProfileView()) {
                        UserCell(user: user)
                            .padding(.leading)
                    }
                }
            }
        }
    }
}

//struct UserListView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserListView()
//    }
//}
