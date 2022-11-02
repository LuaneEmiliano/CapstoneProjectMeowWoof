//
//  PetTypeView.swift
//  CapstoneProjectMeowWoof
//
//  Created by luane Niejelski on 9/24/22.
//

import SwiftUI

struct PetTypeView: View {
 
    @EnvironmentObject var viewModel: PetViewModel
    let pet: Pet?
    @State var petsBirthday = Date()
    @State var petOptions: String = ""
    @State var button: Bool = false
    
    let list = petTypeList()
    
    var body: some View {
    
        VStack {
            
            Spacer()
            
            DatePicker("Pet's Birthday🎉", selection: $petsBirthday, displayedComponents: [.date])
                .datePickerStyle(.compact)
                .font(.headline)
                .padding(.bottom, 60)
                
            
            HStack(spacing: 40) {
                VStack{
                    Button {
                        petOptions = list[0]
                    } label: {
                        PetTypeRowView(icon: "PetAlbum", text: "Dog", image: "Dog", petOptions: $petOptions)
                    }
                }
                VStack{
                    Button {
                        petOptions = list[1]
                    } label: {
                        PetTypeRowView(icon: "CareNotes", text: "Cat", image: "Cat", petOptions: $petOptions)
                    }
                }
                VStack{
                    Button {
                        petOptions = list[2]
                    } label: {
                        PetTypeRowView(icon: "HealthJournalColor", text: "Others", image: "OtherAnimal", petOptions: $petOptions)
                    }
                }
            }
            Spacer()
            Spacer()
            Button {
                if let pet = pet {
                    viewModel.updatePetInfo(id: pet.id, birthDay: petsBirthday, typeOfAnimal: petOptions)
                }
                viewModel.savePets()
                button.toggle()
                
            } label: {
                Text("Next")
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 15)
                    .background(Color.buttonColor)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .font(.headline)
                    
            }
            .fullScreenCover(isPresented: $button) {
                PetGenderView(pet: pet)
            }
        }
        .padding(.all, 15)
    }
}



struct PetTypeView_Previews: PreviewProvider {
    static var previews: some View {
        PetTypeView(pet: Pet(name: "Stella"))
    }
}
