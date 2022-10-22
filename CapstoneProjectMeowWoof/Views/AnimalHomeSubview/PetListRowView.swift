//
//  AnimalListRowView.swift
//  MeowWoofPetDiary
//
//  Created by luane Niejelski on 9/18/22.
//

import SwiftUI

struct AnimalListRowView: View {
    
    var pet: Pet
    let image: String
    let icon: String
    
    var body: some View {
        VStack {
            Image(image)
                .resizable()
                .frame(width: 100, height: 100)
                .padding()
                .padding()
                .background(Circle())
                .foregroundColor(Color(icon))
            Text(pet.name)
                .font(.title)
                .foregroundColor(Color(.black))
                .cornerRadius(20)
        }
    }
}

struct AnimalListRowView_Previews: PreviewProvider {
    static var previews: some View {
        AnimalListRowView(pet: Pet(name: "Luna", age: 7, birthDay: Date(), weight: 20, gender: "Female",  breed: "Golden Retriever", favoriteToys: ["ball"], typeOfAnimal: "dog", color: "PetAlbum"), image: "Dog", icon: "PetAlbum")
    }
}
