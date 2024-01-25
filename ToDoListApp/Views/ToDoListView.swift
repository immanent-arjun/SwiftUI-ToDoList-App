//
//  ToDoListView.swift
//  ToDoListApp
//
//  Created by Sonoma on 23/01/24.
//

import SwiftUI
import FirebaseFirestoreSwift

struct ToDoListView: View {
    
    @StateObject var viewModel: ToDoListViewViewModel
    @FirestoreQuery var items: [ToDoListItem]
    
    init(userId: String){
        //Users/<id>/todos/entries
        self._items = FirestoreQuery(collectionPath: "Users/\(userId)/todos")
        self._viewModel = StateObject(wrappedValue:ToDoListViewViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationStack{
            VStack{
                List(items) { item in
                    ToDoListItemsView(item: item)
                        .swipeActions{
                            Button("Delete"){
                                viewModel.delete(id: item.id)
                            }.tint(.red)
                        }
                }
                .listStyle(PlainListStyle())
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
    ToDoListView(userId: "znuQJ75uLPfodJftCoCnhg4ySsi2")
}
