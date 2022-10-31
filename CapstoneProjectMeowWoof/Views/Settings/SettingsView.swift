//
//  SettingsView.swift
//  CapstoneProjectMeowWoof
//
//  Created by luane Niejelski on 10/22/22.
//

import SwiftUI

struct SettingsView: View {
    
    @EnvironmentObject var viewModel: MainMessagesViewModel
    @Binding var shouldShowLogOutOptions: Bool
    
    var body: some View {
        NavigationView {
            VStack{
                Spacer()
                NavigationLink (
                    destination: Text("Reset Password"),
                    label: {
                        SettingsRowView(icon: "ChangePassword", title: "Reset Password")
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
                    viewModel.handleSignOut()
                    shouldShowLogOutOptions.toggle()
                } label: {
                    Text("SIGN OUT")
                        .font(.headline)
                        .frame(maxWidth: . infinity,
                        minHeight: 45)
                        .foregroundColor(.blackColor)
                        .background(Color.universalColor)
                        .cornerRadius(10)
                        .padding()
                        .padding(.bottom,10)
                }
                .navigationTitle("Settings")
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView( shouldShowLogOutOptions: .constant(false))
            .preferredColorScheme(.light)
    }
}
