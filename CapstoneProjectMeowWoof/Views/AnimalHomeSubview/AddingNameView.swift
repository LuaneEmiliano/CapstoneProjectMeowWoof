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
    
    var body: some View {
        NavigationView{
            VStack {
                Text("What's your pet's name?")
                    .font(.title)
                    .fontWeight(.semibold)
                Spacer()
                TextField("Enter your pet's name here...", text: $textFieldText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .font(.headline)
                Button {
                    if isTextApropriate() {
                        saveText()
                        // Using Singleton
//                        SoundManager.instance.playSound()
                        nextView.toggle()
                    }
                } label: {
                    Text("NEXT")
                        .padding(.horizontal, 157)
                        .padding(.vertical, 15)
                        .background(isTextApropriate() ? Color.buttonColor : Color.gray)
                        .cornerRadius(10)
                        .foregroundColor(Color.white)
                        .font(.headline)
                }
            }
            .fullScreenCover(isPresented: $nextView) {
                PetTypeView(pet: pet)
            }
        }
    }
    
    func saveText() {
        pet = Pet(name: textFieldText)
        viewModel.addPet(pet: pet)
        viewModel.savePets()
        textFieldText = ""
    }
    
    func isTextApropriate() -> Bool {
        if textFieldText.count >= 3 {
            return true
        }
        return false
    }
}

struct AddingNameView_Previews: PreviewProvider {
    static var previews: some View {
        AddingNameView()
    }
}
