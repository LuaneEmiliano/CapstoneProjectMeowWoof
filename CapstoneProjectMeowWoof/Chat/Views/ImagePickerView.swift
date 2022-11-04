//
//  ImagePickerView.swift
//  CapstoneProjectMeowWoof
//
//  Created by luane Niejelski on 10/1/22.
//

import SwiftUI

struct ImagePickerView: View {
    
    @State var isPickerShowing = false
    @Binding var selectedImage: UIImage?
    let id: String
    let text: String
    let iconImage: String
    
    var body: some View {
        
        Button {
            isPickerShowing = true
        } label: {
            VStack {
                if let selectedImage = selectedImage {
                    Image(uiImage: selectedImage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 150, height: 150)
                        .cornerRadius(75)
                        .background(
                            RoundedRectangle(cornerRadius: 75)
                                .stroke(lineWidth: 5)
                                .foregroundColor(.primary)
                        )
                } else {
                    Image(systemName: iconImage)
                        .font(.system(size: 64))
                        .padding()
                        .foregroundColor(.primary)
                }
                Text(text)
                    .foregroundColor(.primary)
            }
        }
        .sheet(isPresented: $isPickerShowing) {
            
        } content: {
            ImagePicker(image: $selectedImage)
        }
        
    }
}

struct ImagePickerView_Previews: PreviewProvider {
    static var previews: some View {
        ImagePickerView(selectedImage: .constant(nil), id: "test", text: "Select a Main  Photo", iconImage: "person.fill")
    }
}
