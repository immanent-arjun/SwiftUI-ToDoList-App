//
//  ContentView.swift
//  ToDoListApp
//
//  Created by Sonoma on 23/01/24.
//


import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        if viewModel.isSignIn , !viewModel.currentUserId.isEmpty {
            accountView
        }else {
            LoginView()
        }
    }
    
    @ViewBuilder
    var accountView: some View {
        TabView{
            ToDoListView(userId: viewModel.currentUserId)
                .tabItem {
                    Label("Home",systemImage: "house")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profile" , systemImage: "person.circle")
                }
        }
        .accentColor(Color.pink)
    }
}

#Preview {
    MainView()
}
