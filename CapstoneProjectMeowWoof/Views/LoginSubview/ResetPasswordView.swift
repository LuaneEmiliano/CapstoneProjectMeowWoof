//
//  ResetPasswordView.swift
//  CapstoneProjectMeowWoof
//
//  Created by luane Niejelski on 10/25/22.
//

import SwiftUI

struct ResetPasswordView: View {
    @State var email: String = ""
    
    var body: some View {
        VStack {
            Spacer()
            VStack {
                TextField("Email", text: $email, prompt: Text("Enter email..."))
                    .font(.title2)
                    .padding()
                    .background(Color.textfieldColor)
                    .cornerRadius(10)
            }
            .padding()
            
            VStack(spacing: 16) {
                Button {
                    print("email: \(email)")
                } label: {
                    Text("Reset password")
                        .font(.title2)
                        .frame(maxWidth: .infinity)
                        .frame(height: 40)
                        .foregroundColor(.black)
                        .padding()
                        .background(Color.lightpurpleColor)
                        .cornerRadius(10)
                        .padding()
                }
            }
            Spacer()
        }
        .navigationTitle("Reset Password")
    }
}


struct ResetPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ResetPasswordView()
            .preferredColorScheme(.light)
    }
}
