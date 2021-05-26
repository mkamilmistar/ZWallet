//
//  UserEntity.swift
//  Core
//
//  Created by MacBook on 26/05/21.
//

import Foundation

public struct UserEntity {
    var username: String
    var email: String
    var password: String
  
    public init(username: String, email: String, password: String){
        self.username = username
        self.email = email
        self.password = password
    }
}
