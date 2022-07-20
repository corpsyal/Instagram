//
//  PostService.swift
//  Instagram
//
//  Created by Anthony Lahlah on 11.07.22.
//

import FirebaseFirestoreSwift
import Firebase


struct PostService {
    static func fetchFromUid(uid: String, completion: @escaping (Post) -> Void ) {
        FIRESTORE_POSTS_COLLECTION.document(uid).getDocument { snapshot, error in
            guard let snapshot = snapshot else { return }
            
            let post = try! snapshot.data(as: Post.self)
            
            completion(post)
        }
    }
}
