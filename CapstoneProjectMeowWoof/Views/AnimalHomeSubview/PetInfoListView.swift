//
//  PetInfoListView.swift
//  CapstoneProjectMeowWoof
//
//  Created by luane Niejelski on 10/22/22.
//

import SwiftUI

struct PetInfoListView: View {
    @State var breedTextField: String = ""
    @State var colorTextField: String = ""
    @State var weightTextField: String = ""
    @State var nextView: Bool = false
    
    @EnvironmentObject var viewModel: PetViewModel
    let pet: Pet?
    
    var body: some View {
        VStack {
            Spacer()
            Text("What's your pet's breed?")
                .font(.title2)
            TextField("Type breed", text: $breedTextField)
                .foregroundColor(.black)
                .padding(.horizontal)
                .frame(height: 55)
                .background(Color("TextfieldColor"))
                .cornerRadius(10)
            Text("What's your pet's color?")
                .font(.title2)
            TextField("Type color here...", text: $colorTextField)
                .padding(.horizontal)
                .frame(height: 55)
                .background(Color("TextfieldColor"))
                .cornerRadius(10)
            Text("What's your pet's weight?")
                .font(.title2)
            TextField("Type weight here...", text: $weightTextField)
                .padding(.horizontal)
                .frame(height: 55)
                .background(Color("TextfieldColor"))
                .keyboardType(.numberPad)
                .cornerRadius(10)
            Spacer()
            
            Button {
                if let pet = pet {
                    viewModel.updatePetInfo(id: pet.id, weight: Int(weightTextField), breed: breedTextField, color: colorTextField)
                }
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
            .fullScreenCover(isPresented: $nextView) {
                PetFavoritesListView(pet: pet)
            }
        }
        .padding()
    }
}

struct PetInfoListView_Previews: PreviewProvider {
    static var previews: some View {
        PetInfoListView(breedTextField: "Type here", pet: nil)
            .preferredColorScheme(.light)
    }
}
