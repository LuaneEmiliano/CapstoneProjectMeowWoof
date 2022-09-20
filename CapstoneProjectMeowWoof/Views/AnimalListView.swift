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
                ForEach(petList) { pet in
                    NavigationLink {
                        PetDetailView(pet: pet)
                    } label: {
                        AnimalListRowView(pet: pet)
                    }

                }
            }
        }
    }
}

struct AnimalListView_Previews: PreviewProvider {
    static var previews: some View {
        AnimalListView()
    }
}
