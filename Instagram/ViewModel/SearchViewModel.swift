//
//  SearchViewModel.swift
//  Instagram
//
//  Created by Anthony Lahlah on 23.04.22.
//

import Foundation


class SearchViewModel: ObservableObject {
    @Published var users: [User] = []
    
    init(){
//        Timer.scheduledTimer(withTimeInterval: 10.0, repeats: false) { (timer) in
//            print("HERE !!")
//            self.users = [User(email: "toto@gg.fr", fullName: "test", profilePicture: "", profilePictureData: nil, id: "fjgdlkgjdlkgj")]
//        }
        
        fetchUsers()
    }
    
    
    func fetchUsers(){
        FIRESTORE_USERS_COLLECTION.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.users = documents.compactMap({ try? $0.data(as: User.self) })
        }
    }
    
    
    func filterUsers(query: String) -> [User] {
        if query.isEmpty { return users }
        
        let lowercasedQuery = query.lowercased()
        return users.filter({
            $0.fullName.lowercased().contains(lowercasedQuery) ||
            $0.userName.lowercased().contains(lowercasedQuery)
        })
    }
}
