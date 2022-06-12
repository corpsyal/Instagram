//
//  CustomInputView.swift
//  Instagram
//
//  Created by Anthony Lahlah on 12.06.22.
//

import SwiftUI

struct CustomInputView: View {
    @Binding var inputText: String
    var body: some View {
        
        VStack(spacing: 0) {
            Rectangle()
                .foregroundColor(.gray)
                .frame(width: UIScreen.main.bounds.width, height: 0.75)
                
            
            HStack {
                TextField("Comments...", text: $inputText)
                    .textFieldStyle(.plain)
                    .frame(minHeight: 30)
                    
                Button {
                    print("Send")
                } label: {
                    Text("Send")
                }

            }
            .padding(.horizontal)
            .padding(.vertical, 8)
            
        }
    }
}

