//
//  NotificationViewModel.swift
//  Instagram
//
//  Created by Anthony Lahlah on 20.06.22.
//

import Foundation
import Firebase

class NotificationViewModel: ObservableObject {
    @Published var notifications: [Notification] = []
    
    func fetchNotifications(){
        
    }
    
    static func uploadNotification(toUid: String, type: NotificationType, post: Post?){
        guard let user = AuthViewModel.shared.user else { return }
        
        let notification = Notification(toUid: toUid, type: type, user: user, post: post)
        
        let data = notification.toDictionnary()
        
        FIRESTORE_USERS_COLLECTION
            .document(toUid)
            .collection(FIRESTORE_USER_NOTIFICATIONS_COLLECTION)
            .addDocument(data: data)
        
        
//        let notification = Notification(
//            postID: post?.id,
//            profilePicture: user.profilePicture ?? "",
//            timestamp: Timestamp(date: Date()),
//            type: type,
//            uid: uid,
//            username: user.userName
//        )
    }
}
