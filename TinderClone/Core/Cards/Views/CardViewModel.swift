//
//  CardViewModel.swift
//  TinderClone
//
//  Created by özgün aksoy on 2024-03-15.
//

import Foundation

@Observable class CardViewModel {
    private var images: [String] = [
        "max1", "max2", "max3"
    ]
    private var currentIndex: Int = 0
    
    var currentImageName: String {
        images[currentIndex]
    }
    
    func updateIndex(isIncrement: Bool) {
        if isIncrement, currentIndex < images.count - 1 {
            currentIndex += 1
        } else if !isIncrement, currentIndex > 0 {
            currentIndex -= 1
        } else if !isIncrement, currentIndex == 0 {
            currentIndex = images.count - 1
        } else {
            currentIndex = 0
        }
    }
}
