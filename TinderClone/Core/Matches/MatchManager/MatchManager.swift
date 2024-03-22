//
//  MatchManager.swift
//  TinderClone
//
//  Created by özgün aksoy on 2024-03-20.
//

import SwiftUI

@Observable class MatchManager {
    var isMatch = false
    
    @MainActor
    func checkForMatch(user: UserModel) {
        isMatch = Bool.random()
    }
}
