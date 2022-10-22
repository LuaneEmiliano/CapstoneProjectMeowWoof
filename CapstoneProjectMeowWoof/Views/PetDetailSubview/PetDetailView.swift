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
            HStack(spacing: 70) {
                Text("Hello \(pet.name)!")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(Color("ButtonStrokeColor"))
                    .padding()
                Image("Labrador")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 120, height: 120)
                    .cornerRadius(150)
                    .padding(.trailing, 30)
                    .padding(.bottom, 20)
                  }
            RoundedRectangle(cornerRadius: 20)
                .fill(Color("Color"))
                .frame(width: 370, height: 130, alignment:.center)
                .overlay(
                    HStack (spacing: 30){
                        if let breed = pet.breed {
                        PetDetailDataIconView(data: breed, icon: "pawprint")
                        }
                        if let birthday = pet.birthDay {
                        PetDetailDataIconView(data: "\(birthday.shortFormat)", icon: "gift")
                        }
                        
                        if let gender = pet.gender {
                            PetDetailDataIconView(data: gender, icon: "arrow.triangle.branch")                       
                        }
                    }
                )
            HStack {
                VStack {
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
                    NavigationLink{
                        PhotoHomeView()
                    } label: {
                        PetDetailRoundedView(color:"PetAlbum", text: "Pet Album", icon: "Album")
                    }
                    PetDetailRoundedView(color: "CareNotes", text: "Care Notes", icon: "Info")
                }
            }
        }
    }
}

struct RoundedRectangleView_Previews: PreviewProvider {
    static var previews: some View {
        PetDetailView(pet: Pet(name: "Luna", age: 7, birthDay: Date(), weight: 20, gender: "Female",  breed: "Golden Retriever", favoriteToys: ["ball"], typeOfAnimal: "dog", color: "PetAlbum"))
            .previewInterfaceOrientation(.portrait)
        PetDetailView(pet: Pet(name: "Luna", age: 7, birthDay: Date(), weight: 20, gender: "Female",  breed: "Golden Retriever", favoriteToys: ["ball"], typeOfAnimal: "dog", color: "PetAlbum"))
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 568, height: 320))
    }
}
