//
//  CreateNewMessageViewModel.swift
//  Trip Planner Capstone
//
//  Created by luane Niejelski on 10/2/22.
//

import Foundation

class CreateNewMessageViewModel: ObservableObject {
    
    @Published var users = [ChatUserModel]()
    @Published var errorMessage = ""
    
    init() {
        fetchAllUsers()
    }
    
    private func fetchAllUsers() {
        FirebaseManager.shared.firestore.collection(Project.FirebaseConstants.users).getDocuments { documentsSnapshot, error in
            if let error = error {
                self.errorMessage = "Failed to fetch users: \(error)"
                return
            }
            documentsSnapshot?.documents.forEach({ snapshot in
                let data = snapshot.data()
                let user = ChatUserModel(data: data)
                if user.uid != FirebaseManager.shared.auth.currentUser?.uid {
                    self.users.append(.init(data: data))
                }
            })
        }
    }
}
