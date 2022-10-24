//
//  UnitTestingViewModel.swift
//  CapstoneProjectMeowWoof
//
//  Created by luane Niejelski on 10/23/22.
//

import Foundation
import SwiftUI

class UnitTestingViewModel: ObservableObject {
    @Published var isPremium: Bool
    @Published var dataArray: [String] = []
    
    init(isPremium: Bool) {
        self.isPremium = isPremium
    }
}
