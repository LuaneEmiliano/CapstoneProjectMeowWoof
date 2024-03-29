//
//  AddView.swift
//  PetToDoListSwift
//
//  Created by luane Niejelski on 9/11/22.
//

import SwiftUI

struct AddNewItemView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ZStack {
            Color("Color2")
                .ignoresSafeArea()
            ScrollView {
                VStack {
                    TextField("Enter the new item...", text: $textFieldText)
                        .padding(.horizontal)
                        .frame( height: 55)
                        .background(Color.white)
                        .cornerRadius(10)
                    
                    Button(action: saveButtonPressed, label: {
                        Text("Save".uppercased())
                            .foregroundColor(.white)
                            .font(.headline)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(Color("ButtonColor"))
                            .cornerRadius(20)
                    })
                }
                .padding(15)
            }
            
            .navigationTitle("Add a new Item.")
        .alert(isPresented: $showAlert, content: getAlert )
            
        }

    }
    
    func saveButtonPressed() {
        if textIsAppropriate() {
            listViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Your new Pet To Do Item must be at least 3 characters 🐰"
            showAlert.toggle()
            return false
        }
        return true
    }
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}
struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddNewItemView()
        }
        .environmentObject(ListViewModel())
    }
}
