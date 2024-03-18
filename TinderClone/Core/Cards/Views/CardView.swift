//
//  CardView.swift
//  TinderClone
//
//  Created by özgün aksoy on 2024-03-12.
//

import SwiftUI

struct CardView: View {
    @State private var xOffset: CGFloat = 0
    @State private var degrees: Double = 0
    @State private var cardVM: CardViewModel
    @Environment(UserViewModel.self) private var userVM
    init(user: UserModel) {
        _cardVM = State(wrappedValue: CardViewModel(user: user))
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ZStack(alignment: .top) {
                Image(cardVM.currentImageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: SizeConstants.cardWidth, height: SizeConstants.cardHeight)
                    .overlay {
                        CardImageButtonOverlay()
                            .environment(cardVM)
                    }
                
                
                CardImageIndicatorView()
                    .environment(cardVM)
                
                SwipeActionIndicatorView(xOffset: $xOffset)
            }
            
            UserInfoView()
                .environment(cardVM)
//                .padding(.horizontal)
            
        }
        .frame(width: SizeConstants.cardWidth, height: SizeConstants.cardHeight)
        .clipShape(.rect(cornerRadius: 10))
        .offset(x: xOffset)
        .rotationEffect(.degrees(degrees))
        .gesture(
            DragGesture()
                .onChanged(onDragChanged)
                .onEnded(onDragEnded)
        )
        .animation(.easeInOut(duration: 0.2), value: degrees)
        
    }
}

private extension CardView {
    func onDragChanged(_ value: DragGesture.Value) {
        xOffset = value.translation.width
        degrees = Double(value.translation.width / 25)
    }
    
    func onDragEnded(_ value: DragGesture.Value) {
        let width = value.translation.width

        if abs(width) <= abs(SizeConstants.screenCutoff) {
            xOffset = 0
            degrees = 0
        } else if width > SizeConstants.screenCutoff {
            withAnimation {
                xOffset = 500
                degrees = 12
            } completion: {
                userVM.removeUser(cardVM.user)
            }
        } else {
            withAnimation {
                xOffset = -500
                degrees = -12
            } completion: {
                userVM.removeUser(cardVM.user)
            }
        }
    }
}


#Preview {
    CardView(user: MockUsers.users[0])
        .environment(UserViewModel(service: UserService()))
}
