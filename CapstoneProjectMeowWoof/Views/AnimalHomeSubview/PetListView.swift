//
//  AnimalListView.swift
//  MeowWoofPetDiary
//
//  Created by luane Niejelski on 9/18/22.
//

import SwiftUI

struct AnimalListView: View {
    
    @EnvironmentObject var viewModel: PetViewModel
    //    var petList: [Pet] = listOfPets
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    LazyVGrid(columns: [.init(),  .init()]) {
                        ForEach(viewModel.pets) { pet in
                            NavigationLink {
                                PetDetailView(pet: pet)
                            } label: {
                                AnimalListRowView(
                                    pet: pet,
                                    image: pet.typeOfAnimal?.capitalized ?? "Others",
                                    icon: determineColor(pet: pet)
                                )
                            }
                        }
                    }
                    .padding(.top, 30)
                    Spacer()
                }
                .navigationTitle("My Pets")
                .navigationBarItems(
                    trailing:
                        
                        NavigationLink(destination: {
                            AddingNameView()
                        }, label: {
                            Image(systemName: "plus.circle")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundColor(Color("Detailed"))
                                .padding(5)
                        })
                )
            }
        }
        .navigationViewStyle(.stack)
        .navigationBarHidden(true)
    }
    
    func determineColor(pet: Pet) -> String {
        if pet.typeOfAnimal == "dog" {
           return "Color2"
        } else if pet.typeOfAnimal == "cat" {
           return "CareNotes"
        } else {
            return "HealthJournal"
        }
    }
}


struct AnimalListView_Previews: PreviewProvider {
    static var previews: some View {
        AnimalListView()
    }
}
