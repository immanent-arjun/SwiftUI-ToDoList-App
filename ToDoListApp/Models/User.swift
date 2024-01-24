//
//  User.swift
//  ToDoListApp
//
//  Created by Sonoma on 23/01/24.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
