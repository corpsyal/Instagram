//
//  CommentsView.swift
//  Instagram
//
//  Created by Anthony Lahlah on 12.06.22.
//

import SwiftUI

struct CommentsView: View {
    @ObservedObject var viewModel: CommentViewModel
    @State var text: String = ""
    
    func uploadComment(){
        viewModel.uploadComment(commentText: text) { _ in
            viewModel.fetchComments()
        }
    }
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 16) {
                    ForEach(viewModel.comments) { comment in
                        CommentCell(comment: comment)
                            .padding(.horizontal)
                    }
                }
                
            }.padding(.top, 8)
            CustomInputView(inputText: $text, action: uploadComment)
        }
    }
}
