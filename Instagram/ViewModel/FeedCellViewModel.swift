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
        getLikes()
        checkIfUserLikePost()
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
                    .setData([:]) {_ in
                        self.getLikes()
                        self.checkIfUserLikePost()
                        NotificationViewModel.uploadNotification(toUid: self.post.ownerUid, type: .like, post: self.post)
                    }
        }
        
    }
    
    func unlike(){
        guard let uid = AuthViewModel.shared.user?.id else { return }
        guard let postID = self.post.id else { return }
        
        FIRESTORE_POSTS_COLLECTION
            .document(postID)
            .collection(FIRESTORE_POST_LIKES_COLLECTION)
            .document(uid)
            .delete { _ in
                
                FIRESTORE_USERS_COLLECTION
                    .document(uid)
                    .collection(FIRESTORE_USER_LIKES_COLLECTION)
                    .document(postID)
                    .delete {_ in
                        self.getLikes()
                        self.checkIfUserLikePost()
                    }
            }
        
    }
    
    func getLikes(){
        guard let postID = post.id else { return }
        FIRESTORE_POSTS_COLLECTION
            .document(postID)
            .collection(FIRESTORE_POST_LIKES_COLLECTION)
            .getDocuments { snapshot, error in
                if(error != nil){ print(error as Any) }
                self.post.likes = snapshot?.documents.count ?? 0
            }
    }
    
    func checkIfUserLikePost(){
        guard let uid = AuthViewModel.shared.user?.id else { return }
        guard let postID = post.id else { return }

        FIRESTORE_POSTS_COLLECTION
            .document(postID)
            .collection(FIRESTORE_POST_LIKES_COLLECTION)
            .document(uid)
            .getDocument { snapshot, error in
                if(error != nil){ print(error as Any) }
                
                self.post.didLike = snapshot?.data() != nil
               
            }
    }
}
