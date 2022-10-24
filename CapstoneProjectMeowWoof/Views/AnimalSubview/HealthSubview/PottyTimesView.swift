//
//  PottyTimesView.swift
//  CapstoneProjectMeowWoof
//
//  Created by luane Niejelski on 10/24/22.
//

import SwiftUI

struct PottyTimesView: View {
    @EnvironmentObject var viewModel: PetViewModel
    let pet: Pet
    
    var body: some View {
        VStack {
            ScrollView {
                ForEach(pet.pottyTimes, id: \.self) { pottyTime in
                    Text(pottyTime.dayAndTimeText)
                        .font(.title2)
                        .fontWeight(/*@START_MENU_TOKEN@*/.semibold/*@END_MENU_TOKEN@*/)
                        .frame(height: 20)
                }
            }
            
            Button {
                viewModel.addPottyTimesToPet(pet: pet, time: Date())
                viewModel.savePets()
            } label: {
                Text("Add Potty times 🐶")
                    .font(.title2)
                    .frame(maxWidth: .infinity)
                    .frame(height: 20)
                    .foregroundColor(.black)
                    .padding()
                    .background(Color("PetAlbum"))
                    .cornerRadius(10)
                    .padding()
            }
        }
        .navigationTitle("Hey, It's potty time!")
        .padding(.all, 50)
    }
}

struct PottyTimesView_Previews: PreviewProvider {
    static var previews: some View {
        PottyTimesView(pet: Pet(name: "Luna", pottyTimes: [Date() - 500000, Date()]))
            .preferredColorScheme(.light)
.previewInterfaceOrientation(.portrait)
    }
}
