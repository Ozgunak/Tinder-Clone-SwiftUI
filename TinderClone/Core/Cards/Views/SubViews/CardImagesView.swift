//
//  CardImagesView.swift
//  TinderClone
//
//  Created by özgün aksoy on 2024-03-19.
//

import SwiftUI

struct CardImagesView: View {
    
    @Environment(CardViewModel.self) private var cardVM: CardViewModel?
    
    var body: some View {
        ZStack(alignment: .top) {
            userImage
                .overlay {
                    CardImageButtonOverlay()
                        .environment(cardVM)
                }
            
            
            CardImageIndicatorView()
                .environment(cardVM)
        }
    }
    
    
    private var userImage: some View {
        Image(cardVM?.currentImageName ?? "")
            .resizable()
            .scaledToFill()
            .frame(width: SizeConstants.cardWidth, height: SizeConstants.cardHeight)
    }
}

#Preview {
    CardImagesView()
        .environment(CardViewModel(user: MockUsers.users[0]))
}
