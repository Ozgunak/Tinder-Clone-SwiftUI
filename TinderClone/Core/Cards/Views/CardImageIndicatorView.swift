//
//  CardImageIndicatorView.swift
//  TinderClone
//
//  Created by özgün aksoy on 2024-03-16.
//

import SwiftUI

struct CardImageIndicatorView: View {
    @Environment(CardViewModel.self) private var cardVM
    
    var body: some View {
        HStack {
            ForEach(0 ..< cardVM.user.imageUrls.count) { index in
                RoundedRectangle(cornerRadius: 3)
                    .frame(height: 4)
                    .foregroundStyle(index == cardVM.currentImageIndex ? .white : .gray)
                    .animation(.spring(), value: index)
            }
        }
        .padding(.horizontal, 40)
        .padding(.vertical, 10)
    }
}

#Preview {
    CardImageIndicatorView()
        .environment(CardViewModel(user: MockUsers.users[0]))
}
