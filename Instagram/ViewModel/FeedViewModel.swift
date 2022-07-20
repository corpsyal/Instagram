//
//  FeedViewModel.swift
//  Instagram
//
//  Created by Anthony Lahlah on 24.05.22.
//

import Foundation

enum FeedViewType: Equatable {
    case all
    case profile(String)
}


class FeedViewModel: ObservableObject {
    @Published var posts: [Post] = []
    private let uid: String?
    
    init(config: FeedViewType){
        switch config {
        case .all:
            self.uid = nil
        case .profile(let uid):
            self.uid = uid
        }
        
        fetchPosts()
    }
    
    func fetchPosts(done: (() -> Void)? = nil ) {
        if let uid = self.uid {
            fetchPostForUser(uid: uid, done: done)
        } else {
            fetchAllPosts(done: done)
        }
    }
    
    private func fetchAllPosts(done: (() -> Void)? = nil ){
        print("Fetching posts...")
        FIRESTORE_POSTS_COLLECTION.order(by: "timestamp", descending: true).getDocuments { snapshots, _ in
            guard let documents = snapshots?.documents else { return }
            
            self.posts = documents.compactMap({ snapshop in
                return try! snapshop.data(as: Post.self)
            })
            
            if let done = done {
                done()
            }
        }
    }
    
    private func fetchPostForUser(uid: String, done: (() -> Void)? = nil) {
        print("Fetching posts for uid \(uid)")
        FIRESTORE_POSTS_COLLECTION
            .whereField("ownerUid", isEqualTo: uid)
            .getDocuments { snapshots, _ in
                guard let documents = snapshots?.documents else { return }
                
                self.posts = documents.compactMap({ snapshop in
                    return try! snapshop.data(as: Post.self)
                }).sorted(by: { $0.timestamp.compare($1.timestamp) == .orderedDescending })
                
                if let done = done {
                    done()
                }
            }
    }
}
