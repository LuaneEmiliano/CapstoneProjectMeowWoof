//
//  PetDetailDataIconView.swift
//  MeowWoofPetDiary
//
//  Created by luane Niejelski on 9/18/22.
//

import SwiftUI

struct PetDetailDataIconView: View {
    
    let data: String
    let icon: String
    
    var body: some View {
        VStack(spacing: 30) {
            Text(data)
                .fontWeight(.bold)
                .foregroundColor(Color("ButtonColor"))
                .font(.headline)
                .lineLimit(2)
                .frame(width: 80)
            Image(systemName: icon)
                .foregroundColor(Color("ButtonColor"))
                .font(.title)
        }
    }
}

struct PetDetailDataIconView_Previews: PreviewProvider {
    static var previews: some View {
        PetDetailDataIconView(data: Pet(name: "Luna", age: 7, birthDay: Date(), weight: 20, gender: "Female",  breed: "Golden Retriever", favoriteToys: ["ball"], typeOfAnimal: "dog", color: "PetAlbum").breed ?? "", icon: "pawprint")
    }
}
