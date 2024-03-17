//
//  CardImageButtonOverlay.swift
//  TinderClone
//
//  Created by özgün aksoy on 2024-03-15.
//

import SwiftUI

struct CardImageButtonOverlay: View {
    @Environment(CardViewModel.self) private var cardVM
    var body: some View {
        HStack {
            Rectangle()
                .onTapGesture {
                    cardVM.updateIndex(isIncrement: false)
                }
            
            Rectangle()
                .onTapGesture {
                    cardVM.updateIndex(isIncrement: true)
                }
        }
        .foregroundStyle(.white.opacity(0.001))
    }
}

#Preview {
    CardImageButtonOverlay()
        .environment(CardViewModel(user: MockUsers.users[0]))
}
