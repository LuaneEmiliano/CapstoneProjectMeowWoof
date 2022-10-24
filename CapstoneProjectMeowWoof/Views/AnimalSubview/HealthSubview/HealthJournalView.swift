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
                    .foregroundColor(Color("ButtonColor"))
                    .padding(.top)
                Image("Health")
                    .resizable()
                    .frame(width: 380, height: 250)
                    .cornerRadius(20)
                    .padding()
                LazyVGrid(columns: [.init(), .init()]) {
                    NavigationLink {
                        FeedTimesView(pet: pet)
                    } label: {
                        HealthJournalRowView(icon: "MedicalRecords", text: "Feed Times", image: "bowl")
                    }
                    NavigationLink {
                       PottyTimesView(pet: pet)
                    } label: {
                        HealthJournalRowView(icon: "PetAlbum", text: "Potty Times", image: "Potty")
                    }
                    NavigationLink {
                        Text("Supplements Page")
                    } label: {
                        HealthJournalRowView(icon: "CareNotes", text: "Supplements", image: "Supplements")
                    }
                    NavigationLink {
                        Text("Training Page")
                    } label: {
                        HealthJournalRowView(icon: "Color2", text: "Training", image: "Training")
                    }
                    NavigationLink {
                        Text("Socialize")
                    } label: {
                        HealthJournalRowView(icon: "PetAlbum", text: "Socialize", image: "Socialize")
                    }
                    NavigationLink {
                        Text("CheckList Page")
                    } label: {
                        HealthJournalRowView(icon: "HealthJournal", text:"CheckList", image: "Checklist")
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
