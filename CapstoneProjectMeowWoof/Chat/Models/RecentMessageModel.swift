//
//  RecentMessageModel.swift
//  Trip Planner Capstone
//
//  Created by luane Niejelski on 10/4/22.
//

import Foundation
import Firebase

struct RecentMessageModel: Identifiable {
    var id: String { documentId }
    let text, fromId, toId, documentId, email, profileImageUrl: String
    let timestamp: Timestamp
    
    var username: String {
        email.components(separatedBy: "@").first ?? email
    }
    
    init(documentId: String, data: [String: Any]) {
        self.documentId = documentId
        self.text = data[Project.FirebaseConstants.text] as? String ?? ""
        self.fromId = data[Project.FirebaseConstants.fromId] as? String ?? ""
        self.toId = data[Project.FirebaseConstants.toId] as? String ?? ""
        self.email = data[Project.FirebaseConstants.email] as? String ?? ""
        self.profileImageUrl = data[Project.FirebaseConstants.profileImageURL] as? String ?? ""
        self.timestamp = data[Project.FirebaseConstants.timestamp] as? Timestamp ?? Timestamp(date: Date())
    }
}
