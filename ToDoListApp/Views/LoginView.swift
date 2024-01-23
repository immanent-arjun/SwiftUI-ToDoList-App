//
//  LoginView.swift
//  ToDoListApp
//
//  Created by Sonoma on 23/01/24.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        NavigationStack{
            VStack{
                //Header
                HeaderView(title: "To Do List", subTitle: "Get Things Done", degree: 15, bgColor: Color.pink)
                
                //Login Form
                Form{
                    HStack {
                        Image(systemName: "mail.fill")
                            .foregroundColor(.pink)
                        TextField("User Email", text: $email)
                            .padding(10)
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(5)
                    }
                    HStack {
                        Image(systemName: "key.horizontal.fill")
                            .foregroundColor(.pink)
                        TextField("password", text: $password)
                            .padding(10)
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(5)
                    }
                    TLButton(title: "Log In",
                             bgColor: Color.pink)
                    {
                        print("login")
                    }
                    .padding()
                }
                
                //Create Account
                VStack(spacing:10){
                    Text("New arround here?")
                        .padding(.top,10)
                    NavigationLink("Create An Account"){
                        RegisterView()
                    }
                    .foregroundStyle(Color.pink)
                }
                .padding(.bottom,50)
                Spacer()
            }.padding(.top,40)
        }
    }
}

#Preview {
    LoginView()
}
