//
//  RoundedRectangleView.swift
//  MeowWoofPetDiary
//
//  Created by luane Niejelski on 9/16/22.
//

import SwiftUI

struct PetDetailView: View {
    
    var pet: Pet
    
    var body: some View {
        ScrollView {
            HStack(alignment: .center, spacing: 10) {
                VStack {
//                    Text("Hello\n\(pet.name)")
//                        .font(.title)
//                        .fontWeight(.bold)
//                        .foregroundColor(Color("ButtonColor"))
//                        .padding(.horizontal, 30)
                }
                Spacer()
                //                    Image("Labrador").resizable().scaledToFit()
                //                        .cornerRadius(10)
                //                        .frame(width: 90, height: 70)
                //                        .shadow(color: Color.black.opacity(0.3), radius: 10, x: 10, y: 10)
                //                        .padding()
            }
            RoundedRectangle(cornerRadius: 20)
                .fill(Color("AddNewPet"))
                .frame(width: 370, height: 100, alignment:.center)
                .shadow(color: Color.purple.opacity(0.2), radius: 10, x: 10, y: 10)
                .overlay(
                    HStack (spacing: 30){
                        PetDetailDataIconView(data: pet.breed, icon: "pawprint")
                        PetDetailDataIconView(data: "\(pet.birthDay.shortFormat)", icon: "gift")
                        PetDetailDataIconView(data: pet.gender, icon: "arrow.triangle.branch")
                        
                    }
                )
            HStack {
                LazyVGrid(columns: [.init(), .init()]) {
                    NavigationLink {
                        MedicalRecordView()
                    } label: {
                        PetDetailRoundedView(color: "MedicalRecords", text: "Medical Record", icon: "Checklist")
                    }
                    NavigationLink {
                     HealthJournalView()
                    } label: {
                        PetDetailRoundedView(color: "Detailed", text: "Health Journal", icon: "Journal")
                    }

                    
                    PetDetailRoundedView(color: "Outdoors", text: "Outdoors", icon: "Outside")
                    PetDetailRoundedView(color: "HealthJournal", text: "Detailed Information", icon: "Information")
                    PetDetailRoundedView(color: "CareNotes", text: "Care Notes", icon: "Info")
                    PetDetailRoundedView(color:"PetAlbum", text: "Pet Album", icon: "Album")
                }
            }
        }
        .navigationTitle(Text("Hello \(pet.name)"))
    }
}

struct RoundedRectangleView_Previews: PreviewProvider {
    static var previews: some View {
        PetDetailView(pet: listOfPets[0])
            .previewInterfaceOrientation(.portrait)
        PetDetailView(pet: listOfPets[0])
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 568, height: 320))
    }
}
