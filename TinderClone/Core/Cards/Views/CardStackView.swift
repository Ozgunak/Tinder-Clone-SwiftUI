//
//  CardStackView.swift
//  TinderClone
//
//  Created by özgün aksoy on 2024-03-16.
//

import SwiftUI

struct CardStackView: View {
    @Environment(UserViewModel.self) private var userVM
    var body: some View {
        ZStack {
            ForEach(userVM.users) { user in
                CardView(user: user)
            }
        }
    }
}

#Preview {
    CardStackView()
        .environment(UserViewModel(service: UserService()))
}
