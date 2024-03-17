//
//  UserInfoView.swift
//  TinderClone
//
//  Created by özgün aksoy on 2024-03-12.
//

import SwiftUI

struct UserInfoView: View {
    @Environment(CardViewModel.self) private var cardVM
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(cardVM.user.name)
                    .font(.title)
                    .fontWeight(.heavy)
                Text(cardVM.user.age)
                    .font(.title)
                    .fontWeight(.semibold)
                
                Spacer()
                
                Button(action: {
                    
                }, label: {
                    Image(systemName: "arrow.up.circle")
                        .fontWeight(.bold)
                        .imageScale(.large)
                })
            }
            
            Text(cardVM.user.info)
                .font(.subheadline)
                .lineLimit(2)
        }
        .foregroundStyle(.white)
        .padding()
        .background(
            LinearGradient(colors: [.clear, .black], startPoint: .top, endPoint: .bottom)
        )
        
        
    }
}

#Preview {
    UserInfoView()
        .environment(CardViewModel(user: MockUsers.users[0]))
}
