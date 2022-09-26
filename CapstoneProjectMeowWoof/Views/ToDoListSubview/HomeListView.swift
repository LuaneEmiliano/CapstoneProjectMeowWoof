//
//  ContentView.swift
//  PetToDoListSwift
//
//  Created by luane Niejelski on 9/11/22.
//

import SwiftUI

struct HomeListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                if listViewModel.items.isEmpty {
                    NoItemsAddedView()
                } else {
                    List {
                        ForEach(listViewModel.items) { item in
                            ListRowView(item: item)
                                .onTapGesture {
                                    withAnimation(.linear) {
                                        listViewModel.updateItem(item: item)
                                    }
                                }
                        }
                        .onDelete(perform: listViewModel.deleteItem)
                        .onMove (perform: listViewModel.moveItem)
                        .listRowBackground(Color.red.opacity(0.0))
                    }
                    .listStyle(PlainListStyle())
                }
            }
            
            .listStyle(PlainListStyle())
            .navigationTitle("Pet To Do List 🐶")
            .navigationBarItems(leading: EditButton(),
                                trailing:
                                    NavigationLink("Add", destination:AddNewItemView())
                                    .foregroundColor(.black)
            )
            .foregroundColor(Color("ButtonColor"))
        .background(Color("Color2"))
        }
    }
}
struct 🐶: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeListView()
        }
        .environmentObject(ListViewModel())
    }
}


