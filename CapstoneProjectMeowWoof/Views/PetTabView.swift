//
//  PetTabView.swift
//  MeowWoofPetDiary
//
//  Created by luane Niejelski on 9/15/22.
//

import SwiftUI

struct PetTabView: View {
    
    @State var selectedTab: Int = 3
    
    var body: some View {
        
        TabView(selection: $selectedTab) {
            AnimalListView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                    
                }
                .tag(0)
            HomeScreenView()
                .tabItem {
                    Image(systemName: "heart.circle.fill")
                    Text("Tracker")
                }
                .tag(1)
            HomeListView()
                .tabItem {
                    Image(systemName: "alarm.fill")
                    Text("Reminder")
                }
                .tag(2)
            Text("More")
                .tabItem {
                    Image(systemName: "ellipsis.circle.fill")
                    Text("More")
                }
                .tag(3)
        }
    }
    
    struct PetTabView_Previews: PreviewProvider {
        static var previews: some View {
            PetTabView()
            
        }
    }
    
    struct ExtractedView: View {
        var body: some View {
            ZStack {
                Text("Home tab")
                    .environmentObject(ListViewModel())
                
            }
            
        }
    }
}
