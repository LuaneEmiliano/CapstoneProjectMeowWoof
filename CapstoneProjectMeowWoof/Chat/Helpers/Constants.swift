//
//  Constants.swift
//  CapstoneProjectMeowWoof
//
//  Created by luane Niejelski on 8/18/22.
//

import Foundation
import UIKit
import SwiftUI

enum Project {
    
    enum Constants {
        enum General {
            public static let strokeWidth: CGFloat = 2.0
            public static let roundedViewLenth: CGFloat = 56.0
            public static let spacing: CGFloat = 10
            public static let paddingLarge: CGFloat = 30
            public static let paddingSmall: CGFloat = 5
            public static let roundedEdges: CGFloat = 10
            public static let textViewHeight: CGFloat = 55
        }
        enum Onboarding {
            public static let onboardingButtonName = "Continue"
        }
        enum Home {
            public static let homeScreenIcon = "info"
        }
    }
    
    enum FirebaseConstants {
        public static let fromId = "fromId"
        public static let toId = "toId"
        public static let text = "text"
        public static let timestamp = "timestamp"
        public static let profileImageURL = "profileImageURL"
        public static let uid = "uid"
        public static let email = "email"
        public static let users = "users"
        public static let messages = "messages"
        public static let recentMessages = "recent_messages"
        
    }
    
}

