//
//  User.swift
//  HNY-GraduationV5
//
//  Created by Hilary Young on 25/03/2023.
//

import Foundation

// Basic user model
// These are the information that will be stored in our firebase database
struct User: Codable {
    var firstName: String
    var lastName: String
    var signUpDate = Date.now
    var userID: String?
    //how to store user uuid?
}

