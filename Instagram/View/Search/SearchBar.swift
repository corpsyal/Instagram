//
//  SearchBar.swift
//  Instagram
//
//  Created by Anthony Lahlah on 08.03.22.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    @Binding var isEditing: Bool
//    @FocusState private var focusField: Bool
    
    var body: some View {
        HStack {
            TextField("Search...", text: $text)
//                .focused($focusField)
                .padding(8)
                .padding(.horizontal, 24)
                .background(Color(UIColor.systemGray6))
                .overlay(
                    Image(systemName: "magnifyingglass")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 8)
                    
                )
                .cornerRadius(20)
                .onTapGesture {
                    isEditing = true
                }
                .animation(.linear(duration: 0.2), value: 1)
            
            
            if(isEditing){
                Button(action: {
                    isEditing = false
//                    focusField = false
                    UIApplication.shared.endEditing()
                    
                }, label: {
                    Text("Cancel")
                })
                    .transition(.move(edge: .trailing))
                    .animation(.linear(duration: 0.2), value: 1)
            }
            
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant("Search..."), isEditing: .constant(false))
    }
}
