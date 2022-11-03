//
//  NoItemsView.swift
//  PetToDoListSwift
//
//  Created by luane Niejelski on 9/11/22.
//

import SwiftUI

struct NoItemsAddedView: View {
    
    @State var animate: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Text("There are no items added yet!")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Get more Done with your pet! Let's add items on the ToDoList now! 🐱")
                NavigationLink (
                    destination: AddNewItemView(),
                 label: {
                    Text("Add something...")
                         .foregroundColor(Color.blackColor)
                         .font(.headline)
                         .frame(height: 55)
                         .frame(maxWidth: .infinity)
                         .background(Color.petAlbum)
                         .cornerRadius(10)
                })

            }
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("TextColor"))
    }
    
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(.easeInOut) {
                animate.toggle()
            }
        }
    }
}

struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NoItemsAddedView()
                .navigationTitle("Title")
        }
    }
}
