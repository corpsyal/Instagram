//
//  StoryProgressView.swift
//  Instagram
//
//  Created by Anthony Lahlah on 05.07.22.
//

import SwiftUI

struct StoryProgressView: View {
    @Binding var currentIndex: Int
    @State var index: Int
    @State private var progress: Double = 0

    
    var body: some View {
        Rectangle()
            .fill(Color(0xcdcdcd))
            .frame(maxWidth: UIScreen.main.bounds.width / 2)
            .frame(height: 2)
            .overlay(alignment: .leading) {
                Rectangle()
                    .fill(Color(0xf2f2f2))
                    .frame(maxWidth: progress)
                    .animationObserver(for: progress, onComplete: {
                        currentIndex += 1
                    })
                    .animation(.linear(duration: 3), value: progress)
            }
            .clipShape(Capsule())
            .opacity(0.8)
            .onChange(of: currentIndex) { newCurrentIndex in
                if newCurrentIndex == index {
                    progress = .infinity
                }
            }
            .onAppear {
                if currentIndex == index {
                    progress = .infinity
                }
            }
        
    }
}

