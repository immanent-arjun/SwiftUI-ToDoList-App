//
//  MainViewViewModel.swift
//  ToDoListApp
//
//  Created by Sonoma on 23/01/24.
//

import Foundation
import FirebaseAuth

class MainViewViewModel: ObservableObject {
    
    @Published var currentUserId = ""
    
    private var  handler: AuthStateDidChangeListenerHandle?
    
    init(){
        self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
        }
    }
    
    public var isSignIn: Bool {
        return Auth.auth().currentUser != nil
    }
}
