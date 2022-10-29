//
//  TrainingView.swift
//  CapstoneProjectMeowWoof
//
//  Created by luane Niejelski on 10/24/22.
//

import SwiftUI

struct TrainingView: View {
    
    @EnvironmentObject var viewModel: PetViewModel
    let pet: Pet
    @State var textField: String = ""
    @State var date: Date = Date()
    
    var body: some View {
        VStack {
            ForEach(pet.training) { training in
                VStack {
                    Text(training.name)
                    Text(training.date.dayAndTimeText)
                        .font(.caption)
                }
            }
            Spacer()
            
            DatePicker("Date of training", selection: $date)
            TextField("Add Training Name Here...", text: $textField)
                .font(.headline)
                .frame(height: 20)
                .frame(maxWidth: .infinity)
                .foregroundColor(.black)
                .padding()
                .background(Color.textfieldColor)
                .cornerRadius(10)
                .padding()
            
            Spacer()
            Button {
                viewModel.addTrainingToPet(
                    pet: pet,
                    training: Training(name: textField, date: date))
                textField = ""
                date = Date()
                viewModel.savePets()
            } label: {
                Text("Enter")
                    .font(.title2)
                    .frame(maxWidth: .infinity)
                    .frame(height: 20)
                    .foregroundColor(.black)
                    .padding()
                    .background(Color.lightpurpleColor)
                    .cornerRadius(10)
                    .padding()
            }
        }
        .padding(.all, 20)
        .navigationTitle("It's time to train! 😎")
    }
}

struct TrainingView_Previews: PreviewProvider {
    static var previews: some View {
        TrainingView(pet: Pet(name: "Luna"))
    }
}
