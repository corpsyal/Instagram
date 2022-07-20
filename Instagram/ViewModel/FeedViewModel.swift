//
//  FeedViewModel.swift
//  Instagram
//
//  Created by Anthony Lahlah on 24.05.22.
//

import Foundation


class FeedViewModel: ObservableObject {
    @Published var posts: [Post] = []
    
    init(){
        fetchPosts()
    }
    
    func fetchPosts(done: (() -> Void)? = nil ){
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
    
    func fetchPost
}
