//
//  CapstoneProjectMeowWoofApp.swift
//  CapstoneProjectMeowWoof
//
//  Created by luane Niejelski on 9/19/22.
//

import SwiftUI
import SDWebImageSwiftUI

@main
struct CapstoneProjectMeowWoofApp: App {
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    @StateObject var launchScreenManager = LaunchScreenManager()


    @StateObject var petsViewModel = PetViewModel()
    @StateObject var mainMessageChat = MainMessagesViewModel()
    @State private var description: String?
    @StateObject var network = NetworkMonitor()
    
    init() {
        UITextView.appearance().backgroundColor = .clear
        UITextView.appearance().textContainerInset = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
    }
        
    var body: some Scene {
        WindowGroup {
           ZStack {
             PetTabView()
    
           }
            .environmentObject(listViewModel)
            .environmentObject(petsViewModel)
            .environmentObject(launchScreenManager)
            .environmentObject(network)
            .environmentObject(mainMessageChat)
               }
            }
        }
