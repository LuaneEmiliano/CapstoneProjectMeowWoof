//
//  TextViews.swift
//  PetDiary
//
//  Created by luane Niejelski on 8/18/22.
//

import SwiftUI

struct WelcomeTextView: View {
    var text: String
    
    var body: some View {
        Text(text)
            .kerning(2.0)
            .foregroundColor(Color("TextColor"))
            .bold()
            .font(.largeTitle)
    }
}

struct NameTextView: View {
    var text: String
    
    var body: some View {
        
        Text(text)
            .kerning(2.0)
            .foregroundColor(Color("TextColor"))
            .font(.largeTitle)
    }
}

struct PetDiaryView: View {
    var text: String
    
    var body: some View {
        
        Text(text.uppercased())
            .bold()
            .kerning(2.0)
            .lineSpacing(4.0)
            .multilineTextAlignment(.center)
            .font(.largeTitle)
            .foregroundColor(Color("TextColor"))
    }
}

struct TodoListView: View {
    var text: String
    
    var body: some View {
        
        Text(text)
            .kerning(2.0)
            .lineSpacing(4.0)
            .foregroundColor(Color("TextColor"))
            .font(.title3)
    }
}

struct ButtonContinueView: View {
    var text: String
    
    var body: some View {
        Text(text)
            .bold()
            .padding()
            .frame(maxWidth: .infinity)
            .background(
                Color("ButtonColor")
            )
            .foregroundColor(.white)
            .cornerRadius(12.0)
    }
}

struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            WelcomeTextView(text: "Welcome,")
            NameTextView(text: "Luane!")
            PetDiaryView(text: "PetDiary")
            TodoListView(text: "Features List!")
            ButtonContinueView(text: "Continue")
        }
        .padding()
    }
}
