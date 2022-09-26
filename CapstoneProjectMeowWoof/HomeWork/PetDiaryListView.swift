//
//  WeekTwoView.swift
//  MeowWoofPetDiary
//
//  Created by luane Niejelski on 8/24/22.
//

import SwiftUI

struct WeekTwoView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            VStack(alignment: .leading) {
                ForEach(listOfPets) { pet  in
                    Text("Name: \(pet.name)\nAge: \(pet.age)\nBreed: \(pet.breed)\nAnimal Type: \(pet.typeOfAnimal)")
                    Rectangle()
                        .font(.title)
                }
                .padding(.init(top: 30, leading: 10, bottom: 10, trailing: 10))
            }
            .background(Color("BackgroundColor"))
        })
            .edgesIgnoringSafeArea(.all)
    }
}

struct WeekTwoView_Previews: PreviewProvider {
    static var previews: some View {
        WeekTwoView()
    }
}
