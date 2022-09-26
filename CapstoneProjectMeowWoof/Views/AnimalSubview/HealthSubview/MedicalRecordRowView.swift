//
//  MedicalRecordRowView.swift
//  MeowWoofPetDiary
//
//  Created by luane Niejelski on 9/17/22.
//

import SwiftUI

struct MedicalRecordRowView: View {
    
    let icon: String
    let title: String
    let description: String
    
    var body: some View {
        HStack {
            Image(icon)
                .resizable()
                .frame(width: 70, height: 70)
                .shadow(color: .blue, radius: 10, x: 7, y: 7)
                .padding(.trailing)
            VStack(alignment: .leading) {
                Text(title)
                    .font(.title2)
                Text(description)
                    .font(.body)
                    .fontWeight(.medium)
                    .multilineTextAlignment(.leading)
            }
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .frame(height: 150)
        .foregroundColor(.black)
        .padding()
        .background(Color("MedicalRecords"))
        .cornerRadius(20)
    }
}

struct MedicalRecordRowView_Previews: PreviewProvider {
    static var previews: some View {
        MedicalRecordRowView(icon: "Vaccination", title: "Vaccination Records", description: "See your vaccination history and make sure you're up to date")
    }
}
