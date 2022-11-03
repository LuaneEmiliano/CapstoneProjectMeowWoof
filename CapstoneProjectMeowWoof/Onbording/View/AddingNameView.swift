//
//  AddingNameView.swift
//  CapstoneProjectMeowWoof
//
//  Created by luane Niejelski on 9/24/22.
//

import SwiftUI

struct AddingNameView: View {
    
    @EnvironmentObject var viewModel: PetViewModel
    @State var pet: Pet? = nil
    @State var textFieldText: String = ""
    @State var nextView: Bool = false
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView{
            VStack {
                Text("What's your pet's name?")
                    .font(.title)
                    .fontWeight(.semibold)
                Spacer()
                TextField("Enter your pet's name here...", text: $textFieldText)
                    .foregroundColor(.universalColor)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: Project.Constants.General.roundedEdges)
                            .stroke(lineWidth: 2)
                        )
                    .padding()
                Button {
                        saveText()
                        nextView.toggle()
                } label: {
                    Text("NEXT")
                        .padding(.horizontal, 157)
                        .padding(.vertical, 15)
                        .background(Color.buttonColor )
                        .cornerRadius(10)
                        .foregroundColor(Color.white)
                        .font(.headline)
                }
            }
            .fullScreenCover(isPresented: $nextView) {
                PetTypeView(pet: pet)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        HStack {
                            Image(systemName: "chevron.left")
                            Text("Back")
                        }
                    }

                }
                
            }
        }
    }
    
    func saveText() {
        pet = Pet(name: textFieldText)
        viewModel.addPet(pet: pet)
        viewModel.savePets()
        textFieldText = ""
    }
}

struct AddingNameView_Previews: PreviewProvider {
    static var previews: some View {
        AddingNameView()
    }
}
