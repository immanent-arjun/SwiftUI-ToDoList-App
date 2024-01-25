//
//  ToDoListItemViewViewModel.swift
//  ToDoListApp
//
//  Created by Sonoma on 23/01/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

///viewModel for single to do list item(each row in items list )

class ToDoListItemViewViewModel: ObservableObject {
    
    init (){}
    
    func toggleIsDone(item: ToDoListItem){
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        guard let uId = Auth.auth().currentUser?.uid else {return}
        let db = Firestore.firestore()
        db.collection("Users")
            .document(uId)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
        
    }
    
    
}
