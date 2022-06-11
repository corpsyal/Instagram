//
//  TextArea.swift
//  Instagram
//
//  Created by Anthony Lahlah on 17.05.22.
//

import SwiftUI

struct TextArea: View {
    @Binding var text: String
    let placeholder: String
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            
            if text.isEmpty {
                Text(placeholder)
                    .foregroundColor(Color(UIColor.placeholderText))
                    .padding(.top, 8)
                    .padding(.leading, 4)
            }
            
            TextEditor(text: $text)
                .frame(height: 100)
                
                
        }.font(.body)
        
    }
}
