//
//  ToDoListAppApp.swift
//  ToDoListApp
//
//  Created by Sonoma on 23/01/24.
//
import FirebaseCore
import SwiftUI

@main
struct ToDoListAppApp: App {
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
