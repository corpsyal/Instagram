//
//  UserCell.swift
//  Instagram
//
//  Created by Anthony Lahlah on 08.03.22.
//

import SwiftUI
import Kingfisher

struct UserCell: View {
    var user: User
    
    
    var body: some View {
        HStack(alignment: .center) {
            if user.profilePicture != nil {
                KFImage(URL(string: user.profilePicture!))
                    .profileImageModifier(width: 48, height: 48)
            } else {
                Image("joker")
                    .profileImageModifier(width: 48, height: 48)
            }
                
            
            VStack(alignment: .leading) {
                Text(user.userName)
                    .font(.system(size: 14, weight: .semibold))
                
                Text(user.fullName)
                    .font(.system(size: 14))
            }
            
            Spacer()
        }
    }
}

