//
//  ChatUserModel.swift
//  CapstoneProjectMeowWoof
//
//  Created by luane Niejelski on 10/2/22.
//

import Foundation

struct ChatUserModel: Identifiable {
    var id: String { uid }
    let uid, email, profileImageURL: String
    
    init(data: [String: Any]) {
        self.uid = data[Project.FirebaseConstants.uid] as? String ?? ""
        self.email = data[Project.FirebaseConstants.email] as? String ?? ""
        self.profileImageURL = data[Project.FirebaseConstants.profileImageURL] as? String ?? ""
    }
}
