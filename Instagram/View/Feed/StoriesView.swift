//
//  StoriesView.swift
//  Instagram
//
//  Created by Anthony Lahlah on 02.07.22.
//

import SwiftUI

struct StoriesView: View {
    @StateObject var viewModel = SearchViewModel()
    
    var body: some View {
        ZStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(viewModel.users) { user in
                        StoryCell(user: user)
                    }
                }
                .padding(.horizontal)
            }
            
//            Rectangle()
//                .fill(Color.blue)
//                .frame(maxWidth: .infinity)
//                .frame(height: UIScreen.main.bounds.height)
        }
    }
}


