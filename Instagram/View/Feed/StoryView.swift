//
//  StoryView.swift
//  Instagram
//
//  Created by Anthony Lahlah on 05.07.22.
//

import SwiftUI
import Kingfisher

struct StoryView: View {
    @Binding var show: Bool
    @State var currentIndex: Int = 0
    @State var stories: [String] = ["sunset", "switzerland"]
    @State var message: String = ""
    let user: User
    
    var body: some View {
        VStack(spacing: 20) {
            ZStack(alignment: .top) {
                Rectangle()
                    .fill(Color.blue)
                    .padding(.horizontal, 20)
                    .overlay {
                        Image(stories[currentIndex < stories.count ? currentIndex : stories.count - 1 ])
                            .resizable()
                            .scaledToFill()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                
                VStack(spacing: 16) {
                    HStack(spacing: 7) {
                        ForEach(Array(stories.enumerated()), id: \.element) { index, storie in
                            StoryProgressView(currentIndex: $currentIndex, index: index)
                        }
                    }
                    
                    HStack(alignment: .center) {
                        KFImage(URL(string: user.profilePicture!))
                            .profileImageModifier(width: 40, height: 40)
                        
                        Text(user.userName)
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .semibold))

                        
                        Text("19h")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .regular))

                        Spacer()
                        
                        HStack(alignment: .center, spacing: 16) {
                            Image(systemName: "ellipsis")
                                .frame(width: 20, height: 20)
                                .foregroundColor(.white)
                            
                            Button {
                                show = false
                            } label: {
                                Image(systemName: "xmark")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.white)
                            }

                        }
                    }
                }
                .padding(.top, 8)
                .padding(.horizontal)
            }
            
            
            
            
            HStack(spacing: 20) {
                Text("Envoyer un message")
                    .foregroundColor(Color.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical, 12)
                    .padding(.horizontal, 24)
                    .overlay(
                        Capsule()
                            .strokeBorder(Color.gray,lineWidth: 1)
                    )
                
                Button(action: {}) {
                    Image(systemName: "heart")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .font(Font.title.weight(.semibold))
                        .tint(Color.white)
                }
                Button(action: {}) {
                    Image(systemName: "paperplane")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .font(Font.title.weight(.semibold))
                        .tint(Color.white)
                }
            }
            .padding(.horizontal, 24)
            
        }
        .background(Color.black)
    }
}
