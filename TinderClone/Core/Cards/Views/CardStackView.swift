//
//  CardStackView.swift
//  TinderClone
//
//  Created by özgün aksoy on 2024-03-16.
//

import SwiftUI

struct CardStackView: View {
    @State private var userVM = UserViewModel(service: UserService())
    var body: some View {
        ZStack {
            ForEach(userVM.users) { user in
                CardView(user: user)
                    .environment(userVM)
            }
        }
    }
}

#Preview {
    CardStackView()
//        .environment(UserViewModel(service: UserService()))
}
