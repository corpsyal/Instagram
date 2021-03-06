//
//  UserService.swift
//  Instagram
//
//  Created by Anthony Lahlah on 01.05.22.
//

import Foundation

typealias FireStoreCompletion = ((Error?) -> Void)?

struct UserService {
    
    static func follow(uid: String, completion: FireStoreCompletion){
        guard let currentUid = AuthViewModel.shared.user?.id else { return }
        
        FIRESTORE_FOLLOWS_COLLECTION.document(uid).collection("followers").document(currentUid).setData([:]) { error in
            if (error != nil){
                print(error?.localizedDescription as Any)
            }
            
            FIRESTORE_FOLLOWS_COLLECTION.document(currentUid).collection("following")
                .document(uid).setData([:], completion: completion)
        }
    }
    
    static func unfollow(uid: String, completion: FireStoreCompletion) {
        guard let currentUid = AuthViewModel.shared.user?.id else { return }
        
        FIRESTORE_FOLLOWS_COLLECTION.document(uid).collection("followers").document(currentUid).delete { error in
            if (error != nil){
                print(error?.localizedDescription as Any)
            }
            
            FIRESTORE_FOLLOWS_COLLECTION.document(currentUid).collection("following").document(uid).delete(completion: completion)
        }
    }
    
    static func isFollowed(uid: String, completion: @escaping ((Bool)->Void)){
        guard let currentUid = AuthViewModel.shared.user?.id else { return }
        guard currentUid != uid else { return }
        
        let document = FIRESTORE_FOLLOWS_COLLECTION.document(currentUid).collection("following").document(uid)
        
        document.getDocument { document, error in
            if (error != nil){
                print(error?.localizedDescription as Any)
            }
            
            completion(document?.exists ?? false)
        }
    }
}
