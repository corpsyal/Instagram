//
//  FeedView.swift
//  Instagram
//
//  Created by Anthony Lahlah on 06.03.22.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack(spacing: 32) {
                ForEach(0..<10) {_ in
                    FeedCell()
                }
            }.padding(.top)
        }
        
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
