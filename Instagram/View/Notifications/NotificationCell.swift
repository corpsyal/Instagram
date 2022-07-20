//
//  NotificationCell.swift
//  Instagram
//
//  Created by Anthony Lahlah on 12.03.22.
//

import SwiftUI
import Kingfisher

struct NotificationCell: View {
    @StateObject var notificationCellViewModel: NotificationCellViewModel
        
    var body: some View {
        HStack(alignment: .center, spacing: 8) {
            KFImage(URL(string: notificationCellViewModel.notification.profilePicture))
                .resizable()
                .frame(width: 40, height: 40)
                .scaledToFit()
                .clipShape(Circle())
                .clipped()
            
            Text(notificationCellViewModel.notification.username).font(.system(size: 14, weight: .semibold)) + Text(" \(notificationCellViewModel.notification.type.notificationMessage)").font(.system(size: 15))
            
            Spacer()
            
            if let post = notificationCellViewModel.post {
                KFImage(URL(string: post.imageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipped()
            } else if notificationCellViewModel.notification.type == .follow {
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

