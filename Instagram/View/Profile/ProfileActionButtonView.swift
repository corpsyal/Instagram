//
//  ProfileActionButtonView.swift
//  Instagram
//
//  Created by Anthony Lahlah on 12.03.22.
//

import SwiftUI

struct ProfileActionButtonView: View {
    var isCurrentUser: Bool
    var isFollowed = false
    
    var body: some View {
        if(isCurrentUser){
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

struct ProfileActionButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileActionButtonView(isCurrentUser: true)
    }
}
