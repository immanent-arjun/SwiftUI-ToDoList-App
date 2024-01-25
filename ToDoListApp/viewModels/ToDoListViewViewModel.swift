//
//  ToDoListViewViewModel.swift
//  ToDoListApp
//
//  Created by Sonoma on 23/01/24.
//

import Foundation
import FirebaseFirestore
///viewModel for list of items view
///primiary tab
///
class ToDoListViewViewModel: ObservableObject {
     
    @Published var showingNewItemView = false
    private let userId: String
    
    init (userId: String){
        self.userId = userId
    }
    
    ///delete to list item
    /// -parameter id: item id to delete 
    func delete(id: String) {
        let db = Firestore.firestore()
        db.collection("Users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
    
}
