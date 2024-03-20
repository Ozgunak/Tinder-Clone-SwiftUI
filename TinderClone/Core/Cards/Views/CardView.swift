//
//  CardView.swift
//  TinderClone
//
//  Created by özgün aksoy on 2024-03-12.
//

import SwiftUI

struct CardView: View {
    @State private var cardVM: CardViewModel
    @Environment(UserViewModel.self) private var userVM: UserViewModel?
    
    init(user: UserModel) {
        _cardVM = State(wrappedValue: CardViewModel(user: user))
    }
    
    var body: some View {
        VStack(spacing: 16) {
            ZStack(alignment: .bottom) {
                ZStack(alignment: .top) {
                    CardImagesView()
                        .environment(cardVM)
                    
                    SwipeActionIndicatorView(xOffset: $cardVM.xOffset)
                }
                
                UserInfoView(profileButtonPressed: $cardVM.profileButtonToggle)
                    .environment(cardVM)
            }
            .frame(width: SizeConstants.cardWidth, height: SizeConstants.cardHeight)
            .clipShape(.rect(cornerRadius: 10))
            .offset(x: cardVM.xOffset)
            .rotationEffect(.degrees(cardVM.degrees))
            .gesture(
                DragGesture()
                    .onChanged(onDragChanged)
                    .onEnded(onDragEnded)
            )
            .animation(.easeInOut(duration: 0.2), value: cardVM.degrees)
            .onChange(of: cardVM.action) { oldValue, newValue in
                if newValue == .like {
                    updateCard(isLiked: true)
                } else if newValue == .dislike {
                    updateCard(isLiked: false)
                }
            }
            .fullScreenCover(isPresented: $cardVM.profileButtonToggle){
                UserProfileView()
                    .environment(cardVM)
            }
            
            swipeActionButtonsView()
        }
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
        cardVM.xOffset = value.translation.width
        cardVM.degrees = Double(value.translation.width / 25)
    }
    
    func onDragEnded(_ value: DragGesture.Value) {
        let width = value.translation.width
        
        if abs(width) <= abs(SizeConstants.screenCutoff) {
            cardVM.xOffset = 0
            cardVM.degrees = 0
        } else if width > SizeConstants.screenCutoff {
            updateCard(isLiked: true)
        } else {
            updateCard(isLiked: false)
        }
    }
    
    func updateCard(isLiked: Bool) {
        withAnimation {
            cardVM.xOffset = isLiked ? 500 : -500
            cardVM.degrees = isLiked ? 12 : -12
        } completion: {
            userVM?.likeUserAction(cardVM.user, isLiked: isLiked)
        }
    }
}


#Preview {
    CardView(user: MockUsers.users[0])
        .environment(UserViewModel(service: UserService()))
}
