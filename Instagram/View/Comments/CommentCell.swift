//
//  CommentCell.swift
//  Instagram
//
//  Created by Anthony Lahlah on 12.06.22.
//

import SwiftUI
import Kingfisher

struct CommentCell: View {
    let comment: Comment
    
    var body: some View {
        HStack {
            KFImage(URL(string: comment.profilePicture))
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
                .clipped()
            
            Text(comment.username)
                .font(.system(size: 14, weight: .semibold)) + Text(" \(comment.comment)").font(.system(size: 14))
            
            Spacer()
            
            Text("2m")
                .foregroundColor(.gray)
                .font(.system(size: 12))
        }
        
    }
}
