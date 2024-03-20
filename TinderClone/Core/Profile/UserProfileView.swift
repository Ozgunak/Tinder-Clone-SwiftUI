//
//  UserProfileView.swift
//  TinderClone
//
//  Created by özgün aksoy on 2024-03-18.
//

import SwiftUI

struct UserProfileView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(CardViewModel.self) private var cardVM: CardViewModel?
    var currentIndex = 0
    
    
    var body: some View {
        VStack {
            nameSection
            
            ScrollView {
                CardImagesView()
                    .environment(cardVM)
                
                aboutMeSection
                
                essentialsSection
            }
        }
    }
    
    private var aboutMeSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("About Me")
                .fontWeight(.semibold)
            Text("Some bio for now")
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .userDetailModifier()
    }
    
    private var essentialsSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Essentials")
                .fontWeight(.semibold)
            
            sectionView(imageName: "person", text: "Woman")
            sectionView(imageName: "arrow.down.forward.and.arrow.up.backward.circle", text: "Straight")
            sectionView(imageName: "book", text: "F1 Driver")
            
        }
        .userDetailModifier()
    }
    
    private func sectionView(imageName: String, text: String) -> some View {
        HStack {
            Image(systemName: imageName)
            Text(text)
            Spacer()
        }
        
    }
    
    private var nameSection: some View {
        HStack {
            Text(cardVM?.user.name ?? "")
                .font(.title2)
                .fontWeight(.semibold)
            Text(cardVM?.user.age ?? "")
                .font(.title2)
            
            Spacer()
            
            Button {
                dismiss()
            } label: {
                downImage
            }
        }
        .padding(.horizontal)
    }
    
    private var downImage: some View {
        Image(systemName: "arrow.down.circle.fill")
            .imageScale(.large)
            .fontWeight(.bold)
            .foregroundStyle(.orange)
    }
}

#Preview {
    UserProfileView()
        .environment(CardViewModel(user: MockUsers.users[0]))
}


