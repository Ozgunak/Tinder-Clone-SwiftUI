//
//  CardStackView.swift
//  TinderClone
//
//  Created by özgün aksoy on 2024-03-16.
//

import SwiftUI

struct CardStackView: View {
    @State private var userVM = UserViewModel(service: UserService())
    @State private var showMatchedView: Bool = false
    @Environment(MatchManager.self) private var matchManager

    var body: some View {
        NavigationStack {
            ZStack {
                ZStack {
                    ForEach(userVM.users) { user in
                        CardView(user: user)
                            .environment(userVM)
                    }
                }
                .blur(radius: showMatchedView ? 20 : 0)
                if showMatchedView {
                    UserMatchView(show: $showMatchedView, user: MockUsers.users[0], matchUser: MockUsers.users[2])
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
        .environment(MatchManager())
}
