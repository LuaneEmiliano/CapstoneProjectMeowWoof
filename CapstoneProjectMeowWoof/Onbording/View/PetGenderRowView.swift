//
//  PetGenderRowView.swift
//  CapstoneProjectMeowWoof
//
//  Created by luane Niejelski on 10/22/22.
//

import SwiftUI

struct PetGenderRowView: View {
    let icon: String
    let text: String
    let image: String
    
    @Binding var petGenderOptions: String
    
    var body: some View {
        VStack {
            Image(image)
                .resizable()
                .frame(width: 55, height: 55)
                .padding()
                .background(Circle())
                .foregroundColor(petGenderOptions == text.lowercased() ? Color(icon) : Color.gray.opacity(0.3))
            Text(text)
                .font(.title3)
                .fontWeight(.regular)
                .foregroundColor(.primary)
        }
    }
}

struct PetGenderRowView_Previews: PreviewProvider {
    static var previews: some View {
        PetGenderRowView(icon: "Male", text: "Male", image: "Male", petGenderOptions: .constant(""))
            .preferredColorScheme(.dark)
    }
}
