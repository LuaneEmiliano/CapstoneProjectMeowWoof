//
//  PetDetailRoundedView.swift
//  MeowWoofPetDiary
//
//  Created by luane Niejelski on 9/18/22.
//

import SwiftUI

struct PetDetailRoundedView: View {
    var color: String
    var text: String
    var icon: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(Color(color))
            .frame(width: 170, height: 130)
            .shadow(color: Color.purple.opacity(0.2), radius: 10, x: 10, y: 10)
            .padding(.top, 4)
            .overlay(
                VStack {
                    Text(text)
                        .font(.title3)
                        .foregroundColor(.white)
                    Image(icon)
                        .renderingMode(.template)
                        .resizable()
                        .foregroundColor(Color.white)
                        .frame(width: 50, height: 40)
                }
            )
    }
}

struct PetDetailRoundedView_Previews: PreviewProvider {
    static var previews: some View {
        PetDetailRoundedView(color: "MedicalRecords", text: "Medical Records", icon: "Checklist")
    }
}
