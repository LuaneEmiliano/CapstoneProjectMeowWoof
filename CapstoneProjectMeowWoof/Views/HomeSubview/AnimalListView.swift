//
//  AnimalListView.swift
//  MeowWoofPetDiary
//
//  Created by luane Niejelski on 9/18/22.
//

import SwiftUI

struct AnimalListView: View {
    
    var petList: [Pet] = listOfPets
    
    var body: some View {
        NavigationView {
            VStack {
                LazyVGrid(columns: [.init(),  .init()]) {
                    ForEach(petList) { pet in
                        NavigationLink {
                            PetDetailView(pet: pet)
                        } label: {
                            AnimalListRowView(pet: pet, image: pet.typeOfAnimal.capitalized, icon: pet.color)
                        }
                    }
                }
                .padding(.top, 30)
                Spacer()
            }
            .navigationTitle("My Pets")
            .navigationBarItems(
                trailing:
                    Button {
                        
                    } label: {
                        Image(systemName: "plus.circle")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(Color("Detailed"))
                    }
            )
        }
        .navigationBarHidden(true)
    }
}


struct AnimalListView_Previews: PreviewProvider {
    static var previews: some View {
        AnimalListView()
    }
}
