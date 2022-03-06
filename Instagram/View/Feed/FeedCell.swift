//
//  FeedCell.swift
//  Instagram
//
//  Created by Anthony Lahlah on 06.03.22.
//

import SwiftUI

struct FeedCell: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image("joker")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 36, height: 36)
                    .clipped()
                    .cornerRadius(18)
                
                Text("Joker")
                    .font(.system(size: 14, weight: .semibold))
            }.padding([.leading], 8)
            
            Image("joker")
                .resizable()
                .frame(maxHeight: UIScreen.main.bounds.size.width*2)
                .scaledToFit()
                .clipped()
            
            HStack(spacing: 16) {
                Button(action: { }, label: {
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
            .foregroundColor(.black)
            
            Text("3 likes")
                .font(.system(size: 14, weight: .semibold))
                .padding(.leading, 8)
                .padding(.bottom, 1)
            
            HStack {
                Text("joker").font(.system(size: 14, weight: .semibold)) + Text(" Il suffit d’un seul mauvais jour pour que l’homme le plus sain d’esprit sombre dans la folie. La folie est la distance qui sépare le monde de l’endroit où je vis. J’ai juste passé une mauvaise journée.").font(.system(size: 15))
            }
            .padding(.horizontal, 8)
            .padding(.bottom, 1)
            
            Text("2d")
                .font(.system(size: 14))
                .foregroundColor(Color.gray)
                .padding(.leading, 8)
            
        }.padding(.bottom)
    }
}

struct FeedCell_Previews: PreviewProvider {
    static var previews: some View {
        FeedCell()
    }
}
