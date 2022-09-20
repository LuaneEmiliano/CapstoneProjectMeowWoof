//
//  RoundViews.swift
//  PetDiary
//
//  Created by luane Niejelski on 8/18/22.
//

import SwiftUI

struct RoundedImageViewStroked: View {
    var systemName: String
    
    var body: some View {
        Image(systemName: systemName)
            .font(.system(size: 50))
            .foregroundColor(Color("ButtonColor"))
            .padding(.bottom)
    }
}

struct RoundViews_Previews: PreviewProvider {
    static var previews: some View {
        RoundedImageViewStroked(systemName: "arrow.forward.circle")
    }
}
