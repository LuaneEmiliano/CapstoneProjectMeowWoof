//
//  HealthJournalView.swift
//  CapstoneProjectMeowWoof
//
//  Created by luane Niejelski on 9/18/22.
//

import SwiftUI

struct HealthJournalRowView: View {
    let icon: String
    let text: String
    let image: String
    
    var body: some View {
        VStack {
            Image(image)
                .resizable()
                .frame(width: 90, height: 90)
                .padding()
                .background(Circle())
                .foregroundColor(Color(icon))
            Text(text)
                .font(.title3)
                .fontWeight(.regular)
                .foregroundColor(Color.universalColor)
        }
        .shadow(radius: 10)
    }
}

struct HealthJournalRowView_Previews: PreviewProvider {
    static var previews: some View {
        HealthJournalRowView(icon: "PetAlbum", text: "Feed Times", image: "bowl")
            .preferredColorScheme(.dark)
    }
}
