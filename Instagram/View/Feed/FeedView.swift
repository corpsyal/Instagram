//
//  FeedView.swift
//  Instagram
//
//  Created by Anthony Lahlah on 06.03.22.
//

import SwiftUI


struct FeedView: View {
    @ObservedObject var viewModel: FeedViewModel
    private let config: FeedViewType
    
    init(config: FeedViewType){
        self.config = config
        viewModel = FeedViewModel(config: config)
    }
    
    var body: some View {
        RefreshableScrollView(showsIndicators: false, onRefresh: viewModel.fetchPosts) {
            if config == .all {
                StoriesView()
            }
            
            VStack(spacing: 32) {
                ForEach(viewModel.posts) { post in
                    FeedCell(viewModel: FeedCellViewModel(post: post))
                }
            }
            .padding(.top)
        }
    }
}
