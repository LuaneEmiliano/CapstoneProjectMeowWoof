
//  ButtonView.swift
//  MeowWoofPetDiary
//
//  Created by luane Niejelski on 8/25/22.
//

import SwiftUI

struct ButtonText: View {
    @State var continuButton = false
    
    var body: some View {
        VStack {
            Button(action:  {
                continuButton = true
            }) {
                ButtonContinueView(text: "Continue")
                    .padding(.horizontal)
            }
            .sheet(isPresented: $continuButton) {
                WeekTwoView()
            }
            .frame(maxWidth: 200)
            .background(
                Color("ButtonColor")
            )
        }
        .foregroundColor(.black)
        .cornerRadius(12.0)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonText()
    }
}
