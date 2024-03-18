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
//    @State private var action: SwipeActionButtonType?

    @Environment(UserViewModel.self) private var userVM
    init(user: UserModel) {
        _cardVM = State(wrappedValue: CardViewModel(user: user))
    }
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottom) {
                ZStack(alignment: .top) {
                    userImage
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
            .onChange(of: cardVM.action) { oldValue, newValue in
                if newValue == .like {
                    updateCard(isLiked: true)
                } else if newValue == .dislike {
                    updateCard(isLiked: false)
                }
            }
            
            swipeActionButtonsView()
        }
    }
    
    private var userImage: some View {
        Image(cardVM.currentImageName)
            .resizable()
            .scaledToFill()
            .frame(width: SizeConstants.cardWidth, height: SizeConstants.cardHeight)
    }
    
    private func swipeActionButtonsView() -> some View {
        HStack(spacing: 32) {
            CardActionButtonView(buttonType: .dislike, user: cardVM.user, action: $cardVM.action)

            CardActionButtonView(buttonType: .like, user: cardVM.user, action: $cardVM.action)
        }
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
            updateCard(isLiked: true)
        } else {
            updateCard(isLiked: false)
        }
    }
    
    func updateCard(isLiked: Bool) {
        withAnimation {
            xOffset = isLiked ? 500 : -500
            degrees = isLiked ? 12 : -12
        } completion: {
            userVM.likeUserAction(cardVM.user, isLiked: isLiked)
        }
    }
}


#Preview {
    CardView(user: MockUsers.users[0])
        .environment(UserViewModel(service: UserService()))
}
