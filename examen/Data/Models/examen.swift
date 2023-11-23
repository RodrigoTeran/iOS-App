//
//  examen.swift
//  examen
//
//  Created by Rodrigo Terán Hernández on 23/11/23.
//

import Foundation

struct Examen: Codable {
    var results: Int
    var data: ListUsersData
}

struct ListUsersData: Codable {
    var users: [UserBase]
}

struct UserBase: Identifiable, Codable {
    var id: String
    var _id: String
    
    var firstName: String
}
