//
//  CardActionButtonView.swift
//  TinderClone
//
//  Created by özgün aksoy on 2024-03-18.
//

import SwiftUI

struct CardActionButtonView: View {
    let buttonType: SwipeActionButtonType
    let user: UserModel
    @Binding var action: SwipeActionButtonType?
    @Environment(UserViewModel.self) private var userVM: UserViewModel?
    
    var body: some View {
            Button {
                action = buttonType
            } label: {
                image
            }
            .frame(width: 48, height: 48)
    }
    
    private var image: some View {
        Image(systemName: buttonType.imageName)
            .fontWeight(.heavy)
            .foregroundStyle(buttonType == .like ? .green : .red)
            .background {
                Circle()
                    .fill(.white)
                    .frame(width: 48, height: 48)
                    .shadow(radius: 6)
            }
    }
}

#Preview {
    CardActionButtonView(buttonType: .like, user: MockUsers.users[0], action: .constant(nil))
        .environment(UserViewModel(service: UserService()))
}


