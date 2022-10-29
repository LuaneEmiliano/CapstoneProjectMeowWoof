//
//  HealthJournalView.swift
//  MeowWoofPetDiary
//
//  Created by luane Niejelski on 9/18/22.
//

import SwiftUI

struct HealthJournalView: View {
    
    let pet: Pet
    
    var body: some View {
          ScrollView {
            VStack {
                Text("Health Journal")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.buttonColor)
                    .padding(.top,40)
                Image("Health")
                    .resizable()
                    .frame(width: 380, height: 250)
                    .cornerRadius(20)
                    .padding()
                LazyVGrid(columns: [.init(), .init()]) {
                    NavigationLink {
                        FeedTimesView(pet: pet)
                    } label: {
                        HealthJournalRowView(icon: "MedicalRecordsColor", text: "Feed Times", image: "bowl")
                    }
                    NavigationLink {
                       PottyTimesView(pet: pet)
                    } label: {
                        HealthJournalRowView(icon: "PetAlbum", text: "Potty Times", image: "Potty")
                    }
                
                    NavigationLink {
                        TrainingView(pet: pet)
                    } label: {
                        HealthJournalRowView(icon: "LightBlueColor", text: "Training", image: "Training")
                    }
                    NavigationLink {
                       WalkingTimesView(pet: pet)
                    } label: {
                        HealthJournalRowView(icon: "CareNotes", text: "Walking Times", image: "Socialize")
                    }
    
                }
                Spacer()
            }
           
        }
    }
}

struct HealthJournalView_Previews: PreviewProvider {
    static var previews: some View {
        HealthJournalView(pet: Pet(name: "Luna"))
    }
}
