//
//  ProfileView.swift
//  ToDoListApp
//
//  Created by Sonoma on 23/01/24.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewViewModel()
    
    
    var body: some View {
        NavigationStack{
            VStack{
                if let user = viewModel.user {
                    profile(user: user)
                }
                else{
                    Text("Loading Profile...")
                }
            }.offset(y: 100)
                .navigationTitle("Profile")
        }.onAppear{
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user : User ) -> some View {
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 125,height: 125)
            .foregroundStyle(Color.pink)
        //Info : Name, Email, Member since
        
        VStack(alignment: .leading){
            HStack{
                Text("Name:")
                    .bold()
                Text(user.name)
            }.padding()
            
            HStack{
                Text("Email:")
                    .bold()
                Text(user.email)
            }.padding()
            
            HStack{
                Text("Member Since:")
                    .bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }.padding()
        }
        .padding()
        // Sign out
        
        Button("LogOut") {
            viewModel.logOut()
        }
        .tint(Color.red)
        .padding()
        Spacer()
    }
}

#Preview {
    ProfileView()
}
