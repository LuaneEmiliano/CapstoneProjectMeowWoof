//
//  NewMessageChatViewModel.swift
//  CapstoneProjectMeowWoof
//
//  Created by luane Niejelski on 10/14/22.
//

import Foundation
import SDWebImageSwiftUI

class newMessageChatViewModel: ObservableObject {
    
    @Published var users = [ChatUser]()
    @Published var errorMessage = ""
    
    init() {
        fetchAllUsers()

    }
    func fetchAllUsers() {
        FirebaseManager.shared.firestore.collection("users")
            .getDocuments { documentsSnapshot, error in
                if let error = error {
                    self.errorMessage = "Failed to fetch users:\(error)"
                    print("Failed to fetch users: \(error)")
                    return
                }
                documentsSnapshot?.documents.forEach({ snapshot in
                    let data = snapshot.data()
                    let user = ChatUser(data: data)
                    if user.uid !=
                        FirebaseManager.shared.auth.currentUser?.uid {
                        self.users.append(.init(data: data))
                    }
                })
            }
    }
}
