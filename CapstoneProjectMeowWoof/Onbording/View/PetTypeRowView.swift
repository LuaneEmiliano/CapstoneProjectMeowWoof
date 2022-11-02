//
//  PetTypeRowView.swift
//  CapstoneProjectMeowWoof
//
//  Created by luane Niejelski on 9/24/22.
//

import SwiftUI

struct PetTypeRowView: View {
    let icon: String
    let text: String
    let image: String
    
    @Binding var petOptions: String
    
    var body: some View {
        VStack {
          
            Image(image)
                .resizable()
                .frame(width: 55, height: 55)
                .padding()
                .background(Circle())
                .foregroundColor(petOptions == text.lowercased() ? Color(icon) : Color.textfieldColor.opacity(0.3))
                    .background(Color.universalColor)
            Text(text)
                .font(.title3)
                .fontWeight(.regular)
                .foregroundColor(.universalColor)
        }
      
    }
}

struct PetTypeRowView_Previews: PreviewProvider {
    static var previews: some View {
        PetTypeRowView(icon: "Dog", text: "Dog", image: "Dog", petOptions: .constant(""))
    }
}
