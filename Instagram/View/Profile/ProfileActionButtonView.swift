//
//  ProfileActionButtonView.swift
//  Instagram
//
//  Created by Anthony Lahlah on 12.03.22.
//

import SwiftUI

struct ProfileActionButtonView: View {
    @ObservedObject var viewModel: ProfileViewModel
    private let cornerRadius: CGFloat = 3
    
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
                        RoundedRectangle(cornerRadius: cornerRadius)
                            .stroke(lineWidth: 0.5)
                    }
            }
            
        } else {
            HStack {
                Button {
                    isFollowed ? viewModel.unfollow() : viewModel.follow()
                } label: {
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .fill(isFollowed ? Color.clear : Color(UIColor.systemBlue))
                        .frame(maxWidth: .infinity)
                        .overlay {
                            RoundedRectangle(cornerRadius: cornerRadius)
                                .stroke(isFollowed ? Color.primary : Color(UIColor.systemBlue), lineWidth: 0.5)
                                .overlay {
                                    Text(isFollowed ? "Following" : "Follow")
                                        .padding(.vertical, 8)
                                        .foregroundColor(isFollowed ? Color.primary : Color.white)
                                        .font(.system(size: 14, weight: .semibold))
                                }
                            
                        }
                }
                
                Button {
                    
                } label: {
                    Text("Message")
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 8)
                        .foregroundColor(Color.primary)
                        .font(.system(size: 14, weight: .semibold))
                        .overlay(
                            RoundedRectangle(cornerRadius: cornerRadius)
                                .stroke(Color.primary, lineWidth: 0.5)
                        )
                }
                
            }
            
            // follow and message button
        }
    }
}
