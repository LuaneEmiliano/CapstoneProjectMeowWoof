//
//  SettingsView.swift
//  CapstoneProjectMeowWoof
//
//  Created by luane Niejelski on 10/22/22.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView {
            VStack{
                Spacer()
                NavigationLink (
                    destination: Text("Change Password"),
                    label: {
                        SettingsRowView(icon: "ChangePassword", title: "Change Password")
                    })
                NavigationLink (
                    destination: Text("Change Email"),
                    label: {
                        SettingsRowView(icon: "ChangeEmail", title: "Change Email")
                    })
                NavigationLink (
                    destination: Text("Delete Account"),
                    label: {
                        SettingsRowView(icon: "Delete", title: "Delete Account")
                    })
                Spacer()
                Spacer()
                
                Button {
                    
                } label: {
                    Text("SIGN OUT")
                        .padding()
                        .font(.headline)
                        .background(.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding()
                }
                .navigationTitle("Settings")
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .preferredColorScheme(.light)
    }
}
