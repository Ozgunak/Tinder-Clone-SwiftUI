//
//  UserViewModel.swift
//  TinderClone
//
//  Created by özgün aksoy on 2024-03-16.
//

import Foundation

@Observable class UserViewModel {
    var users: [UserModel] = []
    
    private var service: UserService
    
    init(service: UserService) {
        self.service = service
        Task { await fetchUsers() }
    }
    
    func fetchUsers() async {
        do {
            users = try await service.fetchUsers()
        } catch {
            print("DEBUG: fetching users failed \(error.localizedDescription)")
        }
    }
}