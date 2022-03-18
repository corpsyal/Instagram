//
//  UserListView.swift
//  Instagram
//
//  Created by Anthony Lahlah on 08.03.22.
//

import SwiftUI

struct UserListView: View {
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(0..<20){ _ in
                    NavigationLink(destination: ProfileView()) {
                        UserCell()
                            .padding(.leading)
                    }
                }
            }
        }
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView()
    }
}
