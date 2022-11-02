//
//  PetGenderView.swift
//  CapstoneProjectMeowWoof
//
//  Created by luane Niejelski on 10/22/22.
//

import SwiftUI

struct PetGenderView: View {
    @State var petGenderOptions: String = ""
    @EnvironmentObject var viewModel: PetViewModel
    let pet: Pet?
    @State var nextView: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            HStack(spacing: 70) {
                VStack {
                    Button {
                        petGenderOptions = "male"
                    } label: {
                        PetGenderRowView(icon: "PetAlbum", text: "Male", image:"Male", petGenderOptions: $petGenderOptions)
                    }
                }
                VStack{
                    Button {
                        petGenderOptions = "female"
                    } label: {
                        PetGenderRowView(icon: "CareNotes", text: "Female", image: "Female", petGenderOptions: $petGenderOptions)
                    }
                }
            }
            Spacer()
            Spacer()
            
            Button {
                if let pet = pet {
                    viewModel.updatePetInfo(id: pet.id, gender: petGenderOptions)
                }
                viewModel.savePets()
                nextView.toggle()
            } label: {
                Text("Next")
                    .frame(maxWidth:.infinity)
                    .padding(.vertical,15)
                    .background(Color.buttonColor)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.top )
            .accessibilityIdentifier("SaveButton")
            
            Button {
                
            } label: {
                Text("Skip")
                    .foregroundColor(.primary)
            }
            .padding(.top )
        }
        .padding(.all)
        .fullScreenCover(isPresented: $nextView) {
            PetInfoListView(pet: pet)
        }
    }
}

struct PetGenderView_Previews: PreviewProvider {
    static var previews: some View {
        PetGenderView(pet: nil)
            .preferredColorScheme(.dark)
        
    }
}
