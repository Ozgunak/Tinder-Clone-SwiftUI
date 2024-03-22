//
//  UserService.swift
//  TinderClone
//
//  Created by özgün aksoy on 2024-03-16.
//

import SwiftUI

struct UserService {
    func fetchUsers() async throws -> [UserModel] {
        return MockUsers.users
    }
}

struct MockUsers {
    static let users: [UserModel] = [
        UserModel(name: "Charles", age: "25", info: "F1 Driver", imageUrls: ["charles1", "charles2", "charles3"]),
        UserModel(name: "Kelly", age: "35", info: "Model", imageUrls: ["kelly1", "kelly2", "kelly3"]),
        UserModel(name: "Max", age: "24", info: "2 Times WC F1 Driver", imageUrls: ["max1", "max4", "max3"]),
    ]
}
