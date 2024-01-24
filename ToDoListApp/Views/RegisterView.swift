//
//  RegisterView.swift
//  ToDoListApp
//
//  Created by Sonoma on 23/01/24.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        VStack{
            //Header
            HeaderView(title: "Resgister", subTitle: "Start Organizing Todo's", degree: -15, bgColor: Color.orange)
            //Register Form
            Form{
                
                ///error message
                if !viewModel.errorMessage.isEmpty{
                    HStack {
                        Image(systemName: "exclamationmark.warninglight")
                            .foregroundColor(.pink)
                        Text(viewModel.errorMessage)
                            .foregroundStyle(Color.red)
                            .padding(4)
                    }
                }
                
                
                HStack {
                    Image(systemName: "person.fill")
                        .foregroundColor(.orange)
                    TextField("Enter your name", text: $viewModel.name)
                        .padding(10)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(5)
                }
                
                HStack {
                    Image(systemName: "mail.fill")
                        .foregroundColor(.orange)
                    TextField("User Email", text: $viewModel.email)
                        .padding(10)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(5)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled(true)
                }
                
                HStack {
                    Image(systemName: "key.horizontal.fill")
                        .foregroundColor(.orange)
                    SecureField("password", text: $viewModel.password)
                        .padding(10)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(5)
                }
                
                TLButton(title: "Create Account", bgColor: Color.orange, action: {
                    viewModel.registerUser()
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
