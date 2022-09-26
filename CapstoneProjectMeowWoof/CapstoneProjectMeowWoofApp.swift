//
//  CapstoneProjectMeowWoofApp.swift
//  CapstoneProjectMeowWoof
//
//  Created by luane Niejelski on 9/19/22.
//

import SwiftUI

@main
struct CapstoneProjectMeowWoofApp: App {
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
//                HomeListView()
//                HomeScreenView()
//         
            PetTabView()
//AddingNameView()
//    PetTypeView()
//            PhotoHomeView()
            
//            .accentColor(.black)
            .environmentObject(listViewModel)
        }
    }
}
