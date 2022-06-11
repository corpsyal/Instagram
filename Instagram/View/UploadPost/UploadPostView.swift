//
//  UploadPostView.swift
//  Instagram
//
//  Created by Anthony Lahlah on 06.03.22.
//

import SwiftUI

struct UploadPostView: View {
    @State private var selectedImage: ImageFromPicker?
//    @State private var postImage: Image?
    @State private var caption: String = ""
    @State private var presentImagePicker = false
    @ObservedObject var viewModel = UploadPostViewModel()
    @Binding var currentTab: MainTabs
    
    func uploadPost(){
        UIApplication.shared.sendAction(
            #selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil
        )
        
        guard let image = selectedImage else { return }
        
        viewModel.uploadPost(image: image, caption: caption) { _ in
            cleanView()
            currentTab = .home
        }
    }
    
    func cleanView(){
        caption = ""
        selectedImage = nil
    }
    
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
                    Image(uiImage: selectedImage!.uiImage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 80, height: 80)
                        .clipped()
                        
                    
//                    if caption == "" {
//                        TextField("Enter your caption here...", text: $caption)
//                    } else {
//                        TextEditor(text: $caption)
//                            .frame(maxHeight: 100)
//                    }
                    
                    TextArea(text: $caption, placeholder: "Enter your caption here...")
                    
                }
                
                Button {
                    uploadPost()
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
        })
        .onDisappear {
            cleanView()
        }
    }
}

//struct UploadPostView_Previews: PreviewProvider {
//    static var previews: some View {
//        UploadPostView()
//    }
//}
