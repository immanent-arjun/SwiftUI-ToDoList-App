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
    @Published var showAlert: Bool = false
    @Published var alertMessage: String = ""
    init() {}
    
    func login(){
        guard validate() else {
            return
        }
        ///Try Login
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            
            guard let self = self else { return }
            
            if let error = error {
                self.errorMessage = "worng! email or password"
                return
            }
        }
        
    }
    
    func resetPassword() {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            if let error = error {
                self.alertMessage = "Error: \(error.localizedDescription)"
            } else {
                self.alertMessage = "Password reset email sent. Check your inbox."
            }
            self.showAlert = true
        }
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
