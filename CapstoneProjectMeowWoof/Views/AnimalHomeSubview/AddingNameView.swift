//
//  AddingNameView.swift
//  CapstoneProjectMeowWoof
//
//  Created by luane Niejelski on 9/24/22.
//

import SwiftUI

struct AddingNameView: View {
    
    @State var textFieldText: String = ""
    @State var dataArray: [String] = []
    
    var body: some View {
        NavigationView{
            VStack {
                Text("What's your pet's name?")
                    .font(.title)
                    .fontWeight(.semibold)
                Spacer()
                TextField("Enter your pet's name here...", text: $textFieldText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .font(.headline)
                Button {
                    if isTextApropriate() {
                        saveText()
                        // Using Singleton
                        SoundManager.instance.playSound()
                    }
                } label: {
                    Text("NEXT")
                        .padding(.horizontal, 157)
                        .padding(.vertical, 15)
                        .background(isTextApropriate() ? Color("ButtonColor") : Color.gray)
                        .cornerRadius(10)
                        .foregroundColor(Color.white)
                        .font(.headline)
                }
                ForEach(dataArray, id: \.self) { data in
                    Text(data)
                }
                Spacer()
            }
        }
    }
    
    func saveText() {
        dataArray.append(textFieldText)
        textFieldText = ""
    }
    
    func isTextApropriate() -> Bool {
        if textFieldText.count >= 3 {
            return true
        }
        return false
    }
}

struct AddingNameView_Previews: PreviewProvider {
    static var previews: some View {
        AddingNameView()
    }
}
