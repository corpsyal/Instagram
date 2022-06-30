//
//  ImageUploader.swift
//  Instagram
//
//  Created by Anthony Lahlah on 30.03.22.
//

import UIKit
import Firebase

struct ImageFromPicker {
    var name: String
    var pathExtension: String
    var uiImage: UIImage
}

enum UploadType {
    case profile
    case post
    
    func filePath(fileName: String) -> StorageReference {
        switch self {
        case .profile:
            return Storage.storage().reference(withPath: "/profile_images/\(fileName)")
        case .post:
            return Storage.storage().reference(withPath: "/post_images/\(fileName)")
        }
    }
}

struct ImageUploader {
    static func uploadImage(image pickedImage: ImageFromPicker, type: UploadType, completion: @escaping (String) -> Void){
        
        guard let imageData: Data = pickedImage.uiImage.jpegData(compressionQuality: 0.2) else { return }
        let fileName = "\(NSUUID().uuidString).\(pickedImage.pathExtension)"
        
        
        let ref = type.filePath(fileName: fileName)
        
        ref.putData(imageData, metadata: nil) { metaData, error in
            if error != nil {
//                print("DEBUG error in upload image: \(error?.localizedDescription)")
                return
            }
            
            ref.downloadURL { url, _ in
                guard let imageUrl = url?.absoluteString else { return }
                completion(imageUrl)
            }
        }
    }
}
