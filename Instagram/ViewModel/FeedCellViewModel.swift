//
//  FeedCellViewModel.swift
//  Instagram
//
//  Created by Anthony Lahlah on 11.06.22.
//

import Foundation

class FeedCellViewModel: ObservableObject {
    @Published var post: Post
    
    init(post: Post){
        self.post = post
    }
    
    func like(){
        guard let uid = AuthViewModel.shared.user?.id else { return }
        guard let postID = self.post.id else { return }
        
        print("LIKE \(String(describing: post.id))")
        FIRESTORE_POSTS_COLLECTION
            .document(postID)
            .collection(FIRESTORE_POST_LIKES_COLLECTION)
            .document(uid)
            .setData([:]) {_ in
                
                FIRESTORE_USERS_COLLECTION
                    .document(uid)
                    .collection(FIRESTORE_USER_LIKES_COLLECTION)
                    .document(postID)
                    .setData([:])
        }
        
    }
    
    func unlike(){
        print("UNLIKE \(String(describing: post.id))")
        
    }
    
    func checkIfUserLikePost(){
        
    }
}
