//
//  en.swift
//  TinderClone
//
//  Created by özgün aksoy on 2024-03-18.
//

import Foundation

enum SwipeActionButtonType: String {
    case like, dislike
    
    var title: String {
        switch self {
        case .like:
            return "LIKE"
        case .dislike:
            return "NOPE"
        }
    }
    
    var imageName: String {
        switch self {
        case .like:
            "heart.fill"
        case .dislike:
            "xmark"
        }
    }
}
