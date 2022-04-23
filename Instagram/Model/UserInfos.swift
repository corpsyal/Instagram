//
//  UserInfos.swift
//  Instagram
//
//  Created by Anthony Lahlah on 19.04.22.
//

import Foundation


struct UserInfos {
    let profilePictureUrl: String?
    var profilePictureData: Data?
    
    
    init(_ dictionnary: [String: Any]){
        profilePictureUrl = dictionnary["profilePicture"] as? String ?? nil
        fetchProfilePicture()
    }
    
      mutating func fetchProfilePicture(){
        guard let url = profilePictureUrl else { return }
        if let data = try? Data(contentsOf: URL(string: url)!) {
            profilePictureData = data
        }
    }
}
