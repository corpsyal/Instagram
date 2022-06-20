//
//  NotificationCell.swift
//  Instagram
//
//  Created by Anthony Lahlah on 12.03.22.
//

import SwiftUI

struct NotificationCell: View {
    @State private var showPostImage: Bool = true
    
    var body: some View {
        HStack(alignment: .center, spacing: 8) {
            Image("joker")
                .resizable()
                .frame(width: 40, height: 40)
                .scaledToFit()
                .clipShape(Circle())
                .clipped()
            
            Text("joker").font(.system(size: 14, weight: .semibold)) + Text(" Liked one of your post").font(.system(size: 15))
            
            Spacer()
            
            if(showPostImage){
                Image("joker")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .scaledToFit()
                    .clipped()
            } else {
                Button {
                    
                } label: {
                    Text("Follow")
                        .font(.system(size: 14, weight: .semibold))
                        .padding(.horizontal, 20)
                        .padding(.vertical, 8)
                        .background(Color(UIColor.systemBlue))
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                        
                }

            }
            
        }
//        .background(Color.red)
    }
}

struct NotificationCell_Previews: PreviewProvider {
    static var previews: some View {
        NotificationCell()
    }
}
