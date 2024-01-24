//
//  LoginViewViewModel.swift
//  ToDoListApp
//
//  Created by Sonoma on 23/01/24.
//

import Foundation
import FirebaseAuth

class LoginViewViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {}
    
    func login(){
        guard validate() else {
            return
        }
        ///Try Login
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    func validate() -> Bool{
        self.errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty ,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            self.errorMessage = "Please Fill in all fields."
            return false
        }
        
        ///email@foo.com
        
        guard email.contains("@") && email.contains(".") else {
            self.errorMessage = "Please enter valid email."
            return false
        }
        
        return true
    }
}
