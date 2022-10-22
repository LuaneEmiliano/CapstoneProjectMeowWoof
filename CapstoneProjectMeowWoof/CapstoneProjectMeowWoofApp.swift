//
//  CapstoneProjectMeowWoofApp.swift
//  CapstoneProjectMeowWoof
//
//  Created by luane Niejelski on 9/19/22.
//

import SwiftUI
import SDWebImageSwiftUI

@main
struct CapstoneProjectMeowWoofApp: App {
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    @StateObject var launchScreenManager = LaunchScreenManager()
    @StateObject var homework08 = DownloadImageAsyncViewModel()
    let persistenceController = PersistenceController.shared
    @StateObject var petsViewModel = PetViewModel()
    
    @State private var description: String?
        
//        private func getCookiesTapped() async {
//          func setDescription(for cookies: [HTTPCookie]? = nil) {
//            Task { @MainActor in
//              guard let cookies = cookies, !cookies.isEmpty else {
//                description = "Cookies: N/A"
//
//                return
//              }
//
//              var descriptionString = ""
//
//              for cookie in cookies {
//                descriptionString += "\(cookie.name): \(cookie.value)\n"
//              }
//
//              description = descriptionString
//                print(description ?? "")
//            }
//          }
//
//          guard let url = URL(string: "https://www.raywenderlich.com") else {
//            setDescription()
//
//            return
//          }
//
//          do {
//            let (_, response) = try await URLSession.shared.data(from: url)
//
//            guard let httpResponse = response as? HTTPURLResponse,
//              let fields = httpResponse.allHeaderFields as? [String: String]
//            else {
//              setDescription()
//
//              return
//            }
//
//            let cookies = HTTPCookie.cookies(withResponseHeaderFields: fields, for: url)
//
//            setDescription(for: cookies)
//          } catch {
//            setDescription()
//          }
//        }

    var body: some Scene {
        WindowGroup {
           ZStack {
               PetTabView()
//               PetInfoListView(pet: nil)
//                if launchScreenManager.state != .completed {
//               LaunchScreenView()
//                }
           }
            .environmentObject(listViewModel)
            .environmentObject(petsViewModel)
            .environmentObject(launchScreenManager)
            .environment(\.managedObjectContext, persistenceController.container.viewContext)
               }
            }
        }
//    }
//}
