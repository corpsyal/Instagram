//
//  FeedView.swift
//  Instagram
//
//  Created by Anthony Lahlah on 06.03.22.
//

import SwiftUI


struct FeedView: View {
    @ObservedObject var viewModel = FeedViewModel()
    
    var body: some View {
        RefreshableScrollView(showsIndicators: false, onRefresh: viewModel.fetchPosts) {
            VStack(spacing: 32) {
                ForEach(viewModel.posts) { post in
                    FeedCell(viewModel: FeedCellViewModel(post: post))
                }
            }
            .padding(.top)
        }
        .modifier(DefaultNavigationBar())
    }
}
