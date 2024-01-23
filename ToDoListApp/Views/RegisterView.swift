//
//  RegisterView.swift
//  ToDoListApp
//
//  Created by Sonoma on 23/01/24.
//

import SwiftUI

struct RegisterView: View {
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    var body: some View {
        VStack{
            //Header
            HeaderView(title: "Resgister", subTitle: "Start Organizing Todo's", degree: -15, bgColor: Color.orange)
            //Register Form
            Form{
                HStack {
                    Image(systemName: "person.fill")
                        .foregroundColor(.orange)
                    TextField("Enter your name", text: $name)
                        .padding(10)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(5)
                }
                
                HStack {
                    Image(systemName: "mail.fill")
                        .foregroundColor(.orange)
                    TextField("User Email", text: $email)
                        .padding(10)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(5)
                }
                
                HStack {
                    Image(systemName: "key.horizontal.fill")
                        .foregroundColor(.orange)
                    TextField("password", text: $password)
                        .padding(10)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(5)
                }
                
                TLButton(title: "Create Account", bgColor: Color.orange, action: {
                    print("login")
                })
                .padding()
            }
        }
        
        Spacer()
    }
}

#Preview {
    RegisterView()
}
