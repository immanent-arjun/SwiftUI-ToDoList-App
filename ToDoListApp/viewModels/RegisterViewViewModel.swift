//
//  RegisterViewViewModel.swift
//  ToDoListApp
//
//  Created by Sonoma on 23/01/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class RegisterViewViewModel: ObservableObject {
    
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {}
    
    func registerUser(){
        
        guard validate() else {
            return 
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let userId = result?.user.uid else {
                return
            }
            self?.insertUserRecord(id: userId)
        }
    }
    
    private func insertUserRecord(id: String) {
        let newUser = User(id: id,
                           name: name,
                           email: email,
                           joined: Date().timeIntervalSince1970)
        let db = Firestore.firestore()
        db.collection("Users")
            .document(id)
            .setData(newUser.asDictionary())
    }
    
    
    func validate() -> Bool{
        self.errorMessage = ""
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty ,
              !email.trimmingCharacters(in: .whitespaces).isEmpty ,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            self.errorMessage = "Please Fill in all fields."
            return false
        }
        
        ///email@foo.com
        guard email.contains("@") && email.contains(".") else {
            self.errorMessage = "Please enter valid email."
            return false
        }
        
        guard password.count >= 6 else {
            self.errorMessage = "Please enter minimum 7 charcters"
            return false
        }
        
        return true
    }
    
}
