//
//  ChatLoginViewModel.swift
//  CapstoneProjectMeowWoof
//
//  Created by luane Niejelski on 10/14/22.
//
//
import Foundation
import Firebase

class ChatLogViewModel: ObservableObject {
    
    @Published var chatText = ""
    @Published var errorMessage = ""
    @Published var chatMessages = [ChatMessage]()
    
    var chatUser: ChatUser?
    
    init(chatUser: ChatUser?) {
        self.chatUser = chatUser
        fetchMessages()
    }
    
 var firestoreListener: ListenerRegistration?
    
   
    func fetchMessages() {
        guard let fromId = FirebaseManager.shared.auth.currentUser?.uid else { return }
        guard let toId = chatUser?.uid else { return }
        FirebaseManager.shared.firestore
            .collection(FirebaseConstants.messages)
            .document(fromId)
            .collection(toId)
            .order(by: FirebaseConstants.timestamp)
            .addSnapshotListener { querySnapshot, error in
                if let error = error {
                    self.errorMessage = "Failed to listen for messages: \(error)"
                    print(error)
                    return
                }
                
                querySnapshot?.documentChanges.forEach({ change in
                    if change.type == .added {
                        let data = change.document.data()
                        self.chatMessages.append(.init(documentId: change.document.documentID, data: data))
                        print("Appending chatMessage in ChatlogView")
                    }
                })
                DispatchQueue.main.async {
                    self.count += 1
                }
            }
    }
    
    func handleSend() {
        print(chatText)
        guard let fromId =
                FirebaseManager.shared.auth.currentUser?
                .uid else { return }
        guard let toId = chatUser?.uid else { return }
        let document =
        FirebaseManager.shared.firestore
            .collection("messages")
            .document(fromId)
            .collection(toId)
            .document()
        
        let messageData = [FirebaseConstants.fromId: fromId, FirebaseConstants.toId: toId, FirebaseConstants.text: self.chatText, "timestamp": Timestamp()] as [String : Any]
        
        document.setData(messageData) { error in
            if let error = error {
                print(error)
                self.errorMessage = "Failed to save message into Firestore: \(error)"
                return
            }
            print("Successfully saved current user sending message")
            
            self.persistRecentMessage()
            
            self.chatText = ""
            self.count += 1
        }
        let recipientMessageDocument = FirebaseManager.shared.firestore.collection("messages")
            .document(toId)
            .collection(fromId)
            .document()
        
        recipientMessageDocument.setData(messageData) { error in
            if let error = error {
                print(error)
                self.errorMessage = "Failed to save message into Firestore: \(error)"
                return
            }
            
            print("Recipient saved message as well")
        }
    }
    func persistRecentMessage() {
        guard let chatUser = chatUser else { return }
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else { return }
        guard let toId = self.chatUser?.uid else { return }

       let document = FirebaseManager.shared.firestore
                    .collection("recent_messages")
                    .document(uid)
                    .collection("messages")
                    .document(toId)
        let data = [
                   FirebaseConstants.timestamp: Timestamp(),
                   FirebaseConstants.text: self.chatText,
                   FirebaseConstants.fromId: uid,
                   FirebaseConstants.toId: toId,
                   FirebaseConstants.profileImageUrl: chatUser.profileImageUrl,
                   FirebaseConstants.email: chatUser.email
               ] as [String : Any]

        
        document.setData(data) { error in
                    if let error = error {
                        self.errorMessage = "Failed to save recent message: \(error)"
                        print("Failed to save recent message: \(error)")
                        return
                    }
                }
    }
    @Published var count = 0
}
