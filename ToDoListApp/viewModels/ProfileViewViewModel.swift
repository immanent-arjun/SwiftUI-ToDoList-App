//
//  ProfileViewViewModel.swift
//  ToDoListApp
//
//  Created by Sonoma on 23/01/24.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class ProfileViewViewModel: ObservableObject {
    
    @Published var user: User?
    
    
    
    init (){}
    
    func fetchUser(){
        guard let userId = Auth.auth().currentUser?.uid else {return}
        let db = Firestore.firestore()
        db.collection("Users").document(userId).getDocument { [weak self] sanpshot, error in
            
            guard let data = sanpshot?.data() , error == nil else {return}
            
            DispatchQueue.main.async {
                self?.user = User(
                    id: data["id"] as? String ?? "",
                    name: data["name"] as? String ?? "",
                    email: data["email"] as? String ?? "",
                    joined: data["joined"] as? TimeInterval ?? 0)
            }
            
        }
        
    }
    
    func logOut(){
        do{
            try Auth.auth().signOut()
        }catch {
            print(error)
        }
    }
    
}
