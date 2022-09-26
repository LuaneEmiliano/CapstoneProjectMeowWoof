//
//  HomeScreenView.swift
//  PetDiary
//
//  Created by luane Niejelski on 8/19/22.
//

import SwiftUI
//Onboarding Home Screen.
struct HomeScreenView: View {
    
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    
    var body: some View {
        ZStack {
            Rectangle()
                .edgesIgnoringSafeArea(.all)
                .foregroundColor(Color("BackgroundColor"))
            
            if verticalSizeClass == .regular && horizontalSizeClass == .compact {
                VStack {
                    Text("MEOW WOOF\nPet Diary")
                        .font(.largeTitle)
                        .bold()
                        .kerning(1.0)
                        .multilineTextAlignment(.center)
                        .lineSpacing(4.0)
                        .font(.largeTitle)
                        .padding(30)
                    
                    Image("PetsDiaryImage")
                    
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 250)
                        .cornerRadius(Constants.General.roundRecCornerRadius)
                        .shadow(radius: 10, x: 5, y: 5)
                    
                    HomeFeatureList()
                        .padding(.top)
                    Spacer()
                }
            }
            else {
                VStack {
                    Text("MEOW WOOF\nPet Diary")
                        .font(.largeTitle)
                        .bold()
                        .kerning(1.0)
                        .multilineTextAlignment(.center)
                        .lineSpacing(4.0)
                        .font(.largeTitle)
                        .padding(30)
                    
                    Spacer()
                    
                    HStack {
                        Image("PetsDiaryImage")
                        
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: 300)
                            .cornerRadius(Constants.General.roundRecCornerRadius)
                            .shadow(radius: 50, x: 20, y: 20)
                        HomeFeatureList()
                            .padding(.top)
                    }
                }
            }
        }
    }
}

struct HomeFeatureList : View {
    var body: some View {
        VStack {
            Text("App Features:")
                .bold()
                .kerning(2.0)
                .font(.title)
            
            
            ScrollView() {
                VStack(alignment: .leading, spacing: 10) {
                    
                    ForEach(appFeaturesList.indices, id: \.self) { index in
                        FeatureRowView(text: appFeaturesList[index], icon: "\(index+1).circle")
                            .font(.title)
                    }
                }
            }
            .padding(.leading,30)
            ButtonText()
        }
    }
}
struct FeatureRowView: View {
    var text: String
    var icon: String
    
    var body: some View {
        
        HStack {
            Image(systemName: icon)
            Text(text)
            Spacer()
        }
        .frame(maxWidth: .infinity)
    }
}
struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView()
        HomeScreenView()
        HomeScreenView()
            .previewLayout(.fixed(width: 568, height: 320))
        HomeScreenView()
            .preferredColorScheme(.dark)
        HomeScreenView()
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 568, height: 320))
        
    }
}
