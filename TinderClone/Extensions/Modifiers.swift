//
//  Modifiers.swift
//  TinderClone
//
//  Created by özgün aksoy on 2024-03-19.
//

import SwiftUI

struct UserProfileDetailModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color(.secondarySystemBackground))
            .font(.subheadline)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

extension View {
    func userDetailModifier() -> some View {
        modifier(UserProfileDetailModifier())
    }
}
