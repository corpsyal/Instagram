//
//  ProfileActionButtonView.swift
//  Instagram
//
//  Created by Anthony Lahlah on 12.03.22.
//

import SwiftUI

struct ProfileActionButtonView: View {
    @ObservedObject var viewModel: ProfileViewModel
    var isFollowed: Bool {
        return viewModel.user.isFollowed ?? false
    }
    
    var body: some View {
        if(viewModel.user.isCurrentUser){
            Button {} label: {
                Text("Edit profile")
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 8)
                    .foregroundColor(Color.primary)
                    .font(.system(size: 14, weight: .semibold))
                    .overlay {
                        RoundedRectangle(cornerRadius: 3)
                            .stroke(lineWidth: 0.5)
                    }
            }
    
        } else {
            HStack {
                Button {
                    isFollowed ? viewModel.unfollow() : viewModel.follow()
                } label: {
                    Text(isFollowed ? "Following" : "Follow")
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 8)
                        .foregroundColor(isFollowed ? Color.primary : Color.white)
                        .font(.system(size: 14, weight: .semibold))
                        .overlay(
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(isFollowed ? Color.primary : Color(UIColor.systemBlue),   lineWidth: 0.5)
                        )
                        .background(isFollowed ? Color.clear : Color(UIColor.systemBlue))
                        .cornerRadius(3)
                }
                
                Button {
                    
                } label: {
                    Text("Message")
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 8)
                        .foregroundColor(Color.primary)
                        .font(.system(size: 14, weight: .semibold))
                        .overlay(
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(Color.primary, lineWidth: 0.5)
                        )
                }
                
            }
            
            // follow and message button
        }
    }
}
