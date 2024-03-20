//
//  ProfileImageGridView.swift
//  TinderClone
//
//  Created by özgün aksoy on 2024-03-19.
//

import SwiftUI

struct ProfileImageGridView: View {
    let user: UserModel
    var body: some View {
        LazyVGrid(columns: colomns, spacing: 16) {
            ForEach(0 ..< 6) { index in
                if index < user.imageUrls.count {
                    Image(user.imageUrls[index])
                        .resizable()
                        .scaledToFill()
                        .frame(width: imageWidth, height: imageHeight)
                        .clipShape(.rect(cornerRadius: 10))
                } else {
                    ZStack(alignment: .bottomTrailing) {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color(.secondarySystemBackground))
                            .frame(width: imageWidth, height: imageHeight)
                        
                        Image(systemName: "plus.circle.fill")
                            .imageScale(.large)
                            .foregroundStyle(.pink)
                            .offset(x: 4, y: 4)
                    }
                }
            }
            
        }
    }
}

private extension ProfileImageGridView {
    var colomns: [GridItem] {
        [.init(.flexible()),
         .init(.flexible()),
         .init(.flexible())]
    }
    
    var imageWidth: CGFloat {
        return 110
    }
    
    var imageHeight: CGFloat {
        return 160
    }
}

#Preview {
    ProfileImageGridView(user: MockUsers.users[0])
}
