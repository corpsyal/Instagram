//
//  CustomTextField.swift
//  Instagram
//
//  Created by Anthony Lahlah on 19.03.22.
//

import SwiftUI

struct CustomTextField: View {
    
    @Binding var text: String
    let placeHolder: Text
    let imageName: String
    var isSecureField: Bool = false
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                placeHolder
                    .foregroundColor(Color.init(white: 1, opacity: 0.8))
                    .padding(.leading, 30)
                
            }
            HStack {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.white)
                
                if isSecureField {
                    SecureField("", text: $text)
                } else {
                    TextField("", text: $text)
                }
                    
            }
        }
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(text: .constant("Email"), placeHolder: Text("Test"), imageName: "envelop")
    }
}
