//
//  DefaultNavigationBar.swift
//  Instagram
//
//  Created by Anthony Lahlah on 21.03.22.
//

import Foundation
import SwiftUI

struct DefaultNavigationBar: ViewModifier {
    func body(content: Content) -> some View {
        content
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image("Instagram_logo")
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(.primary)
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 200, maxHeight: 100, alignment: .leading)
                    
                    
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 20) {
                        Button(action: {}) {
                            Image(systemName: "plus.square")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .font(Font.title.weight(.semibold))
                                .tint(Color.primary)
                        }
                        Button(action: {}) {
                            Image(systemName: "heart")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .font(Font.title.weight(.semibold))
                                .tint(Color.primary)
                        }
                        Button(action: {}) {
                            Image(systemName: "paperplane")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .font(Font.title.weight(.semibold))
                                .tint(Color.primary)
                        }
                    }
                }
            }
    }
}
