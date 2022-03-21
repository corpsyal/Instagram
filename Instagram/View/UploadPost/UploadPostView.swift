//
//  UploadPostView.swift
//  Instagram
//
//  Created by Anthony Lahlah on 06.03.22.
//

import SwiftUI

struct UploadPostView: View {
    @State private var selectedImage: UIImage?
    @State private var postImage: Image?
    @State private var caption: String = ""
    @State private var presentImagePicker = false
    
    var body: some View {
        VStack {
            if(selectedImage == nil){
                Button {
                    presentImagePicker = true
                } label: {
                    Image(systemName: "plus.circle")
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 100, height: 100)
                        .foregroundColor(Color.primary)
                        .font(Font.title.weight(.thin))
                }
            } else {
                HStack(alignment: .top) {
                    Image(uiImage: selectedImage!)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 80, height: 80)
                        .clipped()
                        
                    
                    TextField("Enter your caption...", text: $caption)
                }
                
                Button {
                    
                } label: {
                    Text("Share")
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 12)
                        .background(Color(UIColor.systemBlue))
                        .cornerRadius(3)
                        
                }
                .padding(.top, 8)

            }
            
            Spacer()

        }
        .modifier(DefaultNavigationBar())
        .padding(16)
        .sheet(isPresented: $presentImagePicker, onDismiss: nil, content: {
            ImagePicker(image: $selectedImage)
        }).onDisappear {
            selectedImage = nil
        }
    }
}

struct UploadPostView_Previews: PreviewProvider {
    static var previews: some View {
        UploadPostView()
    }
}
