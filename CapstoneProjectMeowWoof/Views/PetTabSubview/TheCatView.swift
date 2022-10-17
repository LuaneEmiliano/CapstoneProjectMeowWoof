//
//  ContentView.swift
//  Week09 Homework
//
//  Created by luane Niejelski on 10/15/22.
//

import SwiftUI
import CoreData

struct TheCatView: View {
    
    @StateObject private var viewModel = DownloadAsyncViewModel()
    @StateObject var taskStore = TheCatFileManagerViewModel()
    let theCatFetchRequest = TheCat.basicFetchRequest()
    var theCats: FetchedResults<TheCat> {
        theCatFetchRequest.wrappedValue
    }
    let viewContext = PersistenceController.shared.container.viewContext
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(theCats, id: \.self) { woof in
                    HStack {
                        Text(woof.name)
                        Text(String(woof.energyLevel))
                    }
                    
                }
            }
        }
        .onAppear {
            Task {
                await viewModel.fetchAsync()
                if !viewModel.elementViewModel.isEmpty {
                    taskStore.meowWoof = viewModel.elementViewModel
                    for cat in viewModel.elementViewModel {
                        TheCat.createWith(
                            name: cat.name,
                            childFriendly: Int32(cat.childFriendly),
                            dogFriendly: Int32(cat.dogFriendly ?? 0),
                            energyLevel: Int32(cat.energyLevel ?? 0),
                            temperament: cat.temperament,
                            using: viewContext)
                    }
                    print("Data merging into file manager function")
                } else {
                    print("No data was found in api call")
                }
                
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TheCatView()
    }
}
