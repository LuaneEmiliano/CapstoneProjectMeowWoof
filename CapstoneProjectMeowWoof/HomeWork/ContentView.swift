//
//  ContentView.swift
//  PetDiary
//
//  Created by luane Niejelski on 8/18/22.
//

import SwiftUI
//Present the Onboarding screen.
struct ContentView: View {
    @State var onboardingButton = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .edgesIgnoringSafeArea(.all)
                .foregroundColor(Color("BackgroundColor"))
            VStack {
                HStack{
                    VStack(alignment:.leading, spacing: 10){
                        WelcomeTextView(text: "Welcome,")
                        NameTextView(text: "Luane!")
                    }
                    Spacer()
                    Button {
                        onboardingButton = true
                        
                    } label: {
                        RoundedImageViewStroked(systemName: "arrow.forward.circle")
                    }
                    .sheet(isPresented: $onboardingButton) {
                        HomeScreenView()
                    }
                }
                .padding(30)
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .previewLayout(.fixed(width: 568, height: 320))
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 568, height: 320))
    }
}
