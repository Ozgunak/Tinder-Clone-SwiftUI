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

    var body: some View {
        ZStack(alignment: .bottom) {
            ZStack(alignment: .top) {
                Image(.max1)
                    .resizable()
                    .scaledToFill()
                
                SwipeActionIndicatorView(xOffset: $xOffset, screenCutoff: screenCutoff)
            }
            
            UserInfoView()
                .padding(.horizontal)
        }
        .frame(width: cardWidth, height: cardHeight)
        .clipShape(.rect(cornerRadius: 10))
        .offset(x: xOffset)
        .rotationEffect(.degrees(degrees))
        .gesture(
            DragGesture()
                .onChanged(onDragChanged)
                .onEnded(onDragEnded)
        )
    }
}

private extension CardView {
    func onDragChanged(_ value: DragGesture.Value) {
        xOffset = value.translation.width
        degrees = Double(value.translation.width / 25)
    }
    
    func onDragEnded(_ value: DragGesture.Value) {
        let width = value.translation.width
        
        if abs(width) <= abs(screenCutoff) {
            xOffset = 0
            degrees = 0
        }
    }
}

private extension CardView {
    
    var screenCutoff: CGFloat {
        (UIScreen.main.bounds.width / 2) * 0.8
    }
    var cardWidth: CGFloat {
        UIScreen.main.bounds.width - 20
    }
    
    var cardHeight: CGFloat {
        UIScreen.main.bounds.height / 1.45
    }
}

#Preview {
    CardView()
}
