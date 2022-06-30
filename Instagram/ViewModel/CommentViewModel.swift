//
//  CommentViewModel.swift
//  Instagram
//
//  Created by Anthony Lahlah on 12.06.22.
//

import Foundation
import FirebaseFirestore

class CommentViewModel: ObservableObject {
    private let post: Post
    @Published var comments: [Comment] = []
    
    init(post: Post){
        self.post = post
        fetchComments()
    }
    
    func uploadComment(commentText: String, completion: FireStoreCompletion){
        guard !commentText.isEmpty else { return }
        guard let user = AuthViewModel.shared.user else { return }
        
        let data: [String: Any] = [
            "username": user.userName,
            "uid": user.id!,
            "timestamp": Timestamp(date: Date()),
            "profilePicture": user.profilePicture ?? "",
            "comment": commentText,
            "postOwnerUid": post.ownerUid
        ]
        
        print(data)
        
        FIRESTORE_POSTS_COLLECTION
            .document(post.id!)
            .collection(FIRESTORE_POST_COMMENTS_COLLECTION)
            .addDocument(data: data) { error in
                NotificationViewModel.uploadNotification(toUid: self.post.ownerUid, type: .comment, post: self.post)
                
                if let completion = completion {
                    completion(error)
                }
            }
        
    }
    
    func fetchComments(){
        FIRESTORE_POSTS_COLLECTION
            .document(post.id!)
            .collection(FIRESTORE_POST_COMMENTS_COLLECTION)
            .order(by: "timestamp", descending: false)
            .getDocuments { snapshots, error in
                guard let documents = snapshots?.documents else { return }
                self.comments = documents.compactMap({ try! $0.data(as: Comment.self) })
            }
        
    }
}
