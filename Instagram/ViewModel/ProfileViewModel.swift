//
//  ProfileViewModel.swift
//  Instagram
//
//  Created by Anthony Lahlah on 01.05.22.
//

import SwiftUI

class ProfileViewModel: ObservableObject {
    @Published var user: User
    
    init(user: User){
        self.user = user
        checkIfUserIsFollowed()
//        test()
    }
    
    func follow(){
        guard let uid = user.id else { return }
        UserService.follow(uid: uid) { _ in
            self.checkIfUserIsFollowed()
        }
    }
    
    func unfollow(){
        print("Unfollow user...")
    }
    
    func checkIfUserIsFollowed(){
        guard let uid = user.id else { return }
        UserService.isFollowed(uid: uid) { isFollowed in
            self.user.isFollowed = isFollowed
        }
    }
    
    func test(){
        Timer.scheduledTimer(withTimeInterval: 10.0, repeats: false) { (timer) in
            self.user.fullName = "claude"
            print("LAAAA")
        }
    }
}
