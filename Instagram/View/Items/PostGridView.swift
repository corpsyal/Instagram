//
//  PostGridView.swift
//  Instagram
//
//  Created by Anthony Lahlah on 08.03.22.
//

import SwiftUI

struct PostGridView: View {
    let items = [GridItem(), GridItem(), GridItem()]
    let width = UIScreen.main.bounds.width / 3
    var body: some View {
        LazyVGrid(columns: items, spacing: 2) {
            ForEach(0..<50){_ in
                Image("joker")
                    .resizable()
                    .scaledToFill()
                    .frame(width: width, height: width)
                    .clipped()
            }
        }
    }
}

struct PostGridView_Previews: PreviewProvider {
    static var previews: some View {
        PostGridView()
    }
}
