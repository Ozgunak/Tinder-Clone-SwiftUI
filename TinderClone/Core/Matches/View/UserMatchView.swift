//
//  UserMatchView.swift
//  TinderClone
//
//  Created by özgün aksoy on 2024-03-20.
//

import SwiftUI

struct UserMatchView: View {
    @Binding var show: Bool
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.black.opacity(0.7))
                .ignoresSafeArea()
            
            VStack(spacing: 120) {
                VStack(spacing: 20) {
                    Text("It's a Match!")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                    Text("You and Kelly have liked each other.")
                }
                .foregroundStyle(.white)
                
                HStack(spacing: 16) {
                    
                    profileImage(name: MockUsers.users[0].imageUrls[0])
                    
                    profileImage(name: MockUsers.users[1].imageUrls[0])
                }
                
                VStack(spacing: 24) {
                    Button{
                        
                    } label: {
                        Text("Send Message")
                            .frame(width: 360, height: 55)
                            .background {
                                Capsule().fill(.pink)
                            }
                    }
                    
                    Button{
                        
                    } label: {
                        Text("Keep Swiping")
                            .frame(width: 360, height: 55)
                            .background {
                                Capsule().stroke(.white, lineWidth: 2)
                            }
                    }
                }
                .foregroundStyle(.white)
                .font(.subheadline)

            }
        }
    }
    
    private func profileImage(name: String) -> some View {
        Image(name)
            .resizable()
            .scaledToFill()
            .frame(width: 150, height: 150)
            .clipShape(Circle())
            .overlay {
                Circle()
                    .stroke(.white, lineWidth: 2)
                    .shadow(radius: 4)
            }
    }
}

#Preview {
    UserMatchView(show: .constant(true))
}
