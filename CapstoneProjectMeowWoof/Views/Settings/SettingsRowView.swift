//
//  SettingsRowView.swift
//  CapstoneProjectMeowWoof
//
//  Created by luane Niejelski on 10/22/22.
//

import SwiftUI

struct SettingsRowView: View {
    let icon: String
    let title: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.title2)
                    .fontWeight(.medium)
            }
            Spacer()
            Image(icon)
                .resizable()
                .frame(width: 30, height: 30)
                .padding(.trailing,30)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 20)
        .foregroundColor(.black)
        .padding()
        .background(Color("PetAlbum"))
        .cornerRadius(10)
        .padding()
    }
}

struct SettingsRowView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsRowView(icon:"ChangePassword", title: "Change Password")
            .preferredColorScheme(.light)
    }
}
