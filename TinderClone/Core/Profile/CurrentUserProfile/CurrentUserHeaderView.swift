//
//  CurrentUserHeaderView.swift
//  TinderClone
//
//  Created by özgün aksoy on 2024-03-19.
//

import SwiftUI

struct CurrentUserHeaderView: View {
    let user: UserModel
    var body: some View {
        VStack {
            ZStack(alignment: .topTrailing) {
                Image(user.imageUrls[0])
                    .resizable()
                    .scaledToFill()
                    .frame(width: 120, height: 120)
                .clipShape(Circle())
                .background {
                    Circle()
                        .fill(Color(.systemGray6))
                        .frame(width: 128, height: 128)
                        .shadow(radius: 10)
                }
                
                Image(systemName: "pencil")
                    .imageScale(.small)
                    .foregroundStyle(.gray)
                    .background {
                        Circle()
                            .fill(.white)
                            .frame(width: 32, height: 32)
                    }
                    .offset(x: -8, y: 10)
            }
            
            Text("\(user.name), \(user.age)")
                .font(.title2)
                .fontWeight(.light)
        }
        .frame(height: 240)
        .frame(maxWidth: .infinity)

    }

}

#Preview {
    CurrentUserHeaderView(user: MockUsers.users[0])
}
