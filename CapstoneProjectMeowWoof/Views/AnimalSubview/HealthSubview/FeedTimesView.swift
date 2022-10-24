//
//  FeedTimesView.swift
//  CapstoneProjectMeowWoof
//
//  Created by luane Niejelski on 10/24/22.
//

import SwiftUI

struct FeedTimesView: View {
    @EnvironmentObject var viewModel: PetViewModel
    let pet: Pet
    
    var body: some View {
        VStack {
            ScrollView {
                
                ForEach(pet.feedTimes, id: \.self ) { feedTime in
                    Text(feedTime.dayAndTimeText)
                        .font(.title2)
                        .fontWeight(/*@START_MENU_TOKEN@*/.semibold/*@END_MENU_TOKEN@*/)
                        .frame(height: 20)
                }
            }
            Button {
                viewModel.addFeedTimeToPet(pet: pet, time: Date())
                viewModel.savePets()
            } label: {
                Text("Feed me here!")
                    .font(.title2)
                    .frame(maxWidth: .infinity)
                    .frame(height: 20)
                    .foregroundColor(.black)
                    .padding()
                    .background(Color("MedicalRecords"))
                    .cornerRadius(10)
                    .padding()
            }
            
        }
        .navigationTitle("Yahh! Happy hour 😄!")
        .padding(.all, 50)
    }
}

struct FeedTimesView_Previews: PreviewProvider {
    static var previews: some View {
        FeedTimesView(pet: Pet(name: "luna", feedTimes: [Date() - 500000, Date()]))
            .preferredColorScheme(.dark)
        
    }
}
