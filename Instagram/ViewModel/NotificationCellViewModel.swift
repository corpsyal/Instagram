//
//  NotificationCellViewModel.swift
//  Instagram
//
//  Created by Anthony Lahlah on 11.07.22.
//

import Foundation

class NotificationCellViewModel: ObservableObject {
    @Published var notification: Notification
    @Published var post: Post?
    
    init(notification: Notification){
        print("NOTIF")
        self.notification = notification
        fetchPost()
    }
    
    func fetchPost() {
        guard let postUid = notification.postID else { return }
        PostService.fetchFromUid(uid: postUid) { post in
            self.post = post
        }
    }
    
}
