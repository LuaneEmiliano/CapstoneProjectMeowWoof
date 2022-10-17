//
//  PetTypeView.swift
//  CapstoneProjectMeowWoof
//
//  Created by luane Niejelski on 9/24/22.
//

import SwiftUI

struct PetTypeView: View {
 
    @State var petsBirthday = Date()
    @State var petOptions: String = ""
    @State var button: Bool = false
    
    let list = petTypeList()
    
    var body: some View {
    
        VStack {
                        
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
                        PetTypeRowView(icon: "HealthJournal", text: "Other", image: "Others", petOptions: $petOptions)
                    }
                }
            }
            Button {
                button.toggle()
            } label: {
                Text("Next")
                    .padding(.horizontal, 157)
                    .padding(.vertical, 15)
                    .background(Color("ButtonColor"))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .font(.headline)
                    
            }
            .padding(.top, 400)
            Spacer()
                
        }
        .padding(.all, 15)
    }
}



struct PetTypeView_Previews: PreviewProvider {
    static var previews: some View {
        PetTypeView()
    }
}
