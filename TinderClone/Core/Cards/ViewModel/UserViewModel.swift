//
//  UserViewModel.swift
//  TinderClone
//
//  Created by özgün aksoy on 2024-03-16.
//

import Foundation

@Observable class UserViewModel {
    var users: [UserModel] = []
    var likedUsers: [UserModel] = []
    var dislikedUsers: [UserModel] = []
    
    private var service: UserService
    
    init(service: UserService) {
        self.service = service
        Task { await fetchUsers() }
    }
    
    @MainActor
    func fetchUsers() async {
        do {
            users = try await service.fetchUsers()
        } catch {
            print("DEBUG: fetching users failed \(error.localizedDescription)")
        }
    }
    
    private func removeUser(_ user: UserModel) {
        users.removeAll(where: { $0.id == user.id })
    }
    
    func likeUserAction(_ user: UserModel, isLiked: Bool) {
        
            if isLiked {
                likedUsers.append(user)
            } else {
                dislikedUsers.append(user)
            }
        removeUser(user)
        }

}
