//
//  ToDoListView.swift
//  ToDoListApp
//
//  Created by Sonoma on 23/01/24.
//

import SwiftUI

struct ToDoListView: View {
    
    @StateObject var viewModel = ToDoListViewViewModel()
    private let userId: String
    
    init(userId: String){
        self.userId = userId
    }
    
    var body: some View {
        NavigationStack{
            VStack{
                
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button {
                    viewModel.showingNewItemView = true
                }label: {
                    Image(systemName: "plus")
                }
            }.sheet(isPresented: $viewModel.showingNewItemView){
                NewItemsView(newItemPresented:
                             $viewModel.showingNewItemView)
            }
        }
    }
}

#Preview {
    ToDoListView(userId: "")
}
