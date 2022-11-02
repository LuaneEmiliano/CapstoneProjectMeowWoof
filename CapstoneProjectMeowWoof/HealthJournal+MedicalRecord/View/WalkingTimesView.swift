//
//  WalkingTimesView.swift
//  CapstoneProjectMeowWoof
//
//  Created by luane Niejelski on 10/24/22.
//

import SwiftUI

struct WalkingTimesView: View {
    @EnvironmentObject var viewModel: PetViewModel
    let pet: Pet
    
    var body: some View {
        VStack {
            ScrollView {
                ForEach(pet.walkingTimes, id: \.self) {
                    walkingTime in
                    Text(walkingTime.dayAndTimeText)
                        .font(.title2)
                        .fontWeight(/*@START_MENU_TOKEN@*/.semibold/*@END_MENU_TOKEN@*/)
                        .frame(height: 20)
                }
            }
            Button {
                viewModel.addWalkingTimesToPet(pet: pet, time: Date())
                viewModel.savePets()
            } label: {
                Text("Add walks here!")
                    .font(.title2)
                    .frame(maxWidth: .infinity)
                    .frame(height: 20)
                    .foregroundColor(.black)
                    .padding()
                    .background(Color.careNotes)
                    .cornerRadius(10)
                    .padding()
            }
            
        }
        .navigationTitle("Let's go for a walk😄!")
        .padding(.all, 50)
    }
}

struct WalkingTimesView_Previews: PreviewProvider {
    static var previews: some View {
        WalkingTimesView(pet: Pet(name: "Olivia",feedTimes: [Date() - 500000, Date()]))
            .preferredColorScheme(.dark)
    }
}
