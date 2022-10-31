//
//  PetTabView.swift
//  MeowWoofPetDiary
//
//  Created by luane Niejelski on 9/15/22.
//

import SwiftUI

struct PetTabView: View {
    
    @EnvironmentObject var launchScreenManager: LaunchScreenManager
    @State var selectedTab: Int = 0
    @State var shouldShowLogOutOptions: Bool = false
    @EnvironmentObject var network: NetworkMonitor
    @State var showNetworkAlert: Bool = false
    
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
            MainMessagesView(shouldShowLogOutOptions: $shouldShowLogOutOptions)
                .tag(1)
                .tabItem {
                    Image(systemName: "message.fill")
                    Text("Chat")
                }
                .tag(2)
            SettingsView(shouldShowLogOutOptions: $shouldShowLogOutOptions)
                .tabItem {
                    Image(systemName: "ellipsis.circle.fill")
                    Text("More")
                }
                .tag(3)
        }
        .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        launchScreenManager.dismiss()
                        if network.isActive == false {
                            showNetworkAlert.toggle()
                        }
                        
                    }
                }
                .alert("Network is unavailable! Data Services may not function.", isPresented: $showNetworkAlert) {
                    Text("Network is unavailable!")
                }
                .onChange(of: network.isActive) { _ in
                    if network.isActive == false {
                        showNetworkAlert.toggle()
                    }
                }
    }
    
    struct PetTabView_Previews: PreviewProvider {
        static var previews: some View {
            PetTabView()
                .environmentObject(ListViewModel())
                .environmentObject(LaunchScreenManager())
            
        }
    }
}
