//
//  PetTabView.swift
//  MeowWoofPetDiary
//
//  Created by luane Niejelski on 9/15/22.
//

import SwiftUI

struct PetTabView: View {
    
    @EnvironmentObject var launchScreenManager: LaunchScreenManager
    @State var selectedTab: Int = 1
    
    var body: some View {
        
        TabView(selection: $selectedTab) {
            AnimalListView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                    
                }
                .tag(0)
         ToDoListView()
                .tabItem {
                    Image(systemName: "alarm.fill")
                    Text("Reminder")
                }
            TheCatView()
                .tag(1)
                .tabItem {
                    Image(systemName: "message.fill")
                    Text("Chat")
                }
                .tag(2)
//            MainMessageView()
                .tabItem {
                    Image(systemName: "ellipsis.circle.fill")
                    Text("More")
                }
                .tag(3)
        }
//        .onAppear {
//            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
//                    launchScreenManager.dismiss()
//                }
//        }
        
    }
    
    struct PetTabView_Previews: PreviewProvider {
        static var previews: some View {
            PetTabView()
                .environmentObject(ListViewModel())
                .environmentObject(LaunchScreenManager())
            
        }
    }
    
//    struct ExtractedView: View {
//        var body: some View {
//            ZStack {
//                Text("Home tab")
//            }
//
//        }
//    }
}
