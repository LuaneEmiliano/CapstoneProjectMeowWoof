//
//  ChatLogViewModel.swift
//  CapstoneProjectMeowWoof
//
//  Created by luane Niejelski on 10/3/22.
//

import Foundation
import Firebase

class ChatLogViewModel: ObservableObject {
    
    @Published var chatText: String = "Description"
    let placeholderString: String = "Description"
    var chatUser: ChatUserModel?
    @Published var errorMessage = ""
    @Published var count = 0
    
    @Published var chatMessages = [ChatMessageModel]()
    
    var firestoreListener: ListenerRegistration?
    
    init(chatUser: ChatUserModel?) {
        self.chatUser = chatUser
        
        fetchMessages()
    }
    
    func fetchMessages() {
        guard let fromId = FirebaseManager.shared.auth.currentUser?.uid else { return }
        guard let toId = chatUser?.uid else { return }
        firestoreListener?.remove()
        chatMessages.removeAll()
        firestoreListener = FirebaseManager.shared.firestore
            .collection(Project.FirebaseConstants.messages)
            .document(fromId)
            .collection(toId)
            .order(by: Project.FirebaseConstants.timestamp)
            .addSnapshotListener { querySnapshot, error in
                if let error = error {
                    self.errorMessage = "Failed to listen for messages: \(error)"
                    print(error)
                    return
                }
                querySnapshot?.documentChanges.forEach({ change in
                    if change.type == .added {
                        let data = change.document.data()
                        let chatMessage = ChatMessageModel(doucmentId: change.document.documentID, data: data)
                        self.chatMessages.append(chatMessage)
                    }
                })
                
                DispatchQueue.main.async {
                    self.count += 1
                }
            }
    }
    
    func handleSend() {
        print(chatText)
        guard let fromId = FirebaseManager.shared.auth.currentUser?.uid else { return }
        guard let toId = chatUser?.uid else { return }
        
        let document =
        FirebaseManager.shared.firestore
            .collection(Project.FirebaseConstants.messages)
            .document(fromId)
            .collection(toId)
            .document()
        
        let messageData = [Project.FirebaseConstants.fromId: fromId, Project.FirebaseConstants.toId: toId, Project.FirebaseConstants.text: self.chatText, Project.FirebaseConstants.timestamp: Timestamp()] as [String : Any]
        
        document.setData(messageData) { error in
            if let error = error {
                self.errorMessage = "Failed to save message into Firestore: \(error)"
            }
            
            print("Successfully saved current user sending message")
            
            self.persistRecentMessage()
            
            self.chatText = ""
            self.count += 1
        }
        
        let recipientMessageDocument =
        FirebaseManager.shared.firestore
            .collection(Project.FirebaseConstants.messages)
            .document(toId)
            .collection(fromId)
            .document()
        
        recipientMessageDocument.setData(messageData) { error in
            if let error = error {
                self.errorMessage = "Failed to save message into Firestore: \(error)"
            }
            
            print("recipient saved message as well")
        }
    }
    
    private func persistRecentMessage() {
        
        guard let chatUser = chatUser else { return }
        guard let fromId = FirebaseManager.shared.auth.currentUser?.uid else { return }
        guard let toId = self.chatUser?.uid else { return }
        
        let document =
        FirebaseManager.shared.firestore
            .collection(Project.FirebaseConstants.recentMessages)
            .document(fromId)
            .collection(Project.FirebaseConstants.messages)
            .document(toId)
        
        let data = [
            Project.FirebaseConstants.timestamp: Timestamp(),
            Project.FirebaseConstants.text: self.chatText,
            Project.FirebaseConstants.fromId: fromId,
            Project.FirebaseConstants.toId: toId,
            Project.FirebaseConstants.profileImageURL: chatUser.profileImageURL,
            Project.FirebaseConstants.email: chatUser.email
        ] as [String : Any]
        
        document.setData(data) { error in
            if let error = error {
                self.errorMessage = "Failed to save recent message: \(error)"
            }
        }
        
        let recipientMessageDocument =
        FirebaseManager.shared.firestore
            .collection(Project.FirebaseConstants.recentMessages)
            .document(toId)
            .collection(Project.FirebaseConstants.messages)
            .document(fromId)
        
        recipientMessageDocument.setData(data) { error in
            if let error = error {
                self.errorMessage = "Failed to save message into Firestore: \(error)"
            }
        }
    }
}
