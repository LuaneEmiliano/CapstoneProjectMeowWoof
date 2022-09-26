//
//  PhotoHomeView.swift
//  CapstoneProjectMeowWoof
//
//  Created by luane Niejelski on 9/25/22.
//

import SwiftUI

struct PhotoHomeView: View {
    
    @State var roundedRectangleButton: Bool = false
    @State var addingButton: Bool = false
    
    var body: some View {
        ZStack {
            Color("Color3")
                .ignoresSafeArea()
            VStack {
                HStack {
                    Button {
                        addingButton.toggle()
                    } label: {
                        Image(systemName: "plus.app")
                            .renderingMode(.template)
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(Color("Detailed"))
                    }
                    .padding(.leading, 300)
                }
                Spacer()
                
                Button {
                    roundedRectangleButton.toggle()
                } label: {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray,lineWidth: 1.0)
                        .frame(width: 270, height: 250, alignment: .center)
                        .shadow(color:.black, radius: 0, x: 5, y: 5)
                        .overlay(
                            Text("Add your pet's photo here.")
                                .foregroundColor(Color(hue: 0.0, saturation: 0.0, brightness: 0.672))
                        )
                }
                .padding(.bottom)
                HStack(spacing: 120) {
                    Image("Dog")
                        .renderingMode(.template)
                        .resizable()
                        .foregroundColor(Color("Detailed"))
                        .frame(width: 90, height: 90)
                    
                    Image("Cat")
                        .renderingMode(.template)
                        .resizable()
                        .foregroundColor(Color("CareNotes"))
                        .frame(width: 90, height: 90)
                }
                Spacer()
            }
        }
    }
}

struct PhotoHomeView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoHomeView()
            .preferredColorScheme(.dark)
    }
}
