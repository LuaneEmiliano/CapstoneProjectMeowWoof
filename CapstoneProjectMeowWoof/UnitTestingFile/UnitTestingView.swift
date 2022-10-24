//
//  UnitTestingView.swift
//  CapstoneProjectMeowWoof
//
//  Created by luane Niejelski on 10/23/22.
//

import SwiftUI
import SDWebImageSwiftUI


struct UnitTestingView: View {
    
    @StateObject private var vm: UnitTestingViewModel
    
    init(isPremium: Bool ) {
        _vm = StateObject(wrappedValue: UnitTestingViewModel(isPremium: isPremium))
    }
    
    var body: some View {
        Text(vm.isPremium.description)
    }
}

struct UnitTestingView_Previews: PreviewProvider {
    static var previews: some View {
        UnitTestingView(isPremium: true)
    }
}
