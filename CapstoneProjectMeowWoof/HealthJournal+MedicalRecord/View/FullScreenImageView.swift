//
//  FullScreenImageView.swift
//  CapstoneProjectMeowWoof
//
//  Created by luane Niejelski on 10/29/22.
//

import SwiftUI

struct FullScreenImageView: View {
    let image: UIImage
    @State var currentAmount: CGFloat = 0
    
    var body: some View {
        Image(uiImage: image)
            .resizable()
            .scaledToFit()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .gesture(
            MagnificationGesture()
                .onChanged({ value  in
                    currentAmount = value - 1
                }
            )
            
            )
    }
}

struct FullScreenImageView_Previews: PreviewProvider {
    static var previews: some View {
        FullScreenImageView(image: UIImage())
    }
}
