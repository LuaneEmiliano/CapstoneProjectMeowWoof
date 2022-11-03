//
//  RoundedRectangleView.swift
//  MeowWoofPetDiary
//
//  Created by luane Niejelski on 9/16/22.
//

import SwiftUI

struct PetDetailView: View {
    
    var pet: Pet
    @EnvironmentObject var viewModel: PetViewModel
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            HStack(spacing: 30) {
                Text("Hello \(pet.name)!")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.buttonStrokeColor)
                    .padding()
                Image("Labrador")
                    .resizable()
                    .frame(width: 140, height: 150)
                    .clipShape(Circle())
                    .scaledToFit()
                               .shadow(radius: 15)
                               .overlay(Circle().stroke(Color.petAlbum, lineWidth: 3))
                    
                  }
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.lightBlueColor)
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
                        MedicalRecordView(pet: pet)
                    } label: {
                        PetDetailRoundedView(color: "MedicalRecordsColor", text: "Medical Record", icon: "MedicalRecord")
                    }
                    NavigationLink {
                        HealthJournalView(pet: pet)
                    } label: {
                        PetDetailRoundedView(color: "DetailedColor", text: "Health Journal", icon: "Journal")
                    }
                    NavigationLink{
                      PhotoHomeView(pet: pet)
                    } label: {
                        PetDetailRoundedView(color: "PetAlbum", text: "Pet Album", icon: "Album")
                    }
                    NavigationLink {
                        CareNotesView(pet: pet)
                    } label: {
                        PetDetailRoundedView(color: "CareNotes", text: "Care Notes", icon: "Info")
                    }
                }
            }
        }
        .toolbar {
            ToolbarItem {
                Button {
                    showAlert.toggle()
                    
                } label: {
                    Text("Delete Pet")
                        .padding()
                        .background(Color.petAlbum)
                        .foregroundColor(Color.buttonStrokeColor)
                        .cornerRadius(15)
                }
            }
        }
        .alert("Are you sure you want to delete this pet?", isPresented: $showAlert) {
            
            Button(role: .cancel) {
                showAlert = false
            } label: {
                Text("Cancel")
            }
            
            Button(role: .destructive) {
                viewModel.deletePet(pet: pet)
                viewModel.savePets()
            } label: {
                Text("Delete")
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
