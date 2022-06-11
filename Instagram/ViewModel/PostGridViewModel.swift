//
//  PostGridViewModel.swift
//  Instagram
//
//  Created by Anthony Lahlah on 30.05.22.
//

import Foundation
import FirebaseFirestore

enum PostGridType {
    case explore
    case profile(String)
}

class PostGridViewModel: ObservableObject {
    @Published var posts: [Post] = []
    
    init(config: PostGridType){
        fetchPosts(type: config)
    }
    
    func fetchPosts(type: PostGridType){
        switch type {
            case .explore:
                fetchExplorePosts()
            case .profile(let uid):
                fetchPosts(uid: uid)
        }
    }
    
    private func fetchExplorePosts(){
        FIRESTORE_POSTS_COLLECTION
            .order(by: "timestamp", descending: true)
            .getDocuments { snapshots, _ in
            guard let documents = snapshots?.documents else { return }
            
            self.posts = documents.compactMap({ snapshop in
                return try! snapshop.data(as: Post.self)
            })
        }
    }
    
    private func fetchPosts(uid: String){
        print(uid, "UID")
        FIRESTORE_POSTS_COLLECTION
            .whereField("ownerUid", isEqualTo: uid)
            .getDocuments { snapshots, _ in
            guard let documents = snapshots?.documents else { return }
            
            self.posts = documents.compactMap({ snapshop in
                return try! snapshop.data(as: Post.self)
            }).sorted(by: { $0.timestamp.compare($1.timestamp) == .orderedDescending })
        }
    }
}
