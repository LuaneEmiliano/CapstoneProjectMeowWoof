//
//  WideStyleActionButton.swift
//  CapstoneProjectMeowWoof
//
//  Created by luane Niejelski on 10/29/22.
//

import SwiftUI

struct WideStyleActionButton: View {
    
    let action: () -> Void
    let buttonText: String
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(buttonText)
        }

    }
}

//struct WideStyleActionButton_Previews: PreviewProvider {
//    static var previews: some View {
//        WideStyleActionButton(action: , buttonText: "Test")
//    }
//}
