//
//  CurrentUserProfile.swift
//  TinderClone
//
//  Created by özgün aksoy on 2024-03-19.
//

import SwiftUI

struct CurrentUserProfile: View {
    @State private var showEditProfile = false

    let user: UserModel
    var body: some View {
        NavigationStack {
            List {
                CurrentUserHeaderView(user: user)
                    .onTapGesture { showEditProfile.toggle() }
                
                Section("Account Information") {
                    HStack {
                        Text("Name")
                        
                        Spacer()
                        
                        Text(user.name)
                    }
                    
                    HStack {
                        Text("Email")
                        
                        Spacer()
                        
                        Text("test@gmail.com")
                    }
                }
                
                Section("Legal") {
                    Text("Terms of Service")
                }
                
                Section {
                    Button("Logout") {
                        print("Log out")
                    }
                    .foregroundStyle(.red)

                }
                
                Section {
                    Button("Delete Account") {
                        print("Delete Account")
                    }
                    .foregroundStyle(.red)
                }
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .fullScreenCover(isPresented: $showEditProfile) {
                EditProfileView(user: user)
            }
            
        }
    }
}

#Preview {
    CurrentUserProfile(user: MockUsers.users[0])
}
