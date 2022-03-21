//
//  AuthViewModel.swift
//  Instagram
//
//  Created by Anthony Lahlah on 21.03.22.
//

import Foundation
import Firebase

class AuthViewModel: ObservableObject {
    
    @Published var userSession: User?
    
    static let shared = AuthViewModel()
    
    init(){
        print("AuthViewModel init !")
        userSession = Auth.auth().currentUser
    }
    
    func login(email: String, password: String){
        print(email)
        print(password)
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let user = authResult?.user else { return }
            self.userSession = user
        }
    }
    
    func signout(){
        userSession = nil
        try? Auth.auth().signOut()
    }
    
}
