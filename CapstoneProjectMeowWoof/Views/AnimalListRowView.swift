//
//  AnimalListRowView.swift
//  MeowWoofPetDiary
//
//  Created by luane Niejelski on 9/18/22.
//

import SwiftUI

struct AnimalListRowView: View {
    
    var pet: Pet
    
    var body: some View {
        Text(pet.name)
            .font(.title)
            .foregroundColor(.black)
            .frame(height: 100)
            .frame(maxWidth: .infinity)
            .background(Color("PetAlbum"))
            .cornerRadius(20)
    }
}

struct AnimalListRowView_Previews: PreviewProvider {
    static var previews: some View {
        AnimalListRowView(pet: listOfPets[0])
    }
}
