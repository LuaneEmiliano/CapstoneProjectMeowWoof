//
//  ChatMessageModel.swift
//  CapstoneProjectMeowWoof
//
//  Created by luane Niejelski on 10/3/22.
//

import Foundation
import FirebaseFirestore

struct ChatMessageModel: Identifiable {
    var id: String { documentId }
    let documentId: String
    let fromId, toId, text: String
    let timestamp: Timestamp
    
    init(doucmentId: String, data: [String: Any]) {
        self.documentId = doucmentId
        self.fromId = data[Project.FirebaseConstants.fromId] as? String ?? ""
        self.toId = data[Project.FirebaseConstants.toId] as? String ?? ""
        self.text = data[Project.FirebaseConstants.text] as? String ?? ""
        self.timestamp = data[Project.FirebaseConstants.timestamp] as? Timestamp ?? Timestamp()
    }
}
