//
//  TinderCloneApp.swift
//  TinderClone
//
//  Created by özgün aksoy on 2024-03-12.
//

import SwiftUI

@main
struct TinderCloneApp: App {
    @State private var matchManager = MatchManager()
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environment(matchManager)
        }
    }
}
