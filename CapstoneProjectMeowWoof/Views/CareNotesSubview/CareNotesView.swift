//
//  CareNotesView.swift
//  CapstoneProjectMeowWoof
//
//  Created by luane Niejelski on 10/24/22.
//

import SwiftUI

struct CareNotesView: View {
    @EnvironmentObject var viewModel: PetViewModel
    let pet: Pet
    @State var textEditorText2: String
    @State var text = ""
    @AppStorage("STRING_KEY") var savedText = ""
    
    init(pet: Pet) {
        self.pet = pet
        self._textEditorText2 = State(initialValue: pet.careNotes)
    }
    
    var body: some View {
        VStack {
            TextEditor(text: $text)
                .border(Color.gray)
            
                .onChange(of: text) { text in
                    self.savedText = text
                }
                .onAppear {
                    self.text = savedText
                    print("Loaded: \(savedText)")
                    
                }
        }
        .padding()
        .padding(.bottom, 50)
        .navigationTitle("Care N❤️TES!")
    }
}

struct CareNotesView_Previews: PreviewProvider {
    static var previews: some View {
        CareNotesView(pet: Pet(name: "Luna"))
    }
}
