//
//  StoryCell.swift
//  Instagram
//
//  Created by Anthony Lahlah on 02.07.22.
//

import SwiftUI
import Kingfisher

extension Color {
    init(_ hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xFF) / 255,
            green: Double((hex >> 8) & 0xFF) / 255,
            blue: Double(hex & 0xFF) / 255,
            opacity: alpha
        )
    }
}

struct StoryCell: View {
    
    @State var show: Bool = false
    let user: User
    
    var body: some View {
        VStack {
            Circle()
                .fill(LinearGradient(colors: [Color(0xFEDA77), Color(0xF58529), Color(0xDD2A7B), Color(0x8134AF)], startPoint: .bottomLeading, endPoint: .topTrailing))
                .frame(width: 75, height: 75)
                .overlay {
                    Circle()
                        .fill(Color(UIColor.systemBackground))
                        .frame(width: 70, height: 70)
                        .overlay {
                            Circle()
                                .frame(width: 65, height: 65)
                                .overlay {
                                    KFImage(URL(string: user.profilePicture!))
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 65, height: 65)
                                        .clipShape(Circle())
                                }
                        }
                    
                }
                .onTapGesture {
                    show = true
                }
            
            Text(user.userName)
                .font(.system(size: 12, weight: .regular))
                .foregroundColor(.primary)
        }
        .fullScreenCover(isPresented: $show) {
            StoryView(show: $show, user: user)
        }
    }
}

