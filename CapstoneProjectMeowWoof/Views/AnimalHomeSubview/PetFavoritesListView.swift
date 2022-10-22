//
//  PetFavoritesListView.swift
//  CapstoneProjectMeowWoof
//
//  Created by luane Niejelski on 10/22/22.
//

import SwiftUI

struct PetFavoritesListView: View {
    @State var foodTextField: String = ""
    @State var toyTextField: String = ""
    @State var activityTextField: String = ""
    @State var nextView: Bool = false
    
    @EnvironmentObject var viewModel: PetViewModel
    let pet: Pet?
    
    var body: some View {
        VStack {
            Spacer()
            Text("What's your pet's favorite food?")
                .font(.title2)
            TextField("Type food here...", text: $foodTextField)
                .foregroundColor(.black)
                .padding(.horizontal)
                .frame(height: 55)
                .background(Color("TextfieldColor"))
                .cornerRadius(10)
            Text("What's your pet's favorite toy?")
                .font(.title2)
            TextField("Type toy here...", text: $toyTextField)
                .padding(.horizontal)
                .frame(height: 55)
                .background(Color("TextfieldColor"))
                .cornerRadius(10)
            Text("What's your pet's favorite outdoor activity?")
                .font(.title2)
            TextField("Type activity here...", text: $activityTextField)
                .padding(.horizontal)
                .frame(height: 55)
                .background(Color("TextfieldColor"))
                .keyboardType(.numberPad)
                .cornerRadius(10)
            Spacer()
            
            Button {
                if let pet = pet {
                    viewModel.updatePetInfo(id: pet.id,  favoriteToys: [toyTextField], favoriteFood: [foodTextField],
                        favoriteActivity: [activityTextField])
                }
                viewModel.savePets()
                nextView.toggle()
            } label: {
                Text("Save".uppercased())
                    .font(.headline)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .background(Color("ButtonColor"))
                    .cornerRadius(10)
            }
        }
        .padding()
        .fullScreenCover(isPresented: $nextView) {
            PetDetailView(pet: pet ?? Pet(name: "Error"))
        }
    }
}

struct PetFavoritesListView_Previews: PreviewProvider {
    static var previews: some View {
        PetFavoritesListView(pet: nil)
    }
}
