//
//  CardStackView.swift
//  TinderClone
//
//  Created by özgün aksoy on 2024-03-16.
//

import SwiftUI

struct CardStackView: View {
    @Environment(CardViewModel.self) private var cardVM
    var body: some View {
        ZStack {
            ForEach(0 ..< cardVM.images.count) { card in
                CardView()
            }
        }
    }
}

#Preview {
    CardStackView()
        .environment(CardViewModel())
}
