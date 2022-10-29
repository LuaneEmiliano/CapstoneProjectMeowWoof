//
//  FullScreenImageView.swift
//  CapstoneProjectMeowWoof
//
//  Created by luane Niejelski on 10/29/22.
//

import SwiftUI

struct FullScreenImageView: View {
    let image: UIImage
    var body: some View {
        Image(uiImage: image)
            .resizable()
            .scaledToFit()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct FullScreenImageView_Previews: PreviewProvider {
    static var previews: some View {
        FullScreenImageView(image: UIImage())
    }
}
