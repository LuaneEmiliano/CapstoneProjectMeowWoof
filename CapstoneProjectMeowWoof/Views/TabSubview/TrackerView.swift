//
//  TrackerView.swift
//  MeowWoofPetDiary
//
//  Created by luane Niejelski on 9/17/22.
//

import SwiftUI
import UIKit

struct TrackerView: View {
    var body: some View {
        
        ScrollView {
            HStack(alignment:.bottom) {
                Text("Luna")
                    .fontWeight(.bold)
                    .foregroundColor(Color("ButtonColor"))
                    .padding(.leading, 30)
                    .font(.largeTitle)
                    
                Spacer()
                Text("9 years old")
                    .fontWeight(.bold)
                    .foregroundColor(Color("ButtonColor"))
                    .padding(.horizontal, 30)
            }
            // images for pets
              Image("Labrador")
                .resizable()
                .frame(width: 250, height: 250)
                .cornerRadius(20)
                .padding(.top,5)
                .shadow(color: Color(hue: 0.629, saturation: 0.272, brightness: 0.768), radius: 10, x: 10, y: 10)
                
                
            VStack{
                Rectangle()
                    .fill(Color("Color"))
                    .frame(width: 383, height: 60)
                    .cornerRadius(10)
                    .overlay(
                        HStack {
                            Text("Feed")
                                .font(.title2)
                                .fontWeight(.bold)
                            Spacer()
                            Image(("bowl")).renderingMode(.template)
                                .resizable().aspectRatio(contentMode: .fit)
                                .padding(7)
                        }
                            .padding(.horizontal, 30)
                            .foregroundColor(Color("ButtonColor"))
                    )
                Rectangle()
                    .fill(Color("Color2"))
                    .frame(width: 383, height: 60)
                    .cornerRadius(10)
                    .overlay(
                        HStack {
                            Text("Exercise")
                                .font(.title2)
                                .fontWeight(.bold)
                            Spacer()
                            Image(("Exercise"))
                                .renderingMode(.template)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(7)
                        }
                            .padding(.horizontal, 30)
                            .foregroundColor(Color("ButtonColor"))
                    )
                
                Rectangle()
                    .fill(Color("PetAlbum"))
                    .frame(width: 383, height: 60)
                    .cornerRadius(10)
                    .overlay(
                        HStack {
                            Text("Medication")
                                .font(.title2)
                                .fontWeight(.bold)
                            Spacer()
                            Image(("Medication"))
                                .renderingMode(.template)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(7)
                        }
                            .padding(.horizontal, 30)
                            .foregroundColor(Color("ButtonColor"))
                    )
                Rectangle()
                    .fill(Color("Outdoors"))
                    .frame(width: 383, height: 60)
                    .cornerRadius(10)
                    .overlay(
                        HStack {
                            Text("Growth")
                                .font(.title2)
                                .fontWeight(.bold)
                            Spacer()
                            Image(("Growth"))
                                .renderingMode(.template)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(7)
                        }
                            .padding(.horizontal, 30)
                            .foregroundColor(Color("ButtonColor"))
                    )
                Rectangle()
                    .fill(Color("PetAlbum"))
                    .frame(width: 383, height: 60)
                    .cornerRadius(10)
                    .overlay(
                        HStack {
                            Text("Bath")
                                .font(.title2)
                                .fontWeight(.bold)
                            Spacer()
                            Image(("Bath"))
                                .renderingMode(.template)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(7)
                        }
                            .padding(.horizontal, 30)
                            .foregroundColor(Color("ButtonColor"))
                    )
                Rectangle()
                    .fill(Color("Color2"))
                    .frame(width: 383, height: 70)
                    .cornerRadius(10)
                    .overlay(
                        HStack {
                            Text("Exercise")
                                .font(.title2)
                                .fontWeight(.bold)
                            Spacer()
                            Image(("Exercise"))
                                .renderingMode(.template)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(7)
                        }
                            .foregroundColor(Color("ButtonColor"))
                            .padding(.horizontal, 30)
                        )
                Rectangle()
                    .fill(Color("PetAlbum"))
                    .frame(width: 383, height: 70)
                    .cornerRadius(10)
                    .overlay(
                        HStack {
                            Text("Hair")
                                .font(.title2)
                                .fontWeight(.bold)
                            Spacer()
                            Image(("Hair"))
                                .renderingMode(.template)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(7)
                        }
                            .padding(.horizontal, 30)
                            .foregroundColor(Color("ButtonColor"))
                    )
            }
            
        }
    }
}

struct TrackerView_Previews: PreviewProvider {
    static var previews: some View {
        TrackerView()
    }
}
