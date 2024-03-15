//
//  UserInfoView.swift
//  TinderClone
//
//  Created by özgün aksoy on 2024-03-12.
//

import SwiftUI

struct UserInfoView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Max")
                    .font(.title)
                    .fontWeight(.heavy)
                Text("26")
                    .font(.title)
                    .fontWeight(.semibold)
                
                Spacer()
                
                Button(action: {}, label: {
                    Image(systemName: "arrow.up.circle")
                        .fontWeight(.bold)
                        .imageScale(.large)
                })
            }
            
            Text("F1 Racer | Legend")
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
}
