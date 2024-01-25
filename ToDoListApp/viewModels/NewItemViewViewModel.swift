//
//  NewItemViewViewModel.swift
//  ToDoListApp
//
//  Created by Sonoma on 23/01/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class NewItemViewViewModel: ObservableObject {
     
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    
    init (){}
    
    func save(){
        guard canSave else {
            return
        }
        ///Get current user id
        guard let uId = Auth.auth().currentUser?.uid else {return}
        
        ///create model
        let newId = UUID().uuidString
        let newItems = ToDoListItem(id: newId,
                                   title: title,
                                   dueDate: dueDate.timeIntervalSince1970,
                                   createDate: Date().timeIntervalSince1970,
                                   isDone: false)
        
        
        ///save model
        let db = Firestore.firestore()
        db.collection("Users")
            .document(uId)
            .collection("todos")
            .document(newId)
            .setData(newItems.asDictionary())
        
    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        return true
    }
}
