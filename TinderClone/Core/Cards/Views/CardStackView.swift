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
        NavigationStack {
            ZStack {
                ForEach(userVM.users) { user in
                    CardView(user: user)
                        .environment(userVM)
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Image(.tinderLogo)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 88)
                }
            }
        }
    }
}

#Preview {
    CardStackView()
}
