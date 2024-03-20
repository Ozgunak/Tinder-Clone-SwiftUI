//
//  EditProfileView.swift
//  TinderClone
//
//  Created by özgün aksoy on 2024-03-19.
//

import SwiftUI

struct EditProfileView: View {
    @Environment(\.dismiss) private var dismiss
    let user: UserModel
    @State private var bio: String = ""

    var body: some View {
        NavigationStack {
            ScrollView {
                ProfileImageGridView(user: user)
                    .padding()
                VStack(spacing: 24) {
                    
                    aboutMeSection
                    
                    occupationSection
                    
                    genderSection
                    
                    sexualSection
                }
            }
            .scrollIndicators(.hidden)
            .toolbar(content: {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                    .fontWeight(.semibold)
                }
        })
            .navigationTitle("Edit Profile")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    private var aboutMeSection: some View {
        VStack(alignment: .leading) {
            Text("About Me")
                .font(.subheadline)
                .fontWeight(.bold)
                .padding(.leading)
            TextField("Add your bio", text: $bio, axis: .vertical)
                .padding()
                .frame(height: 64, alignment: .top)
                .background(Color(.secondarySystemBackground))
                .font(.subheadline)
        }
    }
    
    
    private var occupationSection: some View {
        VStack(spacing: 24) {
            VStack(alignment: .leading) {
                Text("Occupation")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .padding(.leading)
                HStack {
                    Image(systemName: "book")
                        Text("Occupation")
                    Spacer()
                    Text("Driver")
                        .font(.footnote)
                }
                .padding()
                .background(Color(.secondarySystemBackground))
                .font(.subheadline)
            }
        }
    }
    
    private var genderSection: some View {
        VStack(spacing: 24) {
            VStack(alignment: .leading) {
                Text("Gender")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .padding(.leading)
                HStack {
                    Text("Men")
                    Spacer()
                    Image(systemName: "chevron.right")
                        .imageScale(.small)
                }
                .padding()
                .background(Color(.secondarySystemBackground))
                .font(.subheadline)
            }
        }
    }
    
    private var sexualSection: some View {
        VStack(spacing: 24) {
            VStack(alignment: .leading) {
                Text("Secual Orientation")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .padding(.leading)
                HStack {
                    Text("Straight")
                    Spacer()
                    Image(systemName: "chevron.right")
                        .imageScale(.small)
                }
                .padding()
                .background(Color(.secondarySystemBackground))
                .font(.subheadline)
            }
        }
    }
}

#Preview {
    NavigationStack {
        EditProfileView(user: MockUsers.users[0])
    }
}
