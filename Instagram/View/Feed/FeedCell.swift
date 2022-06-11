//
//  FeedCell.swift
//  Instagram
//
//  Created by Anthony Lahlah on 06.03.22.
//

import SwiftUI
import Kingfisher

struct FeedCell: View {
    @ObservedObject var viewModel: FeedCellViewModel
    
    init(viewModel: FeedCellViewModel){
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                KFImage(URL(string: viewModel.post.ownerImageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 36, height: 36)
                    .clipped()
                    .cornerRadius(18)
                
                Text(viewModel.post.ownerUsername)
                    .font(.system(size: 14, weight: .semibold))
            }.padding([.leading], 8)
            
            KFImage(URL(string: viewModel.post.imageUrl))
                .resizable()
                .scaledToFill()
                .frame(maxHeight: UIScreen.main.bounds.size.width)
                .clipped()
            
            HStack(spacing: 16) {
                Button(action: {
                    (viewModel.post.didLike ?? false) ? viewModel.unlike() : viewModel.like()
                }, label: {
                    Image(systemName: "heart")
                        .resizable()
//                        .scaledToFill()
                        .frame(width: 20, height: 20)
                        .font(.system(size: 20))
                        
                })
                
                Button(action: { }, label: {
                    Image(systemName: "bubble.right")
                        .resizable()
//                        .scaledToFill()
                        .frame(width: 20, height: 20)
                        .font(.system(size: 20))
                        
                })
                
                Button(action: { }, label: {
                    Image(systemName: "paperplane")
                        .resizable()
//                        .scaledToFill()
                        .frame(width: 20, height: 20)
                        .font(.system(size: 20))
                        
                })
            }
            .padding(.leading, 8)
            .foregroundColor(.primary)
            
            Text("\(viewModel.post.likes) likes")
                .font(.system(size: 14, weight: .semibold))
                .padding(.leading, 8)
                .padding(.bottom, 1)
            
            HStack {
                Text(viewModel.post.ownerUsername).font(.system(size: 14, weight: .semibold)) + Text(" \(viewModel.post.caption)").font(.system(size: 15))
            }
            .padding(.horizontal, 8)
            .padding(.bottom, 1)
            
            Text("2d")
                .font(.system(size: 14))
                .foregroundColor(.secondary)
                .padding(.leading, 8)
            
        }
    }
}
