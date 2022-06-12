//
//  CommentCell.swift
//  Instagram
//
//  Created by Anthony Lahlah on 12.06.22.
//

import SwiftUI

struct CommentCell: View {
    var body: some View {
        HStack {
            Image("joker")
                .resizable()
                .frame(width: 40, height: 40)
                .scaledToFill()
                .clipShape(Circle())
                .clipped()
            
            Text("Test")
                .font(.system(size: 14, weight: .semibold)) + Text(" Test comment for now").font(.system(size: 14))
            
            Spacer()
            
            Text("2m")
                .foregroundColor(.gray)
                .font(.system(size: 12))
        }
        
    }
}
