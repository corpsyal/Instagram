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
