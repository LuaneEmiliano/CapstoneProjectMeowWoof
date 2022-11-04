//
//  ContentView.swift
//  CapstoneProjectMeowWoof
//
//  Created by luane Niejelski on 9/11/22.
//

import SwiftUI

struct ToDoListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        NavigationView {
            VStack {
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
            )
            .background(Color.todoListColor)
            .foregroundColor(Color.universalColor)
        }
    }
}
struct 🐶: PreviewProvider {
    static var previews: some View {
            ToDoListView()
                .environmentObject(ListViewModel())
        
                .preferredColorScheme(.dark)
    }
}


