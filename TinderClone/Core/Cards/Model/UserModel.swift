//
//  CardModel.swift
//  TinderClone
//
//  Created by özgün aksoy on 2024-03-16.
//

import Foundation

struct UserModel: Identifiable, Codable, Hashable {
    var id = UUID().uuidString
    var name: String
    var age: String
    var info: String
    var imageUrls: [String]
}


