//
//  UploadPostViewModel.swift
//  Instagram
//
//  Created by Anthony Lahlah on 16.05.22.
//

import Foundation
import Firebase


class UploadPostViewModel: ObservableObject {
    
    func uploadPost(image: ImageFromPicker, caption: String, completion: FireStoreCompletion = nil){
        guard let user = AuthViewModel.shared.user else { return }
        
        ImageUploader.uploadImage(image: image, type: .post) { url in
            print(url)
            
            let data: [String : Any] = [
                "caption": caption,
                "imageUrl": url,
                "likes": 0,
                "timestamp": Timestamp(date: Date()),
                "ownerUid": user.id!,
                "ownerUsername": user.userName,
                "ownerImageUrl": user.profilePicture ?? ""
            ]
            
            FIRESTORE_POSTS_COLLECTION.addDocument(data: data, completion: completion)
        }
    }
}
