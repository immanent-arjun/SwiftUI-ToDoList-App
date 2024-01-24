//
//  ToDoListViewViewModel.swift
//  ToDoListApp
//
//  Created by Sonoma on 23/01/24.
//

import Foundation
///viewModel for list of items view
///primiary tab
///
class ToDoListViewViewModel: ObservableObject {
     
    @Published var showingNewItemView = false
    
    init (){}
}
