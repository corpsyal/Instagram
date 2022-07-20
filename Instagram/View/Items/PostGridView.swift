//
//  PostGridView.swift
//  Instagram
//
//  Created by Anthony Lahlah on 08.03.22.
//

import SwiftUI
import Kingfisher

struct PostGridView: View {
    @ObservedObject var viewModel: PostGridViewModel
    
    let items = [GridItem(), GridItem(), GridItem()]
    let width = UIScreen.main.bounds.width / 3
    
    init(config: PostGridType){
        self.viewModel = PostGridViewModel(config: config)
    }
    
    
    var body: some View {
        LazyVGrid(columns: items, spacing: 2) {
            ForEach(viewModel.posts){ post in
                NavigationLink(destination: FeedView(config: .profile(post.ownerUid))) {
                    KFImage(URL(string: post.imageUrl))
                        .resizable()
                        .scaledToFill()
                        .frame(width: width, height: width)
                        .clipped()
                }
            }
        }
    }
}
