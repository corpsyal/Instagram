//
//  AuthViewModel.swift
//  Instagram
//
//  Created by Anthony Lahlah on 21.03.22.
//

import Foundation
import Firebase
import FirebaseFirestore

class AuthViewModel: ObservableObject {
    
    @Published var userSession: FirebaseAuth.User?
    @Published var userInfos: User? {
        didSet {
            print("DIDSET", userInfos)
        }
    }

    
    static let shared = AuthViewModel()
    
    init(){
        print("AuthViewModel init !")
        userSession = Auth.auth().currentUser
        fetchUserInfos()
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
            FIRESTORE_USERS_COLLECTION.document(user.uid).getDocument { snapshot, error in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                self.userSession = user
                self.fetchUserInfos()
            }
            
        }
    }
    
    func fetchUserInfos(){
        guard let uid = self.userSession?.uid else { return }
        FIRESTORE_USERS_COLLECTION.document(uid).getDocument { snapshot, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            var user = try! snapshot?.data(as: User.self)
            user?.initProfilePicture()
            self.userInfos = user
        }
    }

    
    func register(email: String, password: String, userName: String, fullName: String){
//        Auth.auth()
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let user = authResult?.user else { return }
            
            let data: [String: String] = ["email": email.lowercased(), "userName": userName, "fullName": fullName]
            
            FIRESTORE_USERS_COLLECTION.document(user.uid).setData(data) { error in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                
                self.userSession = user
            }
        }
    }
    
    func signout(){
        userSession = nil
        try? Auth.auth().signOut()
    }
    
    func updateProfilePicture(urlString: String, completion: @escaping () -> Void){
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        FIRESTORE_USERS_COLLECTION.document(uid).setData(["profilePicture": urlString], merge: true) { error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            completion()
        }
    }
    
}
