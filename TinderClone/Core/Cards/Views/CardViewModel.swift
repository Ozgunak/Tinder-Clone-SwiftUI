//
//  CardViewModel.swift
//  TinderClone
//
//  Created by özgün aksoy on 2024-03-15.
//

import Foundation

@Observable class CardViewModel {
    var images: [String] = [
        "max1", "max4", "max3", "charles1", "charles2", "charles3"
    ]
    var charlesImages: [String] = [
        "charles1", "charles2", "charles3"
    ]
    var currentIndex: Int = 0
    
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
