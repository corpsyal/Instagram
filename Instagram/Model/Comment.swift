//
//  Comment.swift
//  Instagram
//
//  Created by Anthony Lahlah on 12.06.22.
//

import FirebaseFirestoreSwift
import Firebase

struct Comment: Identifiable, Decodable {
    @DocumentID var id: String?
    
    let username: String
    let uid: String
    let timestamp: Timestamp
    let profilePicture: String
    let comment: String
    let postOwnerUid: String
}
