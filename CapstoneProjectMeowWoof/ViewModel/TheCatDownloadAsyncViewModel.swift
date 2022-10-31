//
//  DownloadAsyncViewModel.swift
//  Week09 Homework
//
//  Created by luane Niejelski on 10/15/22.
//

import Foundation

// MARK: Data specific to url - modify here for new urls

let apiKey = "4662cc3b-d8f9-4737-8e96-e09b82ed2de9"

let theCatURL = "https://api.thecatapi.com/v1/breeds?attach_breed=0%27%20--header%20%27x-api-key:%204662cc3b-d8f9-4737-8e96-e09b82ed2de9"


@MainActor
class DownloadAsyncViewModel: ObservableObject {
    
    let url = theCatURL
    
    @Published var elementViewModel: [CatModel] = []
    let loader = DownloadAsyncLoader()
    
    
    func fetchAsync() async {
        // with async await
        guard let data = try? await loader.downloadWithAsync(url: url) else {
            return
        }
        
        let decodedData = modelDataDecoder(data: data)
        
        await MainActor.run {
            elementViewModel = decodedData
            
        }
    }
    
    func modelDataDecoder(data: Data) -> [CatModel] {
        
        let decoder = JSONDecoder()
        guard let welcome = try? decoder.decode(Welcome.self, from: data) else { return [] }
        let animal: [CatModel] = welcome
        return animal
    }
}
