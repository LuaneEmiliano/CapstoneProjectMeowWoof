//
//  DataResponseManager.swift
//  Week09 Homework
//
//  Created by luane Niejelski on 10/15/22.
//

import Foundation
import SwiftUI

// MARK: Data Response Handling - Do not change

class DownloadAsyncLoader {
    
    func handleResponse(data: Data?, response: URLResponse?) -> Data? {
        guard
            let data = data,
            let response = response as? HTTPURLResponse,
            response.statusCode >= 200 && response.statusCode < 300 else {
                print("response status code problem: \(String(describing: response))")
                return nil
            }
        return data
    }
    
    func downloadWithAsync(url: String) async throws -> Data? {
        
        guard let url = URL(string: url) else {
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


