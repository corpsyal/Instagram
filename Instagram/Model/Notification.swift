//
//  Notification.swift
//  Instagram
//
//  Created by Anthony Lahlah on 20.06.22.
//

import FirebaseFirestoreSwift // for @DocumentID
import Firebase


struct Notification: Decodable, Identifiable {
    
    @DocumentID var id: String?
    
    var postID: String?
    let profilePicture: String
    let timestamp: Timestamp
    let type: NotificationType
    let fromUid: String
    let toUid: String
    let username: String
    
    
    func toDictionnary() -> [String: Any] {
        return [
            "postID": postID ?? "",
            "profilePicture": profilePicture,
            "timestamp": timestamp,
            "type": type.rawValue,
            "fromUid": fromUid,
            "toUid": toUid,
            "username": username,
        ]
    }
    
    func fetchPost(){
        
    }
}

extension Notification {
    init(toUid: String, type: NotificationType, user: User, post: Post?) {
        self.postID = post?.id
        self.profilePicture = user.profilePicture ?? ""
        self.timestamp = Timestamp(date: Date())
        self.type = type
        self.fromUid = user.id!
        self.toUid = toUid
        self.username = user.userName
    }
}

enum NotificationType: Int, Decodable {
    case like
    case comment
    case follow
    
    var notificationMessage: String {
        switch self {
        case .like:
            return "liked one of your posts"
        case .comment:
            return "commented on one of your posts"
        case .follow:
            return "started following"
        }
    }
}
