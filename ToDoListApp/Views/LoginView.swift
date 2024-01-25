//
//  LoginView.swift
//  ToDoListApp
//
//  Created by Sonoma on 23/01/24.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationStack{
            VStack{
                //Header
                HeaderView(title: "To Do List", subTitle: "Get Things Done", degree: 15, bgColor: Color.pink)
                
                //Login Form
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
                        Image(systemName: "mail.fill")
                            .foregroundColor(.pink)
                        TextField("User Email", text: $viewModel.email)
                            .padding(10)
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(5)
                            .textInputAutocapitalization(.never)
                            .autocorrectionDisabled(true)
                    }
                    HStack {
                        Image(systemName: "key.horizontal.fill")
                            .foregroundColor(.pink)
                        SecureField("password", text: $viewModel.password)
                            .padding(10)
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(5)
                    }
                    TLButton(title: "Log In",
                             bgColor: Color.pink)
                    {
                        viewModel.login()
                    }
                    .padding()
                    
                    Button("Reset Password") {
                        viewModel.resetPassword()
                    }.padding(.leading,220)
                        .tint(Color.pink)
                }
                .alert(isPresented: $viewModel.showAlert) {
                    Alert(title: Text("Password Reset"), message: Text(viewModel.alertMessage), dismissButton: .default(Text("OK")))
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
