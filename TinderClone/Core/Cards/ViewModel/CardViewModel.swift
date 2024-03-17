//
//  CardViewModel.swift
//  TinderClone
//
//  Created by özgün aksoy on 2024-03-15.
//

import Foundation

@Observable class CardViewModel {
    var images: [String] = [
        "max1", "max4", "max3", 
//        "charles1", "charles2", "charles3"
    ]
    
    var currentImageIndex: Int = 0
    
    var currentImageName: String {
//        images[currentImageIndex]
        user.imageUrls[currentImageIndex]
    }
    var user: UserModel
    
    init(user: UserModel) {
        self.user = user
    }
    
    
    func updateIndex(isIncrement: Bool) {
        if isIncrement, currentImageIndex < images.count - 1 {
            currentImageIndex += 1
        } else if !isIncrement, currentImageIndex > 0 {
            currentImageIndex -= 1
        } else if !isIncrement, currentImageIndex == 0 {
            currentImageIndex = images.count - 1
        } else {
            currentImageIndex = 0
        }
    }
}
