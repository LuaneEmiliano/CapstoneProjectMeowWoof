//
//  MedicalRecordView.swift
//  MeowWoofPetDiary
//
//  Created by luane Niejelski on 9/17/22.
//

import SwiftUI

struct MedicalRecordView: View {
    let pet: Pet
    var body: some View {
        VStack {
            NavigationLink {
                UploadVaccinationDocumentView(pet: pet)
            }  label: {
                MedicalRecordRowView(icon: "Vaccination", title: "Vaccination History", description: "See your vaccination history and make sure you're up to date")
            }
            NavigationLink {
                UploadMedicalDocumentView(pet: pet)
            } label: {
                MedicalRecordRowView(icon: "MedicalRecord", title: "Medical Record", description: "Upload your pet Medical Record here.")
            }
            NavigationLink {
                UploadInsuranceDocumentView(pet: pet)
            }  label: {
                MedicalRecordRowView(icon: "Insurance", title:  "Insurance", description: "Upload your pet insurance here. ")
            }
        }
        .navigationTitle(Text("Medical Record"))
        .padding()
    }
}

struct MedicalRecordView_Previews: PreviewProvider {
    static var previews: some View {
        MedicalRecordView(pet: Pet(name: "Luna"))
    }
}
