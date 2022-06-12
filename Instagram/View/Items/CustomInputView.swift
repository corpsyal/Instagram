//
//  CustomInputView.swift
//  Instagram
//
//  Created by Anthony Lahlah on 12.06.22.
//

import SwiftUI

struct CustomInputView: View {
    @Binding var inputText: String
    let action: () -> Void
    
    var body: some View {
        
        VStack(spacing: 0) {
            Rectangle()
                .foregroundColor(.gray)
                .frame(width: UIScreen.main.bounds.width, height: 0.75)
                
            
            HStack {
                TextField("Comments...", text: $inputText)
                    .textFieldStyle(.plain)
                    .frame(minHeight: 30)
                    
                Button(action: action) {
                    Text("Send").fontWeight(.semibold)
                }

            }
            .padding(.horizontal)
            .padding(.vertical, 8)
            
        }
    }
}

