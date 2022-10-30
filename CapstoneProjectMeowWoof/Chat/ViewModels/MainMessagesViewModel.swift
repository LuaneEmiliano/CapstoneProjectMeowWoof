//
//  MainMessagesViewModel.swift
//  Trip Planner Capstone
//
//  Created by luane Niejelski on 10/2/22.
//

import Foundation
import Firebase

class MainMessagesViewModel: ObservableObject {
    
    @Published var errorMessage = ""
    @Published var chatUser: ChatUserModel?
    @Published var isUserCurrentlyLoggedOut = false
    @Published var recentMessages = [RecentMessageModel]()
    
    private var firestoreListener: ListenerRegistration?
    
    init() {
        
        DispatchQueue.main.async {
            self.isUserCurrentlyLoggedOut = FirebaseManager.shared.auth.currentUser?.uid == nil
        }
        fetchCurrentUser()
        fetchRecentMessages()
    }
    
    func fetchRecentMessages() {
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else { return }
        
        firestoreListener?.remove()
        self.recentMessages.removeAll()
        
        FirebaseManager.shared.firestore
            .collection(Project.FirebaseConstants.recentMessages)
            .document(uid)
            .collection(Project.FirebaseConstants.messages)
            .order(by: Project.FirebaseConstants.timestamp)
            .addSnapshotListener { querySnapshot, error in
                if let error = error {
                    self.errorMessage = "Failed to listen for recent messages: \(error)"
                    return
                }
                querySnapshot?.documentChanges.forEach({ change in
                    let docId = change.document.documentID
                    if let index = self.recentMessages.firstIndex(where: { $0.documentId == docId }) {
                        self.recentMessages.remove(at: index)
                    }
//                    if let rm = try? change.document.data(as: RecentMessageModel.self) {
//                        self.recentMessages.insert(rm, at: 0)
//                    }
                    self.recentMessages.insert(.init(documentId: docId, data: change.document.data()), at: 0)
                })
            }
    }
    
    func fetchCurrentUser() {
        
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else {
            self.errorMessage = "Could not find firebase uid"
            return
        }
        
        FirebaseManager.shared.firestore.collection("users").document(uid).getDocument { snapshot, error in
            if let error = error {
                self.errorMessage = "Failed to fetch current user: \(error)"
                print("Failed to fetch current user:", error)
                return
            }
            guard let data = snapshot?.data() else {
                self.errorMessage = "No data found"
                return
            }
            
            self.chatUser = .init(data: data)
        }
    }
    
    func handleSignOut() {
        isUserCurrentlyLoggedOut.toggle()
        try? FirebaseManager.shared.auth.signOut()
    }
}