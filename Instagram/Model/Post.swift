//
//  Post.swift
//  Instagram
//
//  Created by Anthony Lahlah on 24.05.22.
//

import FirebaseFirestoreSwift
import Firebase

struct Post: Identifiable, Decodable {
    @DocumentID var id: String?
    
    let caption: String
    let imageUrl: String
    let ownerUid: String
    let ownerUsername: String
    let ownerImageUrl: String
    let timestamp: Timestamp
    
    var likes: Int? = 0
    var didLike: Bool? = false
}

