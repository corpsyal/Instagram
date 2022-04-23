//
//  ProfileHeaderView.swift
//  Instagram
//
//  Created by Anthony Lahlah on 12.03.22.
//

import SwiftUI

struct ProfileHeaderView: View {
    @EnvironmentObject private var auth: AuthViewModel
    @State private var showImagePicker = false
    @State private var selectedImage: ImageFromPicker?
    
    func printv(_ data: Any) -> some View {
        print(data)
        return EmptyView()
    }

    
    private var ProfilePicture: Image  {
        guard let imageData = auth.userInfos?.profilePictureData else {
            return Image("joker")
        }
        
        return Image(uiImage: UIImage(data: imageData)!)
        
    }
    
    func uploadNewImage(){
        guard let image = selectedImage else { return }
        ImageUploader.uploadImage(image: image) { imageUrl in
            auth.updateProfilePicture(urlString: imageUrl) {
                auth.fetchUserInfos()
            }
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Button {
                    showImagePicker = true
                } label: {
                    ProfilePicture
                        .resizable()
                        .scaledToFill()
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                }

                
                Spacer()
                
                HStack(spacing: 24) {
                    ProfileUserStatView(value: 200, title: "Posts")
                    ProfileUserStatView(value: 280, title: "Followers")
                    ProfileUserStatView(value: 50, title: "Following")
                }
            }
            
            Text("Jean Cocteau")
                .font(.system(size: 15, weight: .semibold))
//                .padding(.vertical, 8)
            
            Text("Une description de test")
                .font(.system(size: 15))
//                .padding(.vertical, 8)
            
            Button {
                auth.signout()
            } label: {
                Text("Logout")
            }

            
            Spacer()
            
            ProfileActionButtonView(isCurrentUser: true)
//            .border(Color.primary, width: 0.5)
//            .cornerRadius(2)

        }.sheet(isPresented: $showImagePicker, onDismiss: {
            uploadNewImage()
        }) {
            ImagePicker(image: $selectedImage)
        }

    }
}



struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView()
    }
}
