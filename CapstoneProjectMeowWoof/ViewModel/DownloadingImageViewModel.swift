//
//  HomeworkWeek08.swift
//  CapstoneProjectMeowWoof
//
//  Created by luane Niejelski on 10/8/22.
//

import Foundation
import SwiftUI

class DownloadImageAsyncImageLoader {
    
    
    func handleResponse(data: Data?, response: URLResponse?) -> Data? {
        guard
            let data = data,
            //            let dataString = String(data: data, encoding: .utf8),
            let response = response as? HTTPURLResponse,
            response.statusCode >= 200 && response.statusCode < 300 else {
                print("response status code problem: \(String(describing: response))")
                return nil
            }
        return data
    }
    
    func downloadWithAsync() async throws -> Data? {
        
        guard let url = URL(string: "http://api.thecatapi.com/v1/breeds?attach_breed=0") else {
            return nil
        }
        
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        
        do {
            let (data, response) = try await session.data(from: url)
            return handleResponse(data: data, response: response)
        } catch {
            print("error handling data response")
            throw error
        }
    }
}

class DownloadImageAsyncViewModel: ObservableObject {
    
    @Published var text: String? = nil
    let loader = DownloadImageAsyncImageLoader()
    
    func fetchImageAsync() async {
        // with async await
        let text = try? await loader.downloadWithAsync()
        let dataString = String(data: text ?? Data(), encoding: .utf8)
        await MainActor.run {
            self.text = dataString
            if let text = text {
                print("🖐🏻 Data downloaded: \(text)")
            }
        }
    }
}
