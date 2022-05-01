//
//  UserInfos.swift
//  Instagram
//
//  Created by Anthony Lahlah on 19.04.22.
//

import Foundation
import FirebaseFirestoreSwift


struct User: Identifiable, Decodable {
    let email: String
    var fullName: String
    let userName: String
    var profilePicture: String?
    var profilePictureData: Data?
    @DocumentID var id: String?
    var isFollowed: Bool?
    
    var isCurrentUser: Bool {
        return AuthViewModel.shared.userInfos?.id == id
    }
    
     
    mutating func initProfilePicture(){
        guard let url = profilePicture else { return }
        if let data = try? Data(contentsOf: URL(string: url)!) {
            profilePictureData = data
        }
    }
}
