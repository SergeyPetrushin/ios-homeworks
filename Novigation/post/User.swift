//
//  User.swift
//  Novigation
//
//  Created by Sergey Petrusin on 10.06.2023.
//

import UIKit

struct User {
    let login: String
    let password: String
    
    static func makeUser() -> [User] {
        var usersList = [User]()
        
        usersList.append(User(login: "Hipster", password: "123456"))
        
        return usersList
    }
}
