//
//  CommentsView.swift
//  Instagram
//
//  Created by Anthony Lahlah on 12.06.22.
//

import SwiftUI

struct CommentsView: View {
    @State var text: String = ""
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 16) {
                    ForEach(0..<10) { _ in
                        CommentCell()
                            .padding(.horizontal)
                    }
                }
                
            }.padding(.top, 8)
            CustomInputView(inputText: $text)
        }
    }
}
